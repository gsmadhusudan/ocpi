// BLUART.bsv - A Bluespec SystemVerilog (BSV) UART
// Copyright (c) 2014 Atomic Rules LLC - ALL RIGHTS RESERVED

package BLUART;

import Clocks       ::*;
import Connectable  ::*;
import DefaultValue ::*;
import DReg         ::*;
import FIFOF        ::*;	
import GetPut       ::*;
import Vector       ::*;

(* always_ready, always_enabled *)
interface UART_pads;
  method Bool       rts;             // connect to CTS
  method Bool       tx;              // connect to RX
  method Action     cts (Bool arg);  // connect to RTS
  method Action     rx  (Bool arg);  // connect to TX
endinterface: UART_pads

interface BLUARTIfc;
  interface Put#(UInt#(16)) setClkDiv;    // clkDiv = module clock / desired baudrate
  method UInt#(16)          txLevel;
  method UInt#(16)          rxLevel;
  interface Put#(Bit#(8))   txChar;
  interface Get#(Bit#(8))   rxChar;
  interface UART_pads       pads;
endinterface


(* synthesize *)
module mkBLUART (BLUARTIfc);
  Reg#(UInt#(16))   clkDiv     <- mkReg(1085); // 1085 = 125E6/115200 
  Reg#(UInt#(16))   txBaudCnt  <- mkReg(0);
  Reg#(UInt#(4))    txBitCnt   <- mkReg(0);
  Reg#(UInt#(8))    txSendPtr  <- mkReg(0);
  FIFOF#(Bit#(8))   txF        <- mkFIFOF;
  Reg#(Bit#(1))     txData     <- mkReg(1);

  Reg#(UInt#(16))   rxBaudCnt  <- mkReg(0);
  Reg#(UInt#(4))    rxBitCnt   <- mkReg(0);
  FIFOF#(Bit#(8))   rxF        <- mkFIFOF;
  Reg#(Bit#(1))     rxInReg    <- mkReg(1);
  Reg#(Bit#(1))     rxCtsReg   <- mkReg(1);
  Reg#(Vector#(2,Bit#(1))) rxD <- mkReg(unpack('1));
  Reg#(Vector#(8,Bit#(1))) rxV <- mkReg(unpack('1));

  // TX Logic...
  rule update_txBaudCnt;
    txBaudCnt <= (txBaudCnt>=clkDiv) ? 0 : txBaudCnt + 1;
  endrule

  rule update_txBitCnt (txBaudCnt==clkDiv);             // Fire every baud time
    if      (txBitCnt==9)  txBitCnt <= 0;               // Reset bit when we are done
    else if (txBitCnt!=0)  txBitCnt <= txBitCnt + 1;    // Advance tx char out
    else if (txF.notEmpty) txBitCnt <= 1;               // Initiate new character tx
    if      (txBitCnt==9)  txF.deq();                   // tx deq()
  endrule

  rule tx_DataMux;
    case (txBitCnt)
      0 : txData <= 1;
      1 : txData <= 0;  // 1 stop bit
      2 : txData <= txF.first[0];
      3 : txData <= txF.first[1];
      4 : txData <= txF.first[2];
      5 : txData <= txF.first[3];
      6 : txData <= txF.first[4];
      7 : txData <= txF.first[5];
      8 : txData <= txF.first[6];
      9 : txData <= txF.first[7];
    endcase
  endrule

  // Rx Logic...
  Bool rxFall  = (pack(rxD)==2'b10);
  Bool rxShift = (rxBaudCnt==clkDiv/2);
  Bool rxStop  = ((rxBitCnt==10) && rxShift);
  Bool rxGo    = ((rxBitCnt==0)  && rxFall);
  Bool rxCapt  = (unpack(rxD[1]) && rxStop);

  (* fire_when_enabled, no_implicit_conditions *)
  rule update_rxCnts;
    rxD <= shiftInAt0(rxD, rxInReg);
    if      (rxGo)              rxBaudCnt <= 1;     // Start baud counter on new bit falling edge 
    else if (rxStop)            rxBaudCnt <= 0;     // Clear when done
    else if (rxBaudCnt>=clkDiv) rxBaudCnt <= 1;     // Hold at clkDic
    else if (rxBaudCnt!=0)      rxBaudCnt <= rxBaudCnt + 1;  // Inc rxBaudCnt
    if      (rxGo)              rxBitCnt <= 1;
    else if (rxStop)            rxBitCnt <= 0;
    else if (rxBaudCnt==clkDiv) rxBitCnt <= rxBitCnt + 1;
  endrule

  rule rx_d_shift (rxShift);
    rxV <= shiftInAtN(rxV, rxD[1]);
  endrule

  rule rx_Capture (rxCapt);
    rxF.enq(pack(rxV));
  endrule

  method UInt#(16) txLevel = (txF.notEmpty) ? 1 : 0;
  method UInt#(16) rxLevel = (rxF.notEmpty) ? 1 : 0;
  interface Put txChar     = toPut(txF);
  interface Put setClkDiv  = toPut(asReg(clkDiv));
  interface Get rxChar     = toGet(rxF);
  interface UART_pads pads;
    method Bool    rts = True;             // connect to CTS
    method Bool    tx  = unpack(txData);   // connect to RX
    method Action  cts (Bool arg) = rxCtsReg._write(pack(arg));  // connect to RTS
    method Action  rx  (Bool arg) = rxInReg._write(pack(arg));   // connect to TX
  endinterface
endmodule

endpackage: BLUART
