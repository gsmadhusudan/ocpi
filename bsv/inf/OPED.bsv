// OPED.bsv
// Copyright (c) 2010 Atomic Rules LLC - ALL RIGHTS RESERVED

// Infrastucture Imports...
import Config            ::*;
import OCWip             ::*;
import OCCP              ::*;
import OCDP              ::*;
import PCIE              ::*;
import PCIEwrap          ::*;
import TimeService       ::*;
import TLPMF             ::*;
import UNoC              ::*;
import ARAXI             ::*;
import WCIS2AL4M         ::*;
import WSIAXIS           ::*;
import SMAdapter         ::*;
import BiasWorker        ::*;

// BSV Imports...
import Clocks            ::*;
import ClientServer      ::*;
import Connectable       ::*;
import DefaultValue      ::*;
import FIFO              ::*;
import GetPut            ::*;
import Vector            ::*;

interface OPEDIfc#(numeric type lanes);
  interface PCIE_EXP#(lanes)       pcie;
  interface Clock                  p125clk;
  interface Reset                  p125rst;
  interface A4L_Em                 axi4m;    // The AXI4-Lite Master
  interface A4SEM32B               axisM;    // The AXI-4-Stream Master
  interface A4SES32B               axisS;    // The AXI-4-Stream Slave
  (*always_ready*) method Bit#(32) debug;
endinterface: OPEDIfc

(* synthesize, no_default_clock, no_default_reset, clock_prefix="" *)
module mkOPEDv5#(Clock pci0_clkp, Clock pci0_clkn, Reset pci0_rstn) (OPEDIfc#(8));
  OPEDIfc#(8) _a <- mkOPED("V5",pci0_clkp,pci0_clkn,pci0_rstn); return _a;
endmodule

(* synthesize, no_default_clock, no_default_reset, clock_prefix="" *)
module mkOPEDv6#(Clock pci0_clkp, Clock pci0_clkn, Reset pci0_rstn) (OPEDIfc#(4));
  OPEDIfc#(4) _a <- mkOPED("V6",pci0_clkp,pci0_clkn,pci0_rstn); return _a;
endmodule

// This top-level wrapper module has no default clock or reset...
module mkOPED#(String family, Clock pci0_clkp, Clock pci0_clkn, Reset pci0_rstn)(OPEDIfc#(lanes)) provisos(Add#(1,z,lanes));
  PCIEwrapIfc#(lanes) pciw  <- mkPCIEwrap(family,pci0_clkp, pci0_clkn, pci0_rstn);
  Clock p125Clk = pciw.pClk;
  Reset p125Rst = pciw.pRst;
  Bool hasDebugLogic = True;

  // This is the inner body of mkOPED, which enjoys having the default 125 MHz Clock and Reset provided...
  module mkOPED_inner (OPEDIfc#(lanes)) provisos(Add#(1,z,lanes));
    Reg#(PciId)          pciDevice  <- mkReg(unpack(0));
    (* fire_when_enabled, no_implicit_conditions *) rule pdev; pciDevice <= pciw.device; endrule
    UNoCIfc              noc        <- mkUNoC;                              // uNoC Network-on-Chip
    OCCPIfc#(Nwcit)      cp         <- mkOCCP(pciDevice, p125Clk, p125Rst); // Control Plane

    Vector#(15,Wci_Em#(20)) vWci; vWci = cp.wci_Vm; // splay apart the individual Reset signals from the Control Plane
    Vector#(15, Reset) rst = newVector; for (Integer i=0; i<15; i=i+1) rst[i] = vWci[i].mReset_n;

    WCIS2A4LMIfc  wci2axi <- mkWCIS2A4LM(hasDebugLogic,reset_by rst[0]);           // W0: WCI to AXI4-Lite Bridge
    mkConnection(vWci[0], wci2axi.wciS0);                                          // Connect the WCI to W0, the wci2axi bridge
    OCDP4BIfc dp0 <- mkOCDP(insertFNum(pciDevice,0),False,True, reset_by rst[13]); // W13: data-plane fabric consumer PULL Only
    OCDP4BIfc dp1 <- mkOCDP(insertFNum(pciDevice,1),True,False, reset_by rst[14]); // W14: data-plane fabric producer PUSH Only
    mkConnection(vWci[13], dp0.wci_s);
    mkConnection(vWci[14], dp1.wci_s);

    mkConnection(pciw.client, noc.fab);   // PCIe to uNoC
    mkConnection(noc.cp,    cp.server);   // uNoC to Control Plane
    mkConnection(noc.dp0,   dp0.server);  // uNoC to Data Plane 0
    mkConnection(noc.dp1,   dp1.server);  // uNoC to Data Plane 1

    //TODO: For now, instance the usual SMAdapater->BiasWorker->SMAdapter to allow DMA streaming and loopback testing
    //At a later date, this will be hooked up to the AXI4-Stream Interfaces
    SMAdapter4BIfc  appW2  <-  mkSMAdapter4B   (32'h00000001, hasDebugLogic, reset_by rst[2]); // W2: Read WMI to WSI-M 
    BiasWorker4BIfc appW3  <-  mkBiasWorker4B  (              hasDebugLogic, reset_by rst[3]); // W3: Delay ahead of first SMAdapter
    SMAdapter4BIfc  appW4  <-  mkSMAdapter4B   (32'h00000002, hasDebugLogic, reset_by rst[4]); // W4: WSI-S to WMI Write
    mkConnection(vWci[2], appW2.wciS0);
    mkConnection(vWci[3], appW3.wciS0);
    mkConnection(vWci[4], appW4.wciS0);

    mkConnection(appW2.wmiM,  dp0.wmiS0);    // W2<->DP0
    mkConnection(appW2.wsiM0, appW3.wsiS0);  // W2 SMAdapter WSI-M0   feeding W3 BiasWorker WSI-S0
    mkConnection(appW3.wsiM0, appW4.wsiS0);  // W3 BiasWorker WSI-M0 feeding W4 SMAdapter WSI-S0
    mkConnection(appW4.wmiM,  dp1.wmiS0);    // W4<->DP1

    WSItoAXIS32BIfc wsi2axis <- mkWSItoAXIS32B; 
    AXIStoWSI32BIfc axis2wsi <- mkAXIStoWSI32B;
    // We need to add the width adaaption, then connect these to the SMAdapers instead...
    mkConnection(axis2wsi.wsi, wsi2axis.wsi); // TODO: Temporary internal loopback of external AXIS path (to connect logic)

    A4L_Em a4lm <- mkA4MtoEm(wci2axi.axiM0); // Expand the 5 concise AXI BusSend/Recv channels to explicit signals

    interface PCI_EXP  pcie    = pciw.pcie;
    interface Clock    p125clk = pciw.pClk;
    interface Reset    p125rst = pciw.pRst;
    interface A4L_Em   axi4m   = a4lm;
    interface A4SEM32B axisM   = wsi2axis.axi;
    interface A4SES32B axisS   = axis2wsi.axi;
    method Bit#(32)    debug   = extend(pack(pciw.linkUp));
  endmodule: mkOPED_inner

  OPEDIfc#(lanes) _b  <- mkOPED_inner(clocked_by p125Clk, reset_by p125Rst); return _b; // Instance wrapped inner module

endmodule: mkOPED
