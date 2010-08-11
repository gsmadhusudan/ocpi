// OCApp.bsv
// Copyright (c) 2009-2010 Atomic Rules LLC - ALL RIGHTS RESERVED

package OCApp;

import OCWip::*;

import DelayWorker::*;
import SMAdapter::*;
import Config::*;

import Clocks::*;
import FIFO::*;
import Vector::*;
import GetPut::*;
import ClientServer::*;
import Connectable::*;

// nWci - number of Wci Worker Control Links
// nWmi - number of WMI Interfaces
// Using numeric types, not types, so this is Polymorphic, unlike OCInf 

interface OCAppIfc#(numeric type nWci, numeric type nWmi, numeric type nWmemi);
  interface Vector#(nWci,Wci_Es#(20)) wci_s;
  interface WmiEM4B                   wmiM0;
  interface WmiEM4B                   wmiM1;
  interface WmemiEM16B                wmemiM;
  interface WsiES4B                   wsi_s_adc;
  interface WsiEM4B                   wsi_m_dac;
endinterface

module mkOCApp_poly#(Vector#(nWci, Reset) rst, parameter Bool hasDebugLogic) (OCAppIfc#(nWci,nWmi,nWmemi));

  // Instance the workers in this application container...
  SMAdapter4BIfc    appW2    <-  mkSMAdapter4B  (32'h00000001, hasDebugLogic, reset_by(rst[2])); // Read WMI to WSI-M 
  DelayWorker4BIfc  appW3    <-  mkDelayWorker4B(32'h00000000, hasDebugLogic, reset_by(rst[3])); // Delay ahead of first SMAdapter
  SMAdapter4BIfc    appW4    <-  mkSMAdapter4B  (32'h00000002, hasDebugLogic, reset_by(rst[4])); // WSI-S to WMI Write

  // TODO: Use Default for tieOff...
  Wci_Es#(20) tieOff0  <- mkWciSlaveENull;
  Wci_Es#(20) tieOff1  <- mkWciSlaveENull;
  Wci_Es#(20) tieOff5  <- mkWciSlaveENull;
  Wci_Es#(20) tieOff6  <- mkWciSlaveENull;
  Wci_Es#(20) tieOff7  <- mkWciSlaveENull;

  // Connect each worker to its WCI...
  Vector#(nWci,Wci_Es#(20)) vWci;
  vWci[0] = tieOff0;
  vWci[1] = tieOff1;
  vWci[2] = appW2.wciS0;
  vWci[3] = appW3.wciS0;
  vWci[4] = appW4.wciS0;
  vWci[5] = tieOff5;
  vWci[6] = tieOff6;
  vWci[7] = tieOff7;

  // Connect co-located WSI ports...
  mkConnection(appW2.wsiM1, appW3.wsiS1);  // W2 SMAdapter WSI-M1   feeding W3 DelayWorker WSI-S1
  mkConnection(appW3.wsiM1, appW4.wsiS1);  // W3 DelayWorker WSI-M1 feeding W4 SMAdapter WSI-S1

  interface wci_s     = vWci;

  // Connect appropriate workers to their WMI...
  interface wmiM0     = appW2.wmiM;
  interface wmiM1     = appW4.wmiM;

  // Connect appropriate workers to their Wmemi...
  interface wmemiM    = appW3.wmemiM;  // W3 DelayWroker Wmemi connect

  interface wsi_s_adc = appW2.wsiS1;  // The ADC data to the   W2 SMAdapter WSI-S1 Slave Port
  interface wsi_m_dac = appW4.wsiM1;  // The DAC data from the W4 SMAdapter WSI-M1 Master Port

endmodule : mkOCApp_poly

(* synthesize *)
module mkOCApp#(Vector#(Nwci_app, Reset) rst, parameter Bool hasDebugLogic) (OCAppIfc#(Nwci_app,Nwmi,Nwmemi));
   (*hide*)
   let _ifc <- mkOCApp_poly(rst, hasDebugLogic);
   return _ifc;
endmodule: mkOCApp

endpackage: OCApp