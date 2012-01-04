//
// Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
//
// On Tue Dec 20 13:42:22 EST 2011
//
//
// Ports:
// Name                         I/O  size props
// client_request_get             O   153 reg
// RDY_client_request_get         O     1 reg
// RDY_client_response_put        O     1 reg
// client2_request_get            O   153 const
// RDY_client2_request_get        O     1 const
// RDY_client2_response_put       O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// client_response_put            I   153 reg
// client2_response_put           I   153 unused
// EN_client_response_put         I     1
// EN_client2_response_put        I     1 unused
// EN_client_request_get          I     1
// EN_client2_request_get         I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkOCTG_nosm(CLK,
		   RST_N,

		   EN_client_request_get,
		   client_request_get,
		   RDY_client_request_get,

		   client_response_put,
		   EN_client_response_put,
		   RDY_client_response_put,

		   EN_client2_request_get,
		   client2_request_get,
		   RDY_client2_request_get,

		   client2_response_put,
		   EN_client2_response_put,
		   RDY_client2_response_put);
  input  CLK;
  input  RST_N;

  // actionvalue method client_request_get
  input  EN_client_request_get;
  output [152 : 0] client_request_get;
  output RDY_client_request_get;

  // action method client_response_put
  input  [152 : 0] client_response_put;
  input  EN_client_response_put;
  output RDY_client_response_put;

  // actionvalue method client2_request_get
  input  EN_client2_request_get;
  output [152 : 0] client2_request_get;
  output RDY_client2_request_get;

  // action method client2_response_put
  input  [152 : 0] client2_response_put;
  input  EN_client2_response_put;
  output RDY_client2_response_put;

  // signals for module outputs
  wire [152 : 0] client2_request_get, client_request_get;
  wire RDY_client2_request_get,
       RDY_client2_response_put,
       RDY_client_request_get,
       RDY_client_response_put;

  // inlined wires
  wire [31 : 0] rdServer0_fifo_in_bypass_enq$wget,
		rdServer0_fifo_out_bypass_enq$wget,
		rdServer1_fifo_in_bypass_enq$wget,
		rdServer1_fifo_out_bypass_enq$wget;
  wire rdServer0_abort$wget,
       rdServer0_abort$whas,
       rdServer0_fifo_in_bypass_enq$whas,
       rdServer0_fifo_in_do_deq$whas,
       rdServer0_fifo_in_do_enq$whas,
       rdServer0_fifo_out_bypass_enq$whas,
       rdServer0_fifo_out_do_deq$whas,
       rdServer0_fifo_out_do_enq$whas,
       rdServer0_start_reg_1$wget,
       rdServer0_start_reg_1$whas,
       rdServer0_start_wire$wget,
       rdServer0_start_wire$whas,
       rdServer0_state_fired_1$wget,
       rdServer0_state_fired_1$whas,
       rdServer0_state_overlap_pw$whas,
       rdServer0_state_set_pw$whas,
       rdServer1_abort$wget,
       rdServer1_abort$whas,
       rdServer1_fifo_in_bypass_enq$whas,
       rdServer1_fifo_in_do_deq$whas,
       rdServer1_fifo_in_do_enq$whas,
       rdServer1_fifo_out_bypass_enq$whas,
       rdServer1_fifo_out_do_deq$whas,
       rdServer1_fifo_out_do_enq$whas,
       rdServer1_start_reg_1$wget,
       rdServer1_start_reg_1$whas,
       rdServer1_start_wire$wget,
       rdServer1_start_wire$whas,
       rdServer1_state_fired_1$wget,
       rdServer1_state_fired_1$whas,
       rdServer1_state_overlap_pw$whas,
       rdServer1_state_set_pw$whas,
       reqFsm_start_wire$wget,
       reqFsm_start_wire$whas;

  // register dwValue
  reg [31 : 0] dwValue;
  wire [31 : 0] dwValue$D_IN;
  wire dwValue$EN;

  // register rdServer0_enabled
  reg rdServer0_enabled;
  wire rdServer0_enabled$D_IN, rdServer0_enabled$EN;

  // register rdServer0_fifo_in_data
  reg [31 : 0] rdServer0_fifo_in_data;
  wire [31 : 0] rdServer0_fifo_in_data$D_IN;
  wire rdServer0_fifo_in_data$EN;

  // register rdServer0_fifo_in_empty
  reg rdServer0_fifo_in_empty;
  wire rdServer0_fifo_in_empty$D_IN, rdServer0_fifo_in_empty$EN;

  // register rdServer0_fifo_out_data
  reg [31 : 0] rdServer0_fifo_out_data;
  wire [31 : 0] rdServer0_fifo_out_data$D_IN;
  wire rdServer0_fifo_out_data$EN;

  // register rdServer0_fifo_out_empty
  reg rdServer0_fifo_out_empty;
  wire rdServer0_fifo_out_empty$D_IN, rdServer0_fifo_out_empty$EN;

  // register rdServer0_start_reg
  reg rdServer0_start_reg;
  wire rdServer0_start_reg$D_IN, rdServer0_start_reg$EN;

  // register rdServer0_state_can_overlap
  reg rdServer0_state_can_overlap;
  wire rdServer0_state_can_overlap$D_IN, rdServer0_state_can_overlap$EN;

  // register rdServer0_state_fired
  reg rdServer0_state_fired;
  wire rdServer0_state_fired$D_IN, rdServer0_state_fired$EN;

  // register rdServer0_state_mkFSMstate
  reg [2 : 0] rdServer0_state_mkFSMstate;
  reg [2 : 0] rdServer0_state_mkFSMstate$D_IN;
  wire rdServer0_state_mkFSMstate$EN;

  // register rdServer1_enabled
  reg rdServer1_enabled;
  wire rdServer1_enabled$D_IN, rdServer1_enabled$EN;

  // register rdServer1_fifo_in_data
  reg [31 : 0] rdServer1_fifo_in_data;
  wire [31 : 0] rdServer1_fifo_in_data$D_IN;
  wire rdServer1_fifo_in_data$EN;

  // register rdServer1_fifo_in_empty
  reg rdServer1_fifo_in_empty;
  wire rdServer1_fifo_in_empty$D_IN, rdServer1_fifo_in_empty$EN;

  // register rdServer1_fifo_out_data
  reg [31 : 0] rdServer1_fifo_out_data;
  wire [31 : 0] rdServer1_fifo_out_data$D_IN;
  wire rdServer1_fifo_out_data$EN;

  // register rdServer1_fifo_out_empty
  reg rdServer1_fifo_out_empty;
  wire rdServer1_fifo_out_empty$D_IN, rdServer1_fifo_out_empty$EN;

  // register rdServer1_start_reg
  reg rdServer1_start_reg;
  wire rdServer1_start_reg$D_IN, rdServer1_start_reg$EN;

  // register rdServer1_state_can_overlap
  reg rdServer1_state_can_overlap;
  wire rdServer1_state_can_overlap$D_IN, rdServer1_state_can_overlap$EN;

  // register rdServer1_state_fired
  reg rdServer1_state_fired;
  wire rdServer1_state_fired$D_IN, rdServer1_state_fired$EN;

  // register rdServer1_state_mkFSMstate
  reg [2 : 0] rdServer1_state_mkFSMstate;
  reg [2 : 0] rdServer1_state_mkFSMstate$D_IN;
  wire rdServer1_state_mkFSMstate$EN;

  // register reqFsm_start_reg
  reg reqFsm_start_reg;
  wire reqFsm_start_reg$D_IN, reqFsm_start_reg$EN;

  // register started
  reg started;
  wire started$D_IN, started$EN;

  // register tag
  reg [7 : 0] tag;
  wire [7 : 0] tag$D_IN;
  wire tag$EN;

  // ports of submodule inF
  wire [152 : 0] inF$D_IN, inF$D_OUT;
  wire inF$CLR, inF$DEQ, inF$EMPTY_N, inF$ENQ, inF$FULL_N;

  // ports of submodule outF
  wire [152 : 0] outF$D_IN, outF$D_OUT;
  wire outF$CLR, outF$DEQ, outF$EMPTY_N, outF$ENQ, outF$FULL_N;

  // ports of submodule rdServer0_fifo_in_rvr
  wire rdServer0_fifo_in_rvr$D_IN, rdServer0_fifo_in_rvr$EN;

  // ports of submodule rdServer0_fifo_out_rvr
  wire rdServer0_fifo_out_rvr$D_IN,
       rdServer0_fifo_out_rvr$EN,
       rdServer0_fifo_out_rvr$Q_OUT;

  // ports of submodule rdServer1_fifo_in_rvr
  wire rdServer1_fifo_in_rvr$D_IN, rdServer1_fifo_in_rvr$EN;

  // ports of submodule rdServer1_fifo_out_rvr
  wire rdServer1_fifo_out_rvr$D_IN,
       rdServer1_fifo_out_rvr$EN,
       rdServer1_fifo_out_rvr$Q_OUT;

  // rule scheduling signals
  wire CAN_FIRE_RL_rdServer1_action_l54c5,
       CAN_FIRE_RL_rdServer1_action_l58c5_T,
       WILL_FIRE_RL_rdServer0_action_l33c5,
       WILL_FIRE_RL_rdServer0_action_l37c5_F,
       WILL_FIRE_RL_rdServer0_fifo_out_write_data,
       WILL_FIRE_RL_rdServer0_fsm_start,
       WILL_FIRE_RL_rdServer0_idle_l32c3,
       WILL_FIRE_RL_rdServer1_action_l54c5,
       WILL_FIRE_RL_rdServer1_action_l58c5_F,
       WILL_FIRE_RL_rdServer1_fifo_out_write_data,
       WILL_FIRE_RL_rdServer1_fsm_start,
       WILL_FIRE_RL_rdServer1_idle_l53c3;

  // inputs to muxes for submodule ports
  wire [152 : 0] MUX_outF$enq_1__VAL_1, MUX_outF$enq_1__VAL_2;
  wire MUX_rdServer0_state_mkFSMstate$write_1__SEL_3,
       MUX_rdServer1_state_mkFSMstate$write_1__SEL_3;

  // remaining internal signals
  reg [63 : 0] v__h18950, v__h9054;
  wire [127 : 0] x_data__h18638, x_data__h8729;
  wire [31 : 0] v__h18904;
  wire rdServer0_fifo_out_empty_8_OR_rdServer0_fifo_o_ETC___d89,
       rdServer1_fifo_out_empty_61_OR_rdServer1_fifo__ETC___d174;

  // actionvalue method client_request_get
  assign client_request_get = outF$D_OUT ;
  assign RDY_client_request_get = outF$EMPTY_N ;

  // action method client_response_put
  assign RDY_client_response_put = inF$FULL_N ;

  // actionvalue method client2_request_get
  assign client2_request_get = 153'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign RDY_client2_request_get = 1'd1 ;

  // action method client2_response_put
  assign RDY_client2_response_put = 1'd1 ;

  // submodule inF
  FIFO2 #(.width(32'd153), .guarded(32'd1)) inF(.RST_N(RST_N),
						.CLK(CLK),
						.D_IN(inF$D_IN),
						.ENQ(inF$ENQ),
						.DEQ(inF$DEQ),
						.CLR(inF$CLR),
						.D_OUT(inF$D_OUT),
						.FULL_N(inF$FULL_N),
						.EMPTY_N(inF$EMPTY_N));

  // submodule outF
  FIFO2 #(.width(32'd153), .guarded(32'd1)) outF(.RST_N(RST_N),
						 .CLK(CLK),
						 .D_IN(outF$D_IN),
						 .ENQ(outF$ENQ),
						 .DEQ(outF$DEQ),
						 .CLR(outF$CLR),
						 .D_OUT(outF$D_OUT),
						 .FULL_N(outF$FULL_N),
						 .EMPTY_N(outF$EMPTY_N));

  // submodule rdServer0_fifo_in_rvr
  RevertReg #(.width(32'd1), .init(1'd1)) rdServer0_fifo_in_rvr(.CLK(CLK),
								.D_IN(rdServer0_fifo_in_rvr$D_IN),
								.EN(rdServer0_fifo_in_rvr$EN),
								.Q_OUT());

  // submodule rdServer0_fifo_out_rvr
  RevertReg #(.width(32'd1), .init(1'd1)) rdServer0_fifo_out_rvr(.CLK(CLK),
								 .D_IN(rdServer0_fifo_out_rvr$D_IN),
								 .EN(rdServer0_fifo_out_rvr$EN),
								 .Q_OUT(rdServer0_fifo_out_rvr$Q_OUT));

  // submodule rdServer1_fifo_in_rvr
  RevertReg #(.width(32'd1), .init(1'd1)) rdServer1_fifo_in_rvr(.CLK(CLK),
								.D_IN(rdServer1_fifo_in_rvr$D_IN),
								.EN(rdServer1_fifo_in_rvr$EN),
								.Q_OUT());

  // submodule rdServer1_fifo_out_rvr
  RevertReg #(.width(32'd1), .init(1'd1)) rdServer1_fifo_out_rvr(.CLK(CLK),
								 .D_IN(rdServer1_fifo_out_rvr$D_IN),
								 .EN(rdServer1_fifo_out_rvr$EN),
								 .Q_OUT(rdServer1_fifo_out_rvr$Q_OUT));

  // rule RL_rdServer0_action_l37c5_F
  assign WILL_FIRE_RL_rdServer0_action_l37c5_F =
	     !rdServer0_fifo_out_empty &&
	     rdServer0_fifo_out_empty_8_OR_rdServer0_fifo_o_ETC___d89 ;

  // rule RL_rdServer0_fsm_start
  assign WILL_FIRE_RL_rdServer0_fsm_start =
	     (rdServer0_state_mkFSMstate == 3'd0 ||
	      rdServer0_state_mkFSMstate == 3'd2) &&
	     (!rdServer0_start_reg || rdServer0_state_fired) &&
	     rdServer0_enabled ;

  // rule RL_rdServer0_idle_l32c3
  assign WILL_FIRE_RL_rdServer0_idle_l32c3 =
	     !rdServer0_start_wire$whas &&
	     rdServer0_state_mkFSMstate == 3'd2 ;

  // rule RL_rdServer0_fifo_out_write_data
  assign WILL_FIRE_RL_rdServer0_fifo_out_write_data =
	     rdServer0_fifo_out_empty && rdServer0_fifo_out_rvr$Q_OUT &&
	     !rdServer0_fifo_in_empty &&
	     inF$EMPTY_N &&
	     rdServer0_state_mkFSMstate == 3'd1 ;

  // rule RL_rdServer1_action_l58c5_T
  assign CAN_FIRE_RL_rdServer1_action_l58c5_T =
	     rdServer1_fifo_out_empty && rdServer1_fifo_out_rvr$Q_OUT &&
	     inF$EMPTY_N &&
	     !rdServer1_fifo_in_empty &&
	     rdServer1_state_mkFSMstate == 3'd1 ;

  // rule RL_rdServer1_action_l58c5_F
  assign WILL_FIRE_RL_rdServer1_action_l58c5_F =
	     !rdServer1_fifo_out_empty &&
	     rdServer1_fifo_out_empty_61_OR_rdServer1_fifo__ETC___d174 &&
	     !WILL_FIRE_RL_rdServer0_action_l37c5_F &&
	     !WILL_FIRE_RL_rdServer0_fifo_out_write_data ;

  // rule RL_rdServer0_action_l33c5
  assign WILL_FIRE_RL_rdServer0_action_l33c5 =
	     !rdServer0_fifo_in_empty && outF$FULL_N &&
	     rdServer0_start_wire$whas &&
	     (rdServer0_state_mkFSMstate == 3'd0 ||
	      rdServer0_state_mkFSMstate == 3'd2) ;

  // rule RL_rdServer1_fsm_start
  assign WILL_FIRE_RL_rdServer1_fsm_start =
	     (rdServer1_state_mkFSMstate == 3'd0 ||
	      rdServer1_state_mkFSMstate == 3'd2) &&
	     (!rdServer1_start_reg || rdServer1_state_fired) &&
	     rdServer1_enabled ;

  // rule RL_rdServer1_action_l54c5
  assign CAN_FIRE_RL_rdServer1_action_l54c5 =
	     outF$FULL_N && !rdServer1_fifo_in_empty &&
	     rdServer1_start_wire$whas &&
	     (rdServer1_state_mkFSMstate == 3'd0 ||
	      rdServer1_state_mkFSMstate == 3'd2) ;
  assign WILL_FIRE_RL_rdServer1_action_l54c5 =
	     CAN_FIRE_RL_rdServer1_action_l54c5 &&
	     !WILL_FIRE_RL_rdServer0_action_l33c5 ;

  // rule RL_rdServer1_idle_l53c3
  assign WILL_FIRE_RL_rdServer1_idle_l53c3 =
	     !rdServer1_start_wire$whas &&
	     rdServer1_state_mkFSMstate == 3'd2 ;

  // rule RL_rdServer1_fifo_out_write_data
  assign WILL_FIRE_RL_rdServer1_fifo_out_write_data =
	     CAN_FIRE_RL_rdServer1_action_l58c5_T &&
	     !WILL_FIRE_RL_rdServer0_action_l37c5_F &&
	     !WILL_FIRE_RL_rdServer0_fifo_out_write_data ;

  // inputs to muxes for submodule ports
  assign MUX_rdServer0_state_mkFSMstate$write_1__SEL_3 =
	     WILL_FIRE_RL_rdServer0_action_l37c5_F ||
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ;
  assign MUX_rdServer1_state_mkFSMstate$write_1__SEL_3 =
	     WILL_FIRE_RL_rdServer1_action_l58c5_F ||
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ;
  assign MUX_outF$enq_1__VAL_1 = { 25'd25296895, x_data__h8729 } ;
  assign MUX_outF$enq_1__VAL_2 = { 25'd25362431, x_data__h18638 } ;

  // inlined wires
  assign rdServer0_fifo_in_bypass_enq$wget = 32'h0 ;
  assign rdServer0_fifo_in_bypass_enq$whas = 1'b0 ;
  assign rdServer0_fifo_out_bypass_enq$wget = v__h18904 ;
  assign rdServer0_fifo_out_bypass_enq$whas =
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ;
  assign rdServer0_start_wire$wget = 1'd1 ;
  assign rdServer0_start_wire$whas =
	     WILL_FIRE_RL_rdServer0_fsm_start ||
	     rdServer0_start_reg && !rdServer0_state_fired ;
  assign rdServer0_start_reg_1$wget = 1'd1 ;
  assign rdServer0_start_reg_1$whas = rdServer0_start_wire$whas ;
  assign rdServer0_abort$wget = 1'b0 ;
  assign rdServer0_abort$whas = 1'b0 ;
  assign rdServer0_state_fired_1$wget = 1'd1 ;
  assign rdServer0_state_fired_1$whas = rdServer0_state_set_pw$whas ;
  assign rdServer1_fifo_in_bypass_enq$wget = 32'h0 ;
  assign rdServer1_fifo_in_bypass_enq$whas = 1'b0 ;
  assign rdServer1_fifo_out_bypass_enq$wget = v__h18904 ;
  assign rdServer1_fifo_out_bypass_enq$whas =
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ;
  assign rdServer1_start_wire$wget = 1'd1 ;
  assign rdServer1_start_wire$whas =
	     WILL_FIRE_RL_rdServer1_fsm_start ||
	     rdServer1_start_reg && !rdServer1_state_fired ;
  assign rdServer1_start_reg_1$wget = 1'd1 ;
  assign rdServer1_start_reg_1$whas = rdServer1_start_wire$whas ;
  assign rdServer1_abort$wget = 1'b0 ;
  assign rdServer1_abort$whas = 1'b0 ;
  assign rdServer1_state_fired_1$wget = 1'd1 ;
  assign rdServer1_state_fired_1$whas = rdServer1_state_set_pw$whas ;
  assign reqFsm_start_wire$wget = 1'd1 ;
  assign reqFsm_start_wire$whas = reqFsm_start_reg ;
  assign rdServer0_fifo_in_do_deq$whas = 1'b0 ;
  assign rdServer0_fifo_in_do_enq$whas = 1'b0 ;
  assign rdServer0_fifo_out_do_deq$whas = 1'b0 ;
  assign rdServer0_fifo_out_do_enq$whas =
	     MUX_rdServer0_state_mkFSMstate$write_1__SEL_3 ;
  assign rdServer0_state_set_pw$whas =
	     WILL_FIRE_RL_rdServer0_action_l37c5_F ||
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ||
	     WILL_FIRE_RL_rdServer0_idle_l32c3 ||
	     WILL_FIRE_RL_rdServer0_action_l33c5 ;
  assign rdServer0_state_overlap_pw$whas = 1'b0 ;
  assign rdServer1_fifo_in_do_deq$whas = 1'b0 ;
  assign rdServer1_fifo_in_do_enq$whas = 1'b0 ;
  assign rdServer1_fifo_out_do_deq$whas = 1'b0 ;
  assign rdServer1_fifo_out_do_enq$whas =
	     MUX_rdServer1_state_mkFSMstate$write_1__SEL_3 ;
  assign rdServer1_state_set_pw$whas =
	     WILL_FIRE_RL_rdServer1_action_l58c5_F ||
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ||
	     WILL_FIRE_RL_rdServer1_idle_l53c3 ||
	     WILL_FIRE_RL_rdServer1_action_l54c5 ;
  assign rdServer1_state_overlap_pw$whas = 1'b0 ;

  // register dwValue
  assign dwValue$D_IN = 32'h0 ;
  assign dwValue$EN = 1'b0 ;

  // register rdServer0_enabled
  assign rdServer0_enabled$D_IN = 1'd0 ;
  assign rdServer0_enabled$EN =
	     MUX_rdServer0_state_mkFSMstate$write_1__SEL_3 ;

  // register rdServer0_fifo_in_data
  assign rdServer0_fifo_in_data$D_IN = 32'h0 ;
  assign rdServer0_fifo_in_data$EN = 1'b0 ;

  // register rdServer0_fifo_in_empty
  assign rdServer0_fifo_in_empty$D_IN = 1'b0 /* unspecified value */  ;
  assign rdServer0_fifo_in_empty$EN = 1'b0 ;

  // register rdServer0_fifo_out_data
  assign rdServer0_fifo_out_data$D_IN =
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ?
	       v__h18904 :
	       v__h18904 ;
  assign rdServer0_fifo_out_data$EN =
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ||
	     WILL_FIRE_RL_rdServer0_action_l37c5_F ;

  // register rdServer0_fifo_out_empty
  assign rdServer0_fifo_out_empty$D_IN = 1'd0 ;
  assign rdServer0_fifo_out_empty$EN =
	     MUX_rdServer0_state_mkFSMstate$write_1__SEL_3 ;

  // register rdServer0_start_reg
  assign rdServer0_start_reg$D_IN = rdServer0_start_wire$whas ;
  assign rdServer0_start_reg$EN = 1'd1 ;

  // register rdServer0_state_can_overlap
  assign rdServer0_state_can_overlap$D_IN =
	     rdServer0_state_set_pw$whas || rdServer0_state_can_overlap ;
  assign rdServer0_state_can_overlap$EN = 1'd1 ;

  // register rdServer0_state_fired
  assign rdServer0_state_fired$D_IN = rdServer0_state_set_pw$whas ;
  assign rdServer0_state_fired$EN = 1'd1 ;

  // register rdServer0_state_mkFSMstate
  always@(WILL_FIRE_RL_rdServer0_idle_l32c3 or
	  WILL_FIRE_RL_rdServer0_action_l33c5 or
	  MUX_rdServer0_state_mkFSMstate$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rdServer0_idle_l32c3:
	  rdServer0_state_mkFSMstate$D_IN = 3'd0;
      WILL_FIRE_RL_rdServer0_action_l33c5:
	  rdServer0_state_mkFSMstate$D_IN = 3'd1;
      MUX_rdServer0_state_mkFSMstate$write_1__SEL_3:
	  rdServer0_state_mkFSMstate$D_IN = 3'd2;
      default: rdServer0_state_mkFSMstate$D_IN =
		   3'b010 /* unspecified value */ ;
    endcase
  end
  assign rdServer0_state_mkFSMstate$EN =
	     WILL_FIRE_RL_rdServer0_idle_l32c3 ||
	     WILL_FIRE_RL_rdServer0_action_l33c5 ||
	     WILL_FIRE_RL_rdServer0_action_l37c5_F ||
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ;

  // register rdServer1_enabled
  assign rdServer1_enabled$D_IN = 1'd0 ;
  assign rdServer1_enabled$EN =
	     MUX_rdServer1_state_mkFSMstate$write_1__SEL_3 ;

  // register rdServer1_fifo_in_data
  assign rdServer1_fifo_in_data$D_IN = 32'h0 ;
  assign rdServer1_fifo_in_data$EN = 1'b0 ;

  // register rdServer1_fifo_in_empty
  assign rdServer1_fifo_in_empty$D_IN = 1'b0 /* unspecified value */  ;
  assign rdServer1_fifo_in_empty$EN = 1'b0 ;

  // register rdServer1_fifo_out_data
  assign rdServer1_fifo_out_data$D_IN =
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ?
	       v__h18904 :
	       v__h18904 ;
  assign rdServer1_fifo_out_data$EN =
	     WILL_FIRE_RL_rdServer1_action_l58c5_F ||
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ;

  // register rdServer1_fifo_out_empty
  assign rdServer1_fifo_out_empty$D_IN = 1'd0 ;
  assign rdServer1_fifo_out_empty$EN =
	     MUX_rdServer1_state_mkFSMstate$write_1__SEL_3 ;

  // register rdServer1_start_reg
  assign rdServer1_start_reg$D_IN = rdServer1_start_wire$whas ;
  assign rdServer1_start_reg$EN = 1'd1 ;

  // register rdServer1_state_can_overlap
  assign rdServer1_state_can_overlap$D_IN =
	     rdServer1_state_set_pw$whas || rdServer1_state_can_overlap ;
  assign rdServer1_state_can_overlap$EN = 1'd1 ;

  // register rdServer1_state_fired
  assign rdServer1_state_fired$D_IN = rdServer1_state_set_pw$whas ;
  assign rdServer1_state_fired$EN = 1'd1 ;

  // register rdServer1_state_mkFSMstate
  always@(WILL_FIRE_RL_rdServer1_idle_l53c3 or
	  WILL_FIRE_RL_rdServer1_action_l54c5 or
	  MUX_rdServer1_state_mkFSMstate$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rdServer1_idle_l53c3:
	  rdServer1_state_mkFSMstate$D_IN = 3'd0;
      WILL_FIRE_RL_rdServer1_action_l54c5:
	  rdServer1_state_mkFSMstate$D_IN = 3'd1;
      MUX_rdServer1_state_mkFSMstate$write_1__SEL_3:
	  rdServer1_state_mkFSMstate$D_IN = 3'd2;
      default: rdServer1_state_mkFSMstate$D_IN =
		   3'b010 /* unspecified value */ ;
    endcase
  end
  assign rdServer1_state_mkFSMstate$EN =
	     WILL_FIRE_RL_rdServer1_idle_l53c3 ||
	     WILL_FIRE_RL_rdServer1_action_l54c5 ||
	     WILL_FIRE_RL_rdServer1_action_l58c5_F ||
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ;

  // register reqFsm_start_reg
  assign reqFsm_start_reg$D_IN = 1'd0 ;
  assign reqFsm_start_reg$EN = reqFsm_start_reg ;

  // register started
  assign started$D_IN = 1'b0 ;
  assign started$EN = 1'b0 ;

  // register tag
  assign tag$D_IN = tag + 8'd1 ;
  assign tag$EN =
	     WILL_FIRE_RL_rdServer1_action_l54c5 ||
	     WILL_FIRE_RL_rdServer0_action_l33c5 ;

  // submodule inF
  assign inF$D_IN = client_response_put ;
  assign inF$ENQ = EN_client_response_put ;
  assign inF$DEQ =
	     WILL_FIRE_RL_rdServer1_action_l58c5_F ||
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ||
	     WILL_FIRE_RL_rdServer0_action_l37c5_F ||
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ;
  assign inF$CLR = 1'b0 ;

  // submodule outF
  assign outF$D_IN =
	     WILL_FIRE_RL_rdServer0_action_l33c5 ?
	       MUX_outF$enq_1__VAL_1 :
	       MUX_outF$enq_1__VAL_2 ;
  assign outF$ENQ =
	     WILL_FIRE_RL_rdServer0_action_l33c5 ||
	     WILL_FIRE_RL_rdServer1_action_l54c5 ;
  assign outF$DEQ = EN_client_request_get ;
  assign outF$CLR = 1'b0 ;

  // submodule rdServer0_fifo_in_rvr
  assign rdServer0_fifo_in_rvr$D_IN = 1'd1 ;
  assign rdServer0_fifo_in_rvr$EN = 1'b0 ;

  // submodule rdServer0_fifo_out_rvr
  assign rdServer0_fifo_out_rvr$D_IN = 1'd1 ;
  assign rdServer0_fifo_out_rvr$EN =
	     WILL_FIRE_RL_rdServer0_fifo_out_write_data ;

  // submodule rdServer1_fifo_in_rvr
  assign rdServer1_fifo_in_rvr$D_IN = 1'd1 ;
  assign rdServer1_fifo_in_rvr$EN = 1'b0 ;

  // submodule rdServer1_fifo_out_rvr
  assign rdServer1_fifo_out_rvr$D_IN = 1'd1 ;
  assign rdServer1_fifo_out_rvr$EN =
	     WILL_FIRE_RL_rdServer1_fifo_out_write_data ;

  // remaining internal signals
  assign rdServer0_fifo_out_empty_8_OR_rdServer0_fifo_o_ETC___d89 =
	     rdServer0_fifo_out_empty && rdServer0_fifo_out_rvr$Q_OUT &&
	     !rdServer0_fifo_in_empty &&
	     inF$EMPTY_N &&
	     rdServer0_state_mkFSMstate == 3'd1 ;
  assign rdServer1_fifo_out_empty_61_OR_rdServer1_fifo__ETC___d174 =
	     rdServer1_fifo_out_empty && rdServer1_fifo_out_rvr$Q_OUT &&
	     inF$EMPTY_N &&
	     !rdServer1_fifo_in_empty &&
	     rdServer1_state_mkFSMstate == 3'd1 ;
  assign v__h18904 =
	     { inF$D_OUT[7:0],
	       inF$D_OUT[15:8],
	       inF$D_OUT[23:16],
	       inF$D_OUT[31:24] } ;
  assign x_data__h18638 =
	     { 48'd130816, tag, 8'd15, rdServer1_fifo_in_data[31:2], 34'd0 } ;
  assign x_data__h8729 =
	     { 48'd130816, tag, 8'd15, rdServer0_fifo_in_data[31:2], 34'd0 } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        rdServer0_enabled <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer0_fifo_in_empty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer0_fifo_out_empty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer0_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdServer0_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer0_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdServer0_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 3'd0;
	rdServer1_enabled <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer1_fifo_in_empty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer1_fifo_out_empty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer1_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdServer1_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdServer1_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdServer1_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 3'd0;
	reqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	started <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tag <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (rdServer0_enabled$EN)
	  rdServer0_enabled <= `BSV_ASSIGNMENT_DELAY rdServer0_enabled$D_IN;
	if (rdServer0_fifo_in_empty$EN)
	  rdServer0_fifo_in_empty <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_fifo_in_empty$D_IN;
	if (rdServer0_fifo_out_empty$EN)
	  rdServer0_fifo_out_empty <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_fifo_out_empty$D_IN;
	if (rdServer0_start_reg$EN)
	  rdServer0_start_reg <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_start_reg$D_IN;
	if (rdServer0_state_can_overlap$EN)
	  rdServer0_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_state_can_overlap$D_IN;
	if (rdServer0_state_fired$EN)
	  rdServer0_state_fired <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_state_fired$D_IN;
	if (rdServer0_state_mkFSMstate$EN)
	  rdServer0_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      rdServer0_state_mkFSMstate$D_IN;
	if (rdServer1_enabled$EN)
	  rdServer1_enabled <= `BSV_ASSIGNMENT_DELAY rdServer1_enabled$D_IN;
	if (rdServer1_fifo_in_empty$EN)
	  rdServer1_fifo_in_empty <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_fifo_in_empty$D_IN;
	if (rdServer1_fifo_out_empty$EN)
	  rdServer1_fifo_out_empty <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_fifo_out_empty$D_IN;
	if (rdServer1_start_reg$EN)
	  rdServer1_start_reg <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_start_reg$D_IN;
	if (rdServer1_state_can_overlap$EN)
	  rdServer1_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_state_can_overlap$D_IN;
	if (rdServer1_state_fired$EN)
	  rdServer1_state_fired <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_state_fired$D_IN;
	if (rdServer1_state_mkFSMstate$EN)
	  rdServer1_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      rdServer1_state_mkFSMstate$D_IN;
	if (reqFsm_start_reg$EN)
	  reqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY reqFsm_start_reg$D_IN;
	if (started$EN) started <= `BSV_ASSIGNMENT_DELAY started$D_IN;
	if (tag$EN) tag <= `BSV_ASSIGNMENT_DELAY tag$D_IN;
      end
    if (dwValue$EN) dwValue <= `BSV_ASSIGNMENT_DELAY dwValue$D_IN;
    if (rdServer0_fifo_in_data$EN)
      rdServer0_fifo_in_data <= `BSV_ASSIGNMENT_DELAY
	  rdServer0_fifo_in_data$D_IN;
    if (rdServer0_fifo_out_data$EN)
      rdServer0_fifo_out_data <= `BSV_ASSIGNMENT_DELAY
	  rdServer0_fifo_out_data$D_IN;
    if (rdServer1_fifo_in_data$EN)
      rdServer1_fifo_in_data <= `BSV_ASSIGNMENT_DELAY
	  rdServer1_fifo_in_data$D_IN;
    if (rdServer1_fifo_out_data$EN)
      rdServer1_fifo_out_data <= `BSV_ASSIGNMENT_DELAY
	  rdServer1_fifo_out_data$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dwValue = 32'hAAAAAAAA;
    rdServer0_enabled = 1'h0;
    rdServer0_fifo_in_data = 32'hAAAAAAAA;
    rdServer0_fifo_in_empty = 1'h0;
    rdServer0_fifo_out_data = 32'hAAAAAAAA;
    rdServer0_fifo_out_empty = 1'h0;
    rdServer0_start_reg = 1'h0;
    rdServer0_state_can_overlap = 1'h0;
    rdServer0_state_fired = 1'h0;
    rdServer0_state_mkFSMstate = 3'h2;
    rdServer1_enabled = 1'h0;
    rdServer1_fifo_in_data = 32'hAAAAAAAA;
    rdServer1_fifo_in_empty = 1'h0;
    rdServer1_fifo_out_data = 32'hAAAAAAAA;
    rdServer1_fifo_out_empty = 1'h0;
    rdServer1_start_reg = 1'h0;
    rdServer1_state_can_overlap = 1'h0;
    rdServer1_state_fired = 1'h0;
    rdServer1_state_mkFSMstate = 3'h2;
    reqFsm_start_reg = 1'h0;
    started = 1'h0;
    tag = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (WILL_FIRE_RL_rdServer0_fifo_out_write_data)
	begin
	  v__h9054 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_rdServer0_fifo_out_write_data)
	$display("[%0d]: %m: BAR0 READ-RETURNED tag:%0x Addr:%0x Data:%0x",
		 v__h9054,
		 tag,
		 rdServer0_fifo_in_data,
		 v__h18904);
    if (RST_N)
      if (WILL_FIRE_RL_rdServer0_action_l37c5_F)
	begin
	  v__h9054 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_rdServer0_action_l37c5_F)
	$display("[%0d]: %m: BAR0 READ-RETURNED tag:%0x Addr:%0x Data:%0x",
		 v__h9054,
		 tag,
		 rdServer0_fifo_in_data,
		 v__h18904);
    if (RST_N)
      if (WILL_FIRE_RL_rdServer1_fifo_out_write_data)
	begin
	  v__h18950 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_rdServer1_fifo_out_write_data)
	$display("[%0d]: %m: BAR1 READ-RETURNED tag:%0x Addr:%0x Data:%0x",
		 v__h18950,
		 tag,
		 rdServer1_fifo_in_data,
		 v__h18904);
    if (RST_N)
      if (WILL_FIRE_RL_rdServer1_action_l58c5_F)
	begin
	  v__h18950 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_rdServer1_action_l58c5_F)
	$display("[%0d]: %m: BAR1 READ-RETURNED tag:%0x Addr:%0x Data:%0x",
		 v__h18950,
		 tag,
		 rdServer1_fifo_in_data,
		 v__h18904);
    if (RST_N)
      if (WILL_FIRE_RL_rdServer0_action_l33c5 &&
	  (WILL_FIRE_RL_rdServer0_fifo_out_write_data ||
	   WILL_FIRE_RL_rdServer0_action_l37c5_F))
	$display("Error: \"bsv/tst/OCTG_nosm.bsv\", line 33, column 5: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rdServer0_action_l33c5] and\n  [RL_rdServer0_action_l37c5_T, RL_rdServer0_action_l37c5_F] ) fired in the\n  same clock cycle.\n");
    if (RST_N)
      if (WILL_FIRE_RL_rdServer1_action_l54c5 &&
	  (WILL_FIRE_RL_rdServer1_fifo_out_write_data ||
	   WILL_FIRE_RL_rdServer1_action_l58c5_F))
	$display("Error: \"bsv/tst/OCTG_nosm.bsv\", line 54, column 5: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rdServer1_action_l54c5] and\n  [RL_rdServer1_action_l58c5_T, RL_rdServer1_action_l58c5_F] ) fired in the\n  same clock cycle.\n");
  end
  // synopsys translate_on
endmodule  // mkOCTG_nosm

