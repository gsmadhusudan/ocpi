// FTop_n210.bsv - Top Level for N210 OpenCPI Platform
// Copyright (c) 2012 Atomic Rules LLC - ALL RIGHTS RESERVED

// Application Imports...
//import Config            ::*;
//import CPDefs            ::*;
//import CTop              ::*;
//import GMAC              ::*;
//import MDIO              ::*;
//import FlashWorker       ::*;
//import GbeWorker         ::*;
//import ICAPWorker        ::*;
//import OCWip             ::*;
//import SPICore32         ::*;
//import SPICore5          ::*;
//import TimeService       ::*;
//import WSICaptureWorker  ::*;
//import WsiAdapter        ::*;
//import XilinxExtra       ::*;
//import ProtocolMonitor   ::*;

// BSV Imports...
import Clocks            ::*;
import ClientServer      ::*;
import Connectable       ::*;
import DefaultValue      ::*;
import FIFO              ::*;
import GetPut            ::*;
import Gray              ::*;
import TieOff            ::*;
import Vector            ::*;
import XilinxCells       ::*;

/* Front-Panel LED Encoding
| A(4)tx   | B(1)mimo |
| C(3)rx   | D(0)firm |
| E(2)ref  | F(-)cpld |
*/


(* always_ready, always_enabled *)
interface FTop_n210Ifc;
  method Bit#(5)   led;
  method Bit#(32)  debug;
  interface Reset  sysRst;
endinterface: FTop_n210Ifc

(* synthesize, no_default_clock, no_default_reset, clock_prefix="", reset_prefix="" *)
module mkFTop_n210#(Clock sys0_clkp, Clock sys0_clkn,  // 100 MHz Board XO Reference
                    Reset fpga_rstn)
                    (FTop_n210Ifc);

  Clock            sys0_clk   <- mkClockIBUFDS(sys0_clkp, sys0_clkn);
  Reset            sys0_rst   <- mkAsyncReset(2, fpga_rstn , sys0_clk);
  Reg#(Bit#(32))   freeCnt    <- mkReg(0,    clocked_by sys0_clk, reset_by sys0_rst);
  Reg#(Bool)       doInit     <- mkReg(True, clocked_by sys0_clk, reset_by sys0_rst);

  rule inc_freeCnt;
    freeCnt <= freeCnt + 1;
    if (freeCnt>32'h0800_0000) doInit <= False;
  endrule

  function Bit#(5) initBlink (Bit#(32) cnt);
    Bool gateBit = unpack(cnt[22]);
    case (cnt[26:24])
      0, 1, 2, 6, 7 : return~(gateBit ? 5'h1C : 5'h00);
      3 : return~(5'h04);
      4 : return~(5'h0C);
      5 : return~(5'h1C);
    endcase
  endfunction

  function Bit#(5) ledStatus (Bit#(32) cnt);
    Bool gateBit = unpack(cnt[24]);
    return~(gateBit ? 5'h01 : 5'h00);
  endfunction

  method Bit#(5)  led    = doInit ? initBlink(freeCnt) : ledStatus(freeCnt);
  method Bit#(32) debug  = {pack(grayEncode(pack(freeCnt)[15:0])), 16'h0000};
  interface Reset sysRst = sys0_rst;
endmodule: mkFTop_n210

