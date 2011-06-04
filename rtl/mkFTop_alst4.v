//
// Generated by Bluespec Compiler, version 2011.03.beta1 (build 23381, 2011-03-08)
//
// On Sat Jun  4 17:42:18 EDT 2011
//
//
// Ports:
// Name                         I/O  size props
// pcie_tx                        O     4
// led                            O    16 reg
// p125clk                        O     1 clock
// CLK_GATE_p125clk               O     1 const
// p125rst                        O     1 reset
// sys0_clk                       I     1 clock
// sys0_rstn                      I     1 reset
// pcie_clk                       I     1 clock
// pcie_rstn                      I     1 reset
// pcie_rx_i                      I     4
// usr_sw_i                       I     8 reg
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkFTop_alst4(sys0_clk,
		    sys0_rstn,
		    pcie_clk,
		    pcie_rstn,

		    pcie_rx_i,

		    pcie_tx,

		    usr_sw_i,

		    led,

		    p125clk,
		    CLK_GATE_p125clk,

		    p125rst);
  input  sys0_clk;
  input  sys0_rstn;
  input  pcie_clk;
  input  pcie_rstn;

  // action method pcie_rx
  input  [3 : 0] pcie_rx_i;

  // value method pcie_tx
  output [3 : 0] pcie_tx;

  // action method usr_sw
  input  [7 : 0] usr_sw_i;

  // value method led
  output [15 : 0] led;

  // oscillator and gates for output clock p125clk
  output p125clk;
  output CLK_GATE_p125clk;

  // output resets
  output p125rst;

  // signals for module outputs
  wire [15 : 0] led;
  wire [3 : 0] pcie_tx;
  wire CLK_GATE_p125clk, p125clk, p125rst;

  // inlined wires
  wire pciw_pci0_pwAvaRx$whas, pciw_pci0_pwAvaTx$whas;

  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;

  // register ledReg
  reg [15 : 0] ledReg;
  wire [15 : 0] ledReg$D_IN;
  wire ledReg$EN;

  // register pciDevice
  reg [15 : 0] pciDevice;
  wire [15 : 0] pciDevice$D_IN;
  wire pciDevice$EN;

  // register pciw_pci0_deviceReg
  reg [15 : 0] pciw_pci0_deviceReg;
  wire [15 : 0] pciw_pci0_deviceReg$D_IN;
  wire pciw_pci0_deviceReg$EN;

  // register pciw_pci0_rxSerPos
  reg [1 : 0] pciw_pci0_rxSerPos;
  wire [1 : 0] pciw_pci0_rxSerPos$D_IN;
  wire pciw_pci0_rxSerPos$EN;

  // register pciw_pci0_txHeadPushed
  reg pciw_pci0_txHeadPushed;
  wire pciw_pci0_txHeadPushed$D_IN, pciw_pci0_txHeadPushed$EN;

  // register pciw_pci0_txSerPos
  reg [1 : 0] pciw_pci0_txSerPos;
  wire [1 : 0] pciw_pci0_txSerPos$D_IN;
  wire pciw_pci0_txSerPos$EN;

  // register pciw_pciDevice
  reg [15 : 0] pciw_pciDevice;
  wire [15 : 0] pciw_pciDevice$D_IN;
  wire pciw_pciDevice$EN;

  // register swReg
  reg [7 : 0] swReg;
  wire [7 : 0] swReg$D_IN;
  wire swReg$EN;

  // ports of submodule ctop
  wire [152 : 0] ctop$server_request_put, ctop$server_response_get;
  wire [127 : 0] ctop$wmemiM0_SData;
  wire [31 : 0] ctop$wci_m_0_SData,
		ctop$wci_m_1_SData,
		ctop$wci_m_2_SData,
		ctop$wci_m_3_SData,
		ctop$wci_m_4_SData,
		ctop$wsi_s_adc_MData;
  wire [11 : 0] ctop$wsi_s_adc_MBurstLength;
  wire [7 : 0] ctop$wsi_s_adc_MReqInfo;
  wire [3 : 0] ctop$wsi_s_adc_MByteEn;
  wire [2 : 0] ctop$switch_x, ctop$wsi_s_adc_MCmd;
  wire [1 : 0] ctop$wci_m_0_SFlag,
	       ctop$wci_m_0_SResp,
	       ctop$wci_m_1_SFlag,
	       ctop$wci_m_1_SResp,
	       ctop$wci_m_2_SFlag,
	       ctop$wci_m_2_SResp,
	       ctop$wci_m_3_SFlag,
	       ctop$wci_m_3_SResp,
	       ctop$wci_m_4_SFlag,
	       ctop$wci_m_4_SResp,
	       ctop$wmemiM0_SResp;
  wire ctop$EN_server_request_put,
       ctop$EN_server_response_get,
       ctop$RDY_server_request_put,
       ctop$RDY_server_response_get,
       ctop$gps_ppsSyncIn_x,
       ctop$wci_m_0_SThreadBusy,
       ctop$wci_m_1_SThreadBusy,
       ctop$wci_m_2_SThreadBusy,
       ctop$wci_m_3_SThreadBusy,
       ctop$wci_m_4_SThreadBusy,
       ctop$wmemiM0_SCmdAccept,
       ctop$wmemiM0_SDataAccept,
       ctop$wmemiM0_SRespLast,
       ctop$wsi_m_dac_SReset_n,
       ctop$wsi_m_dac_SThreadBusy,
       ctop$wsi_s_adc_MBurstPrecise,
       ctop$wsi_s_adc_MReqLast,
       ctop$wsi_s_adc_MReset_n;

  // ports of submodule pciw_aliveLed_sb
  wire pciw_aliveLed_sb$dD_OUT, pciw_aliveLed_sb$sD_IN, pciw_aliveLed_sb$sEN;

  // ports of submodule pciw_i2pF
  wire [152 : 0] pciw_i2pF$D_IN, pciw_i2pF$D_OUT;
  wire pciw_i2pF$CLR,
       pciw_i2pF$DEQ,
       pciw_i2pF$EMPTY_N,
       pciw_i2pF$ENQ,
       pciw_i2pF$FULL_N;

  // ports of submodule pciw_linkLed_sb
  wire pciw_linkLed_sb$dD_OUT, pciw_linkLed_sb$sD_IN, pciw_linkLed_sb$sEN;

  // ports of submodule pciw_p2iF
  wire [152 : 0] pciw_p2iF$D_IN, pciw_p2iF$D_OUT;
  wire pciw_p2iF$CLR,
       pciw_p2iF$DEQ,
       pciw_p2iF$EMPTY_N,
       pciw_p2iF$ENQ,
       pciw_p2iF$FULL_N;

  // ports of submodule pciw_pci0_pcie_ep
  wire [127 : 0] pciw_pci0_pcie_ep$rx_st_data0, pciw_pci0_pcie_ep$tx_st_data0;
  wire [31 : 0] pciw_pci0_pcie_ep$ava_debug, pciw_pci0_pcie_ep$tl_cfg_ctl;
  wire [15 : 0] pciw_pci0_pcie_ep$rx_st_be0;
  wire [7 : 0] pciw_pci0_pcie_ep$rx_st_bardec0;
  wire [3 : 0] pciw_pci0_pcie_ep$pcie_rx_in,
	       pciw_pci0_pcie_ep$pcie_tx_out,
	       pciw_pci0_pcie_ep$tl_cfg_add;
  wire pciw_pci0_pcie_ep$ava_alive,
       pciw_pci0_pcie_ep$ava_core_clk_out,
       pciw_pci0_pcie_ep$ava_lnk_up,
       pciw_pci0_pcie_ep$ava_srstn,
       pciw_pci0_pcie_ep$rx_st_eop0,
       pciw_pci0_pcie_ep$rx_st_mask0,
       pciw_pci0_pcie_ep$rx_st_ready0,
       pciw_pci0_pcie_ep$rx_st_sop0,
       pciw_pci0_pcie_ep$rx_st_valid0,
       pciw_pci0_pcie_ep$tx_st_empty0,
       pciw_pci0_pcie_ep$tx_st_eop0,
       pciw_pci0_pcie_ep$tx_st_err0,
       pciw_pci0_pcie_ep$tx_st_ready0,
       pciw_pci0_pcie_ep$tx_st_sop0,
       pciw_pci0_pcie_ep$tx_st_valid0;

  // ports of submodule pciw_pci0_rxOutF
  wire [152 : 0] pciw_pci0_rxOutF$D_IN, pciw_pci0_rxOutF$D_OUT;
  wire pciw_pci0_rxOutF$CLR,
       pciw_pci0_rxOutF$DEQ,
       pciw_pci0_rxOutF$EMPTY_N,
       pciw_pci0_rxOutF$ENQ,
       pciw_pci0_rxOutF$FULL_N;

  // ports of submodule pciw_pci0_rxStageF
  wire [152 : 0] pciw_pci0_rxStageF$D_IN, pciw_pci0_rxStageF$D_OUT;
  wire pciw_pci0_rxStageF$CLR,
       pciw_pci0_rxStageF$DEQ,
       pciw_pci0_rxStageF$EMPTY_N,
       pciw_pci0_rxStageF$ENQ,
       pciw_pci0_rxStageF$FULL_N;

  // ports of submodule pciw_pci0_txInF
  wire [152 : 0] pciw_pci0_txInF$D_IN, pciw_pci0_txInF$D_OUT;
  wire pciw_pci0_txInF$CLR,
       pciw_pci0_txInF$DEQ,
       pciw_pci0_txInF$EMPTY_N,
       pciw_pci0_txInF$ENQ,
       pciw_pci0_txInF$FULL_N;

  // ports of submodule pciw_pci0_txStageF
  wire [152 : 0] pciw_pci0_txStageF$D_IN, pciw_pci0_txStageF$D_OUT;
  wire pciw_pci0_txStageF$CLR,
       pciw_pci0_txStageF$DEQ,
       pciw_pci0_txStageF$EMPTY_N,
       pciw_pci0_txStageF$ENQ,
       pciw_pci0_txStageF$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_pciw_pci0_rx_destage,
       WILL_FIRE_RL_pciw_pci0_rx_enstage,
       WILL_FIRE_RL_pciw_pci0_tx_destage,
       WILL_FIRE_RL_pciw_pci0_tx_enstage;

  // inputs to muxes for submodule ports
  wire [152 : 0] MUX_pciw_pci0_rxOutF$enq_1__VAL_1,
		 MUX_pciw_pci0_rxOutF$enq_1__VAL_2;
  wire [127 : 0] MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_1,
		 MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_2;
  wire [1 : 0] MUX_pciw_pci0_rxSerPos$write_1__VAL_1;
  wire MUX_pciw_pci0_rxOutF$enq_1__SEL_1,
       MUX_pciw_pci0_rxSerPos$write_1__SEL_1;

  // remaining internal signals
  wire [127 : 0] data__h1225, data__h1785, y_avValue_snd__h1621;
  wire [15 : 0] be__h1224;
  wire [6 : 0] INV_pciw_pci0_pcie_ep_ava_debug__57_BIT_0_58_X_ETC___d229;
  wire IF_pciw_pci0_rxSerPos_EQ_0_AND_NOT_pciw_pci0_p_ETC___d16,
       swParity__h8923,
       z__h10152,
       z__h10159,
       z__h10166,
       z__h10173,
       z__h10180,
       z__h10187,
       z__h10194,
       z__h10201,
       z__h10208,
       z__h10215,
       z__h10222,
       z__h10229,
       z__h10236,
       z__h10243,
       z__h10250,
       z__h10257,
       z__h10264,
       z__h10271,
       z__h10278,
       z__h10285,
       z__h10292,
       z__h10299,
       z__h10306,
       z__h10313,
       z__h10320,
       z__h10327,
       z__h10334,
       z__h10341,
       z__h10348,
       z__h10355,
       z__h9867,
       z__h9874,
       z__h9881,
       z__h9888,
       z__h9895,
       z__h9902;

  // oscillator and gates for output clock p125clk
  assign p125clk = pciw_pci0_pcie_ep$ava_core_clk_out ;
  assign CLK_GATE_p125clk = 1'b1 ;

  // output resets
  assign p125rst = pciw_pci0_pcie_ep$ava_srstn ;

  // value method pcie_tx
  assign pcie_tx = pciw_pci0_pcie_ep$pcie_tx_out ;

  // value method led
  assign led = ledReg ;

  // submodule ctop
  mkCTop4B ctop(.pciDevice(pciDevice),
		.CLK_sys0_clk(sys0_clk),
		.RST_N_sys0_rst(sys0_rstn),
		.CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
		.RST_N(pciw_pci0_pcie_ep$ava_srstn),
		.gps_ppsSyncIn_x(ctop$gps_ppsSyncIn_x),
		.server_request_put(ctop$server_request_put),
		.switch_x(ctop$switch_x),
		.wci_m_0_SData(ctop$wci_m_0_SData),
		.wci_m_0_SFlag(ctop$wci_m_0_SFlag),
		.wci_m_0_SResp(ctop$wci_m_0_SResp),
		.wci_m_1_SData(ctop$wci_m_1_SData),
		.wci_m_1_SFlag(ctop$wci_m_1_SFlag),
		.wci_m_1_SResp(ctop$wci_m_1_SResp),
		.wci_m_2_SData(ctop$wci_m_2_SData),
		.wci_m_2_SFlag(ctop$wci_m_2_SFlag),
		.wci_m_2_SResp(ctop$wci_m_2_SResp),
		.wci_m_3_SData(ctop$wci_m_3_SData),
		.wci_m_3_SFlag(ctop$wci_m_3_SFlag),
		.wci_m_3_SResp(ctop$wci_m_3_SResp),
		.wci_m_4_SData(ctop$wci_m_4_SData),
		.wci_m_4_SFlag(ctop$wci_m_4_SFlag),
		.wci_m_4_SResp(ctop$wci_m_4_SResp),
		.wmemiM0_SData(ctop$wmemiM0_SData),
		.wmemiM0_SResp(ctop$wmemiM0_SResp),
		.wsi_s_adc_MBurstLength(ctop$wsi_s_adc_MBurstLength),
		.wsi_s_adc_MByteEn(ctop$wsi_s_adc_MByteEn),
		.wsi_s_adc_MCmd(ctop$wsi_s_adc_MCmd),
		.wsi_s_adc_MData(ctop$wsi_s_adc_MData),
		.wsi_s_adc_MReqInfo(ctop$wsi_s_adc_MReqInfo),
		.EN_server_request_put(ctop$EN_server_request_put),
		.EN_server_response_get(ctop$EN_server_response_get),
		.wci_m_0_SThreadBusy(ctop$wci_m_0_SThreadBusy),
		.wci_m_1_SThreadBusy(ctop$wci_m_1_SThreadBusy),
		.wci_m_2_SThreadBusy(ctop$wci_m_2_SThreadBusy),
		.wci_m_3_SThreadBusy(ctop$wci_m_3_SThreadBusy),
		.wci_m_4_SThreadBusy(ctop$wci_m_4_SThreadBusy),
		.wsi_s_adc_MReqLast(ctop$wsi_s_adc_MReqLast),
		.wsi_s_adc_MBurstPrecise(ctop$wsi_s_adc_MBurstPrecise),
		.wsi_s_adc_MReset_n(ctop$wsi_s_adc_MReset_n),
		.wsi_m_dac_SThreadBusy(ctop$wsi_m_dac_SThreadBusy),
		.wsi_m_dac_SReset_n(ctop$wsi_m_dac_SReset_n),
		.wmemiM0_SRespLast(ctop$wmemiM0_SRespLast),
		.wmemiM0_SCmdAccept(ctop$wmemiM0_SCmdAccept),
		.wmemiM0_SDataAccept(ctop$wmemiM0_SDataAccept),
		.RDY_server_request_put(ctop$RDY_server_request_put),
		.server_response_get(ctop$server_response_get),
		.RDY_server_response_get(ctop$RDY_server_response_get),
		.led(),
		.wci_m_0_MCmd(),
		.wci_m_0_MAddrSpace(),
		.wci_m_0_MByteEn(),
		.wci_m_0_MAddr(),
		.wci_m_0_MData(),
		.wci_m_0_MFlag(),
		.wci_m_1_MCmd(),
		.wci_m_1_MAddrSpace(),
		.wci_m_1_MByteEn(),
		.wci_m_1_MAddr(),
		.wci_m_1_MData(),
		.wci_m_1_MFlag(),
		.wci_m_2_MCmd(),
		.wci_m_2_MAddrSpace(),
		.wci_m_2_MByteEn(),
		.wci_m_2_MAddr(),
		.wci_m_2_MData(),
		.wci_m_2_MFlag(),
		.wci_m_3_MCmd(),
		.wci_m_3_MAddrSpace(),
		.wci_m_3_MByteEn(),
		.wci_m_3_MAddr(),
		.wci_m_3_MData(),
		.wci_m_3_MFlag(),
		.wci_m_4_MCmd(),
		.wci_m_4_MAddrSpace(),
		.wci_m_4_MByteEn(),
		.wci_m_4_MAddr(),
		.wci_m_4_MData(),
		.wci_m_4_MFlag(),
		.cpNow(),
		.RDY_cpNow(),
		.wsi_s_adc_SThreadBusy(),
		.wsi_s_adc_SReset_n(),
		.wsi_m_dac_MCmd(),
		.wsi_m_dac_MReqLast(),
		.wsi_m_dac_MBurstPrecise(),
		.wsi_m_dac_MBurstLength(),
		.wsi_m_dac_MData(),
		.wsi_m_dac_MByteEn(),
		.wsi_m_dac_MReqInfo(),
		.wsi_m_dac_MReset_n(),
		.wmemiM0_MCmd(),
		.wmemiM0_MReqLast(),
		.wmemiM0_MAddr(),
		.wmemiM0_MBurstLength(),
		.wmemiM0_MDataValid(),
		.wmemiM0_MDataLast(),
		.wmemiM0_MData(),
		.wmemiM0_MDataByteEn(),
		.wmemiM0_MReset_n(),
		.gps_ppsSyncOut(),
		.RST_N_wci_m_0(),
		.RST_N_wci_m_1(),
		.RST_N_wci_m_2(),
		.RST_N_wci_m_3(),
		.RST_N_wci_m_4());

  // submodule pciw_aliveLed_sb
  SyncBit #(.init(1'd0)) pciw_aliveLed_sb(.sCLK(sys0_clk),
					  .dCLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					  .sRST_N(sys0_rstn),
					  .sD_IN(pciw_aliveLed_sb$sD_IN),
					  .sEN(pciw_aliveLed_sb$sEN),
					  .dD_OUT(pciw_aliveLed_sb$dD_OUT));

  // submodule pciw_i2pF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_i2pF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
				     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
				     .D_IN(pciw_i2pF$D_IN),
				     .ENQ(pciw_i2pF$ENQ),
				     .DEQ(pciw_i2pF$DEQ),
				     .CLR(pciw_i2pF$CLR),
				     .D_OUT(pciw_i2pF$D_OUT),
				     .FULL_N(pciw_i2pF$FULL_N),
				     .EMPTY_N(pciw_i2pF$EMPTY_N));

  // submodule pciw_linkLed_sb
  SyncBit #(.init(1'd0)) pciw_linkLed_sb(.sCLK(sys0_clk),
					 .dCLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					 .sRST_N(sys0_rstn),
					 .sD_IN(pciw_linkLed_sb$sD_IN),
					 .sEN(pciw_linkLed_sb$sEN),
					 .dD_OUT(pciw_linkLed_sb$dD_OUT));

  // submodule pciw_p2iF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_p2iF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
				     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
				     .D_IN(pciw_p2iF$D_IN),
				     .ENQ(pciw_p2iF$ENQ),
				     .DEQ(pciw_p2iF$DEQ),
				     .CLR(pciw_p2iF$CLR),
				     .D_OUT(pciw_p2iF$D_OUT),
				     .FULL_N(pciw_p2iF$FULL_N),
				     .EMPTY_N(pciw_p2iF$EMPTY_N));

  // submodule pciw_pci0_pcie_ep
  pcie_hip_s4gx_gen2_x4_128_wrapper pciw_pci0_pcie_ep(.sys0_clk(sys0_clk),
						      .sys0_rstn(sys0_rstn),
						      .pcie_clk(pcie_clk),
						      .pcie_rstn(pcie_rstn),
						      .pcie_rx_in(pciw_pci0_pcie_ep$pcie_rx_in),
						      .rx_st_mask0(pciw_pci0_pcie_ep$rx_st_mask0),
						      .rx_st_ready0(pciw_pci0_pcie_ep$rx_st_ready0),
						      .tx_st_data0(pciw_pci0_pcie_ep$tx_st_data0),
						      .tx_st_empty0(pciw_pci0_pcie_ep$tx_st_empty0),
						      .tx_st_eop0(pciw_pci0_pcie_ep$tx_st_eop0),
						      .tx_st_err0(pciw_pci0_pcie_ep$tx_st_err0),
						      .tx_st_sop0(pciw_pci0_pcie_ep$tx_st_sop0),
						      .tx_st_valid0(pciw_pci0_pcie_ep$tx_st_valid0),
						      .pcie_tx_out(pciw_pci0_pcie_ep$pcie_tx_out),
						      .ava_alive(pciw_pci0_pcie_ep$ava_alive),
						      .ava_lnk_up(pciw_pci0_pcie_ep$ava_lnk_up),
						      .ava_debug(pciw_pci0_pcie_ep$ava_debug),
						      .tl_cfg_add(pciw_pci0_pcie_ep$tl_cfg_add),
						      .tl_cfg_ctl(pciw_pci0_pcie_ep$tl_cfg_ctl),
						      .tl_cfg_ctl_wr(),
						      .tl_cfg_sts(),
						      .tl_cfg_sts_wr(),
						      .rx_st_valid0(pciw_pci0_pcie_ep$rx_st_valid0),
						      .rx_st_bardec0(pciw_pci0_pcie_ep$rx_st_bardec0),
						      .rx_st_be0(pciw_pci0_pcie_ep$rx_st_be0),
						      .rx_st_data0(pciw_pci0_pcie_ep$rx_st_data0),
						      .rx_st_sop0(pciw_pci0_pcie_ep$rx_st_sop0),
						      .rx_st_eop0(pciw_pci0_pcie_ep$rx_st_eop0),
						      .rx_st_empty0(),
						      .rx_st_err0(),
						      .tx_st_ready0(pciw_pci0_pcie_ep$tx_st_ready0),
						      .tx_cred0(),
						      .tx_fifo_empty0(),
						      .ava_core_clk_out(pciw_pci0_pcie_ep$ava_core_clk_out),
						      .ava_srstn(pciw_pci0_pcie_ep$ava_srstn));

  // submodule pciw_pci0_rxOutF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_rxOutF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
					    .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					    .D_IN(pciw_pci0_rxOutF$D_IN),
					    .ENQ(pciw_pci0_rxOutF$ENQ),
					    .DEQ(pciw_pci0_rxOutF$DEQ),
					    .CLR(pciw_pci0_rxOutF$CLR),
					    .D_OUT(pciw_pci0_rxOutF$D_OUT),
					    .FULL_N(pciw_pci0_rxOutF$FULL_N),
					    .EMPTY_N(pciw_pci0_rxOutF$EMPTY_N));

  // submodule pciw_pci0_rxStageF
  FIFO1 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_rxStageF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
					      .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					      .D_IN(pciw_pci0_rxStageF$D_IN),
					      .ENQ(pciw_pci0_rxStageF$ENQ),
					      .DEQ(pciw_pci0_rxStageF$DEQ),
					      .CLR(pciw_pci0_rxStageF$CLR),
					      .D_OUT(pciw_pci0_rxStageF$D_OUT),
					      .FULL_N(pciw_pci0_rxStageF$FULL_N),
					      .EMPTY_N(pciw_pci0_rxStageF$EMPTY_N));

  // submodule pciw_pci0_txInF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_txInF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
					   .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					   .D_IN(pciw_pci0_txInF$D_IN),
					   .ENQ(pciw_pci0_txInF$ENQ),
					   .DEQ(pciw_pci0_txInF$DEQ),
					   .CLR(pciw_pci0_txInF$CLR),
					   .D_OUT(pciw_pci0_txInF$D_OUT),
					   .FULL_N(pciw_pci0_txInF$FULL_N),
					   .EMPTY_N(pciw_pci0_txInF$EMPTY_N));

  // submodule pciw_pci0_txStageF
  FIFO1 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_txStageF(.RST_N(pciw_pci0_pcie_ep$ava_srstn),
					      .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					      .D_IN(pciw_pci0_txStageF$D_IN),
					      .ENQ(pciw_pci0_txStageF$ENQ),
					      .DEQ(pciw_pci0_txStageF$DEQ),
					      .CLR(pciw_pci0_txStageF$CLR),
					      .D_OUT(pciw_pci0_txStageF$D_OUT),
					      .FULL_N(pciw_pci0_txStageF$FULL_N),
					      .EMPTY_N(pciw_pci0_txStageF$EMPTY_N));

  // rule RL_pciw_pci0_rx_enstage
  assign WILL_FIRE_RL_pciw_pci0_rx_enstage =
	     IF_pciw_pci0_rxSerPos_EQ_0_AND_NOT_pciw_pci0_p_ETC___d16 &&
	     pciw_pci0_pcie_ep$rx_st_valid0 &&
	     !pciw_pci0_rxStageF$EMPTY_N ;

  // rule RL_pciw_pci0_rx_destage
  assign WILL_FIRE_RL_pciw_pci0_rx_destage =
	     pciw_pci0_rxOutF$FULL_N && pciw_pci0_rxStageF$EMPTY_N &&
	     pciw_pci0_pcie_ep$rx_st_valid0 ;

  // rule RL_pciw_pci0_tx_enstage
  assign WILL_FIRE_RL_pciw_pci0_tx_enstage =
	     pciw_pci0_txInF$EMPTY_N &&
	     (!pciw_pci0_txInF$D_OUT[152] || pciw_pci0_txInF$D_OUT[34] ||
	      pciw_pci0_txStageF$FULL_N) &&
	     pciw_pci0_pcie_ep$tx_st_ready0 &&
	     !pciw_pci0_txStageF$EMPTY_N ;

  // rule RL_pciw_pci0_tx_destage
  assign WILL_FIRE_RL_pciw_pci0_tx_destage =
	     pciw_pci0_txInF$EMPTY_N && pciw_pci0_txStageF$EMPTY_N &&
	     pciw_pci0_pcie_ep$tx_st_ready0 ;

  // inputs to muxes for submodule ports
  assign MUX_pciw_pci0_rxOutF$enq_1__SEL_1 =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage &&
	     pciw_pci0_rxSerPos == 2'd0 &&
	     (!pciw_pci0_pcie_ep$rx_st_sop0 ||
	      pciw_pci0_pcie_ep$rx_st_data0[34]) ;
  assign MUX_pciw_pci0_rxSerPos$write_1__SEL_1 =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage &&
	     (pciw_pci0_rxSerPos != 2'd0 ||
	      pciw_pci0_pcie_ep$rx_st_sop0 &&
	      !pciw_pci0_pcie_ep$rx_st_data0[34]) ;
  assign MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_1 =
	     (!pciw_pci0_txInF$D_OUT[152] || pciw_pci0_txInF$D_OUT[34]) ?
	       data__h1785 :
	       y_avValue_snd__h1621 ;
  assign MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_2 =
	     { pciw_pci0_txInF$D_OUT[31:0],
	       pciw_pci0_txInF$D_OUT[63:32],
	       pciw_pci0_txInF$D_OUT[95:64],
	       pciw_pci0_txStageF$D_OUT[127:96] } ;
  assign MUX_pciw_pci0_rxOutF$enq_1__VAL_1 =
	     { pciw_pci0_pcie_ep$rx_st_sop0,
	       pciw_pci0_pcie_ep$rx_st_eop0,
	       pciw_pci0_pcie_ep$rx_st_bardec0[6:0],
	       pciw_pci0_pcie_ep$rx_st_be0,
	       pciw_pci0_pcie_ep$rx_st_data0 } ;
  assign MUX_pciw_pci0_rxOutF$enq_1__VAL_2 =
	     { pciw_pci0_pcie_ep$rx_st_sop0,
	       pciw_pci0_pcie_ep$rx_st_eop0,
	       pciw_pci0_pcie_ep$rx_st_bardec0[6:0],
	       be__h1224,
	       data__h1225 } ;
  assign MUX_pciw_pci0_rxSerPos$write_1__VAL_1 = pciw_pci0_rxSerPos + 2'd3 ;

  // inlined wires
  assign pciw_pci0_pwAvaTx$whas =
	     WILL_FIRE_RL_pciw_pci0_tx_destage ||
	     WILL_FIRE_RL_pciw_pci0_tx_enstage ;
  assign pciw_pci0_pwAvaRx$whas =
	     WILL_FIRE_RL_pciw_pci0_rx_destage ||
	     WILL_FIRE_RL_pciw_pci0_rx_enstage ;

  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;

  // register ledReg
  assign ledReg$D_IN =
	     { 8'd189,
	       ~swParity__h8923,
	       INV_pciw_pci0_pcie_ep_ava_debug__57_BIT_0_58_X_ETC___d229 } ;
  assign ledReg$EN = 1'd1 ;

  // register pciDevice
  assign pciDevice$D_IN = pciw_pciDevice ;
  assign pciDevice$EN = 1'd1 ;

  // register pciw_pci0_deviceReg
  assign pciw_pci0_deviceReg$D_IN =
	     { pciw_pci0_pcie_ep$tl_cfg_ctl[12:0], 3'd0 } ;
  assign pciw_pci0_deviceReg$EN = pciw_pci0_pcie_ep$tl_cfg_add == 4'hF ;

  // register pciw_pci0_rxSerPos
  assign pciw_pci0_rxSerPos$D_IN =
	     MUX_pciw_pci0_rxSerPos$write_1__SEL_1 ?
	       MUX_pciw_pci0_rxSerPos$write_1__VAL_1 :
	       2'd0 ;
  assign pciw_pci0_rxSerPos$EN =
	     MUX_pciw_pci0_rxSerPos$write_1__SEL_1 ||
	     WILL_FIRE_RL_pciw_pci0_rx_destage &&
	     pciw_pci0_pcie_ep$rx_st_eop0 ;

  // register pciw_pci0_txHeadPushed
  assign pciw_pci0_txHeadPushed$D_IN = 1'd0 ;
  assign pciw_pci0_txHeadPushed$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage &&
	     pciw_pci0_txInF$D_OUT[151] &&
	     (!pciw_pci0_txInF$D_OUT[152] || pciw_pci0_txInF$D_OUT[34]) ||
	     WILL_FIRE_RL_pciw_pci0_tx_destage && pciw_pci0_txInF$D_OUT[151] ;

  // register pciw_pci0_txSerPos
  assign pciw_pci0_txSerPos$D_IN = 2'd0 ;
  assign pciw_pci0_txSerPos$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage &&
	     pciw_pci0_txInF$D_OUT[151] &&
	     (!pciw_pci0_txInF$D_OUT[152] || pciw_pci0_txInF$D_OUT[34]) ||
	     WILL_FIRE_RL_pciw_pci0_tx_destage && pciw_pci0_txInF$D_OUT[151] ;

  // register pciw_pciDevice
  assign pciw_pciDevice$D_IN = pciw_pci0_deviceReg ;
  assign pciw_pciDevice$EN = 1'd1 ;

  // register swReg
  assign swReg$D_IN = usr_sw_i ;
  assign swReg$EN = 1'd1 ;

  // submodule ctop
  assign ctop$gps_ppsSyncIn_x = 1'b0 ;
  assign ctop$server_request_put = pciw_p2iF$D_OUT ;
  assign ctop$switch_x = 3'h0 ;
  assign ctop$wci_m_0_SData = 32'h0 ;
  assign ctop$wci_m_0_SFlag = 2'h0 ;
  assign ctop$wci_m_0_SResp = 2'h0 ;
  assign ctop$wci_m_1_SData = 32'h0 ;
  assign ctop$wci_m_1_SFlag = 2'h0 ;
  assign ctop$wci_m_1_SResp = 2'h0 ;
  assign ctop$wci_m_2_SData = 32'h0 ;
  assign ctop$wci_m_2_SFlag = 2'h0 ;
  assign ctop$wci_m_2_SResp = 2'h0 ;
  assign ctop$wci_m_3_SData = 32'h0 ;
  assign ctop$wci_m_3_SFlag = 2'h0 ;
  assign ctop$wci_m_3_SResp = 2'h0 ;
  assign ctop$wci_m_4_SData = 32'h0 ;
  assign ctop$wci_m_4_SFlag = 2'h0 ;
  assign ctop$wci_m_4_SResp = 2'h0 ;
  assign ctop$wmemiM0_SData = 128'h0 ;
  assign ctop$wmemiM0_SResp = 2'h0 ;
  assign ctop$wsi_s_adc_MBurstLength = 12'h0 ;
  assign ctop$wsi_s_adc_MByteEn = 4'h0 ;
  assign ctop$wsi_s_adc_MCmd = 3'h0 ;
  assign ctop$wsi_s_adc_MData = 32'h0 ;
  assign ctop$wsi_s_adc_MReqInfo = 8'h0 ;
  assign ctop$EN_server_request_put =
	     ctop$RDY_server_request_put && pciw_p2iF$EMPTY_N ;
  assign ctop$EN_server_response_get =
	     ctop$RDY_server_response_get && pciw_i2pF$FULL_N ;
  assign ctop$wci_m_0_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_1_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_2_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_3_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_4_SThreadBusy = 1'b0 ;
  assign ctop$wsi_s_adc_MReqLast = 1'b0 ;
  assign ctop$wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign ctop$wsi_s_adc_MReset_n = 1'b0 ;
  assign ctop$wsi_m_dac_SThreadBusy = 1'b0 ;
  assign ctop$wsi_m_dac_SReset_n = 1'b0 ;
  assign ctop$wmemiM0_SRespLast = 1'b0 ;
  assign ctop$wmemiM0_SCmdAccept = 1'b0 ;
  assign ctop$wmemiM0_SDataAccept = 1'b0 ;

  // submodule pciw_aliveLed_sb
  assign pciw_aliveLed_sb$sD_IN = pciw_pci0_pcie_ep$ava_alive ;
  assign pciw_aliveLed_sb$sEN = 1'd1 ;

  // submodule pciw_i2pF
  assign pciw_i2pF$D_IN = ctop$server_response_get ;
  assign pciw_i2pF$ENQ = ctop$RDY_server_response_get && pciw_i2pF$FULL_N ;
  assign pciw_i2pF$DEQ = pciw_i2pF$EMPTY_N && pciw_pci0_txInF$FULL_N ;
  assign pciw_i2pF$CLR = 1'b0 ;

  // submodule pciw_linkLed_sb
  assign pciw_linkLed_sb$sD_IN = pciw_pci0_pcie_ep$ava_lnk_up ;
  assign pciw_linkLed_sb$sEN = 1'd1 ;

  // submodule pciw_p2iF
  assign pciw_p2iF$D_IN =
	     { pciw_pci0_rxOutF$D_OUT[152:144],
	       pciw_pci0_rxOutF$D_OUT[128],
	       pciw_pci0_rxOutF$D_OUT[129],
	       pciw_pci0_rxOutF$D_OUT[130],
	       pciw_pci0_rxOutF$D_OUT[131],
	       pciw_pci0_rxOutF$D_OUT[132],
	       pciw_pci0_rxOutF$D_OUT[133],
	       pciw_pci0_rxOutF$D_OUT[134],
	       pciw_pci0_rxOutF$D_OUT[135],
	       pciw_pci0_rxOutF$D_OUT[136],
	       pciw_pci0_rxOutF$D_OUT[137],
	       pciw_pci0_rxOutF$D_OUT[138],
	       pciw_pci0_rxOutF$D_OUT[139],
	       pciw_pci0_rxOutF$D_OUT[140],
	       pciw_pci0_rxOutF$D_OUT[141],
	       pciw_pci0_rxOutF$D_OUT[142],
	       pciw_pci0_rxOutF$D_OUT[143],
	       pciw_pci0_rxOutF$D_OUT[31:0],
	       pciw_pci0_rxOutF$D_OUT[63:32],
	       pciw_pci0_rxOutF$D_OUT[95:64],
	       pciw_pci0_rxOutF$D_OUT[127:96] } ;
  assign pciw_p2iF$ENQ = pciw_pci0_rxOutF$EMPTY_N && pciw_p2iF$FULL_N ;
  assign pciw_p2iF$DEQ = ctop$RDY_server_request_put && pciw_p2iF$EMPTY_N ;
  assign pciw_p2iF$CLR = 1'b0 ;

  // submodule pciw_pci0_pcie_ep
  assign pciw_pci0_pcie_ep$pcie_rx_in = pcie_rx_i ;
  assign pciw_pci0_pcie_ep$rx_st_mask0 = 1'b0 ;
  assign pciw_pci0_pcie_ep$rx_st_ready0 = 1'd1 ;
  assign pciw_pci0_pcie_ep$tx_st_data0 =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage ?
	       MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_1 :
	       MUX_pciw_pci0_pcie_ep$ava_tx_data_1__VAL_2 ;
  assign pciw_pci0_pcie_ep$tx_st_empty0 = 1'd0 ;
  assign pciw_pci0_pcie_ep$tx_st_eop0 = pciw_pci0_txInF$D_OUT[151] ;
  assign pciw_pci0_pcie_ep$tx_st_err0 = 1'b0 ;
  assign pciw_pci0_pcie_ep$tx_st_sop0 = pciw_pci0_txInF$D_OUT[152] ;
  assign pciw_pci0_pcie_ep$tx_st_valid0 = pciw_pci0_pwAvaTx$whas ;

  // submodule pciw_pci0_rxOutF
  assign pciw_pci0_rxOutF$D_IN =
	     MUX_pciw_pci0_rxOutF$enq_1__SEL_1 ?
	       MUX_pciw_pci0_rxOutF$enq_1__VAL_1 :
	       MUX_pciw_pci0_rxOutF$enq_1__VAL_2 ;
  assign pciw_pci0_rxOutF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage &&
	     pciw_pci0_rxSerPos == 2'd0 &&
	     (!pciw_pci0_pcie_ep$rx_st_sop0 ||
	      pciw_pci0_pcie_ep$rx_st_data0[34]) ||
	     WILL_FIRE_RL_pciw_pci0_rx_destage ;
  assign pciw_pci0_rxOutF$DEQ = pciw_pci0_rxOutF$EMPTY_N && pciw_p2iF$FULL_N ;
  assign pciw_pci0_rxOutF$CLR = 1'b0 ;

  // submodule pciw_pci0_rxStageF
  assign pciw_pci0_rxStageF$D_IN = MUX_pciw_pci0_rxOutF$enq_1__VAL_1 ;
  assign pciw_pci0_rxStageF$ENQ = MUX_pciw_pci0_rxSerPos$write_1__SEL_1 ;
  assign pciw_pci0_rxStageF$DEQ = WILL_FIRE_RL_pciw_pci0_rx_destage ;
  assign pciw_pci0_rxStageF$CLR = 1'b0 ;

  // submodule pciw_pci0_txInF
  assign pciw_pci0_txInF$D_IN = pciw_i2pF$D_OUT ;
  assign pciw_pci0_txInF$ENQ = pciw_i2pF$EMPTY_N && pciw_pci0_txInF$FULL_N ;
  assign pciw_pci0_txInF$DEQ = pciw_pci0_pwAvaTx$whas ;
  assign pciw_pci0_txInF$CLR = 1'b0 ;

  // submodule pciw_pci0_txStageF
  assign pciw_pci0_txStageF$D_IN = pciw_pci0_txInF$D_OUT ;
  assign pciw_pci0_txStageF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage &&
	     pciw_pci0_txInF$D_OUT[152] &&
	     !pciw_pci0_txInF$D_OUT[34] ;
  assign pciw_pci0_txStageF$DEQ = WILL_FIRE_RL_pciw_pci0_tx_destage ;
  assign pciw_pci0_txStageF$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_pciw_pci0_rxSerPos_EQ_0_AND_NOT_pciw_pci0_p_ETC___d16 =
	     (pciw_pci0_rxSerPos == 2'd0 &&
	      (!pciw_pci0_pcie_ep$rx_st_sop0 ||
	       pciw_pci0_pcie_ep$rx_st_data0[34])) ?
	       pciw_pci0_rxOutF$FULL_N :
	       pciw_pci0_rxStageF$FULL_N ;
  assign INV_pciw_pci0_pcie_ep_ava_debug__57_BIT_0_58_X_ETC___d229 =
	     { ~(z__h10355 ^ pciw_pci0_pcie_ep$ava_debug[31]),
	       ~pciw_aliveLed_sb$dD_OUT,
	       ~pciw_linkLed_sb$dD_OUT,
	       ~freeCnt[29:26] } ;
  assign be__h1224 =
	     { pciw_pci0_pcie_ep$rx_st_be0[3:0],
	       pciw_pci0_rxStageF$D_OUT[139:128] } ;
  assign data__h1225 =
	     { pciw_pci0_pcie_ep$rx_st_data0[15:0],
	       pciw_pci0_rxStageF$D_OUT[111:0] } ;
  assign data__h1785 =
	     { pciw_pci0_txInF$D_OUT[31:0],
	       pciw_pci0_txInF$D_OUT[63:32],
	       pciw_pci0_txInF$D_OUT[95:64],
	       pciw_pci0_txInF$D_OUT[127:96] } ;
  assign swParity__h8923 = z__h9902 ^ swReg[7] ;
  assign y_avValue_snd__h1621 =
	     { 16'h0,
	       pciw_pci0_txInF$D_OUT[15:0],
	       pciw_pci0_txInF$D_OUT[63:32],
	       pciw_pci0_txInF$D_OUT[95:64],
	       pciw_pci0_txInF$D_OUT[127:96] } ;
  assign z__h10152 =
	     pciw_pci0_pcie_ep$ava_debug[0] ^ pciw_pci0_pcie_ep$ava_debug[1] ;
  assign z__h10159 = z__h10152 ^ pciw_pci0_pcie_ep$ava_debug[2] ;
  assign z__h10166 = z__h10159 ^ pciw_pci0_pcie_ep$ava_debug[3] ;
  assign z__h10173 = z__h10166 ^ pciw_pci0_pcie_ep$ava_debug[4] ;
  assign z__h10180 = z__h10173 ^ pciw_pci0_pcie_ep$ava_debug[5] ;
  assign z__h10187 = z__h10180 ^ pciw_pci0_pcie_ep$ava_debug[6] ;
  assign z__h10194 = z__h10187 ^ pciw_pci0_pcie_ep$ava_debug[7] ;
  assign z__h10201 = z__h10194 ^ pciw_pci0_pcie_ep$ava_debug[8] ;
  assign z__h10208 = z__h10201 ^ pciw_pci0_pcie_ep$ava_debug[9] ;
  assign z__h10215 = z__h10208 ^ pciw_pci0_pcie_ep$ava_debug[10] ;
  assign z__h10222 = z__h10215 ^ pciw_pci0_pcie_ep$ava_debug[11] ;
  assign z__h10229 = z__h10222 ^ pciw_pci0_pcie_ep$ava_debug[12] ;
  assign z__h10236 = z__h10229 ^ pciw_pci0_pcie_ep$ava_debug[13] ;
  assign z__h10243 = z__h10236 ^ pciw_pci0_pcie_ep$ava_debug[14] ;
  assign z__h10250 = z__h10243 ^ pciw_pci0_pcie_ep$ava_debug[15] ;
  assign z__h10257 = z__h10250 ^ pciw_pci0_pcie_ep$ava_debug[16] ;
  assign z__h10264 = z__h10257 ^ pciw_pci0_pcie_ep$ava_debug[17] ;
  assign z__h10271 = z__h10264 ^ pciw_pci0_pcie_ep$ava_debug[18] ;
  assign z__h10278 = z__h10271 ^ pciw_pci0_pcie_ep$ava_debug[19] ;
  assign z__h10285 = z__h10278 ^ pciw_pci0_pcie_ep$ava_debug[20] ;
  assign z__h10292 = z__h10285 ^ pciw_pci0_pcie_ep$ava_debug[21] ;
  assign z__h10299 = z__h10292 ^ pciw_pci0_pcie_ep$ava_debug[22] ;
  assign z__h10306 = z__h10299 ^ pciw_pci0_pcie_ep$ava_debug[23] ;
  assign z__h10313 = z__h10306 ^ pciw_pci0_pcie_ep$ava_debug[24] ;
  assign z__h10320 = z__h10313 ^ pciw_pci0_pcie_ep$ava_debug[25] ;
  assign z__h10327 = z__h10320 ^ pciw_pci0_pcie_ep$ava_debug[26] ;
  assign z__h10334 = z__h10327 ^ pciw_pci0_pcie_ep$ava_debug[27] ;
  assign z__h10341 = z__h10334 ^ pciw_pci0_pcie_ep$ava_debug[28] ;
  assign z__h10348 = z__h10341 ^ pciw_pci0_pcie_ep$ava_debug[29] ;
  assign z__h10355 = z__h10348 ^ pciw_pci0_pcie_ep$ava_debug[30] ;
  assign z__h9867 = swReg[0] ^ swReg[1] ;
  assign z__h9874 = z__h9867 ^ swReg[2] ;
  assign z__h9881 = z__h9874 ^ swReg[3] ;
  assign z__h9888 = z__h9881 ^ swReg[4] ;
  assign z__h9895 = z__h9888 ^ swReg[5] ;
  assign z__h9902 = z__h9895 ^ swReg[6] ;

  // handling of inlined registers

  always@(posedge pciw_pci0_pcie_ep$ava_core_clk_out)
  begin
    if (!pciw_pci0_pcie_ep$ava_srstn)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ledReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_deviceReg <= `BSV_ASSIGNMENT_DELAY 16'hAAAA;
	pciw_pci0_rxSerPos <= `BSV_ASSIGNMENT_DELAY 2'd0;
	pciw_pci0_txHeadPushed <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_pci0_txSerPos <= `BSV_ASSIGNMENT_DELAY 2'd0;
	pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	swReg <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (ledReg$EN) ledReg <= `BSV_ASSIGNMENT_DELAY ledReg$D_IN;
	if (pciDevice$EN) pciDevice <= `BSV_ASSIGNMENT_DELAY pciDevice$D_IN;
	if (pciw_pci0_deviceReg$EN)
	  pciw_pci0_deviceReg <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_deviceReg$D_IN;
	if (pciw_pci0_rxSerPos$EN)
	  pciw_pci0_rxSerPos <= `BSV_ASSIGNMENT_DELAY pciw_pci0_rxSerPos$D_IN;
	if (pciw_pci0_txHeadPushed$EN)
	  pciw_pci0_txHeadPushed <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txHeadPushed$D_IN;
	if (pciw_pci0_txSerPos$EN)
	  pciw_pci0_txSerPos <= `BSV_ASSIGNMENT_DELAY pciw_pci0_txSerPos$D_IN;
	if (pciw_pciDevice$EN)
	  pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY pciw_pciDevice$D_IN;
	if (swReg$EN) swReg <= `BSV_ASSIGNMENT_DELAY swReg$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    ledReg = 16'hAAAA;
    pciDevice = 16'hAAAA;
    pciw_pci0_deviceReg = 16'hAAAA;
    pciw_pci0_rxSerPos = 2'h2;
    pciw_pci0_txHeadPushed = 1'h0;
    pciw_pci0_txSerPos = 2'h2;
    pciw_pciDevice = 16'hAAAA;
    swReg = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkFTop_alst4

