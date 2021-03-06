// TB14.bsv - A testbench for WSICaptureWorker
// Copyright (c) 2011 Atomic Rules LLC - ALL RIGHTS RESERVED

import OCWip            ::*;
import WSICaptureWorker ::*;

import Connectable::*;
import GetPut::*;
import StmtFSM::*;

(* synthesize *)
module mkTB14();

  Reg#(Bit#(16))              simCycle       <- mkReg(0);       // simulation cycle counter
  WciEMasterIfc#(20,32)       wci            <- mkWciEMaster;   // WCI-OCP-Master convienenice logic
  WsiMasterIfc#(12,32,4,8,0)  wsiM           <- mkWsiMaster;    // WSI-OCP-Master convienenice logic
  WtiMasterIfc#(64)           wtiM           <- mkWtiMaster;    // WTI time source

  WSICaptureWorker4BIfc       captWorker     <- mkWSICaptureWorker(True, reset_by wci.mas.mReset_n);   // instance the captWorker DUT

  Reg#(Bool)                  enWsiSource    <- mkReg(False);   // Trigger for WSI generator
  Reg#(Bool)                  testOperating  <- mkReg(False);   // Enable for test Operating
  Reg#(Bit#(16))              srcMesgCount   <- mkReg(0);       // Number of Messages sent
  Reg#(Bit#(16))              srcUnrollCnt   <- mkReg(0);       // Message Positions to go
  Reg#(Bit#(32))              srcDataOut     <- mkReg(0);       // DWORD ordinal count
  Reg#(Bit#(8))               srcOpcode      <- mkReg(0);       // Src Opcode 
  Reg#(Bit#(16))              srcMesgLen     <- mkReg(16);      // Src Message Length (words)

  mkConnection(wci.mas,  captWorker.wciS0);             // connect the WCI Master to the DUT
  mkConnection(toWsiEM(wsiM.mas), captWorker.wsiS0);    // connect the Source wsiM to the captWorker wsi-S input

  rule driveNow;
    wtiM.reqPut.put( WtiReq{cmd:WR, data:extend(simCycle)});
  endrule

  mkConnection(wtiM.mas, captWorker.wtiS0);

  // WCI Interaction
  // A sequence of control-configuration operartions to be performed...
  Stmt wciSeq = 
  seq
    $display("[%0d]: %m: Checking for DUT presence...", $time);
    await(wci.present);

    $display("[%0d]: %m: Taking DUT out of Reset...", $time);
    wci.req(Admin, True,  20'h00_0024, 'h8000_0004, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: CONTROL-OP: -INITIALIZE- DUT...", $time);
    wci.req(Control, False, 20'h00_0000, ?, ?);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Write Dataplane Config Properties...", $time);
    wci.req(Config, True, 20'h00_0000, 32'h0000_0000, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Dataplane Config Properties...", $time);
    wci.req(Config, False, 20'h00_0000, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Status Register...", $time);
    wci.req(Config, False, 20'h00_000C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: CONTROL-OP: -START- DUT...", $time);
    wci.req(Control, False, 20'h00_0004, ?, ?);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Write Capture Enable Bit", $time);
    wci.req(Config, True, 20'h00_0000, 32'h0000_0001, 'hF);
    action let r <- wci.resp; endaction

    srcUnrollCnt  <= srcMesgLen;
    testOperating <= True;
    enWsiSource   <= True;
  endseq;
  FSM  wciSeqFsm  <- mkFSM(wciSeq);
  Once wciSeqOnce <- mkOnce(wciSeqFsm.start);

  // Start of the WCI sequence...
  rule runWciSeq;
    wciSeqOnce.start;
  endrule

  Stmt wciDumpSeq = 
  seq
    $display("[%0d]: %m: Read Dataplane Config Properties: controlReg", $time);
    wci.req(Config, False, 20'h00_0000, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Dataplane Config Properties: metaCount", $time);
    wci.req(Config, False, 20'h00_0004, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Dataplane Config Properties: dataCount", $time);
    wci.req(Config, False, 20'h00_0008, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Dataplane Config Properties: statusReg", $time);
    wci.req(Config, False, 20'h00_000C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Setting Worker Control Page Register to 'h800...", $time);
    wci.req(Admin, True,  20'h00_0030, 'h0000_0800, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0000, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0004, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0008, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_000C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0010, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0014, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0018, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_001C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0020, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0024, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0028, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_002C, ?, 'hF);
    action let r <- wci.resp; endaction


    $display("[%0d]: %m: Setting Worker Control Page Register to 'h400...", $time);
    wci.req(Admin, True,  20'h00_0030, 'h0000_0400, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0000, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0004, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0008, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_000C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0010, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0014, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0018, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_001C, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0020, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0024, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_0028, ?, 'hF);
    action let r <- wci.resp; endaction

    $display("[%0d]: %m: Read Data Buffer", $time);
    wci.req(Config, False, 20'h00_002C, ?, 'hF);
    action let r <- wci.resp; endaction



  endseq;
  FSM  wciDumpSeqFsm  <- mkFSM(wciDumpSeq);
  Once wciDumpSeqOnce <- mkOnce(wciDumpSeqFsm.start);

  // Start of the WCI sequence...
  rule runWciDumpSeq (simCycle==200);
    wciDumpSeqOnce.start;
  endrule


  // This rule inhibits dataflow on the WSI ports until the WCI port isOperating...
  rule operating_actions (testOperating);
    wsiM.operate();
  endrule

  Bit#(16) numSrcMessages = 3;

  // WSI Interaction
  // Producer Stream...
  rule wsi_source (enWsiSource && (srcMesgCount < numSrcMessages));
    Bool lastWord  = (srcUnrollCnt == 1);
    wsiM.reqPut.put (WsiReq    {cmd  : WR ,
                             reqLast : lastWord,
                             reqInfo : srcOpcode,
                        burstPrecise : True,
                         burstLength : truncate(srcMesgLen),
                               data  : srcDataOut,
                             byteEn  : '1,
                           dataInfo  : '0 });
    srcDataOut  <= srcDataOut  + 1;
    if (lastWord) begin
      srcMesgCount <= srcMesgCount + 1;
      $display("[%0d]: %m: wsi_source: End of WSI Producer Egress: srcMesgCount:%0x srcOpcode:%0x srcMesgLen:%0x", $time, srcMesgCount, srcOpcode, srcMesgLen);
      srcMesgLen   <= srcMesgLen + 4;
      srcUnrollCnt <= srcMesgLen + 4;
      srcOpcode <= srcOpcode + 1;
    end else begin
      srcUnrollCnt <= srcUnrollCnt - 1;
    end
  endrule

  // Simulation Control...
  rule increment_simCycle;
    simCycle <= simCycle + 1;
  endrule

  rule terminate (simCycle==500);
    $display("[%0d]: %m: mkTB14 termination", $time);
    if (True)            $display("mkTB14 PASSED OK");
    else                 $display("mkTB14 had %d ERRORS and FAILED", 42);
    $finish;
  endrule

endmodule: mkTB14

