// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Sep 11 11:42:56 2024
// Host        : rute-I620-G30 running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/E/likai/mba-sim-dev-0.0.13-ntt/fpga/sync_fpga/srcs/aurora/ip/aurora_64b66b_w256_1375Gbps_ex.gen/sources_1/ip/aurora_64b66b_w256_1375Gbps/aurora_64b66b_w256_1375Gbps_stub.v
// Design      : aurora_64b66b_w256_1375Gbps
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "aurora_64b66b_v12_0_10, Coregen v14.3_ip3, Number of lanes = 4, Line rate is double25.0Gbps, Reference Clock is double156.25MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration" *)
module aurora_64b66b_w256_1375Gbps(s_axi_tx_tdata, s_axi_tx_tvalid, 
  s_axi_tx_tready, m_axi_rx_tdata, m_axi_rx_tvalid, rxp, rxn, txp, txn, refclk1_in, hard_err, 
  soft_err, channel_up, lane_up, mmcm_not_locked, user_clk, sync_clk, reset_pb, 
  gt_rxcdrovrden_in, power_down, loopback, pma_init, gt_pll_lock, gt_qpllclk_quad1_in, 
  gt_qpllrefclk_quad1_in, gt_qplllock_quad1_in, gt_qpllrefclklost_quad1, 
  gt_to_common_qpllreset_out, s_axi_awaddr, s_axi_awvalid, s_axi_awready, 
  s_axi_awaddr_lane1, s_axi_awvalid_lane1, s_axi_awready_lane1, s_axi_awaddr_lane2, 
  s_axi_awvalid_lane2, s_axi_awready_lane2, s_axi_awaddr_lane3, s_axi_awvalid_lane3, 
  s_axi_awready_lane3, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, s_axi_bvalid, 
  s_axi_bresp, s_axi_bready, s_axi_wdata_lane1, s_axi_wstrb_lane1, s_axi_wvalid_lane1, 
  s_axi_wready_lane1, s_axi_bvalid_lane1, s_axi_bresp_lane1, s_axi_bready_lane1, 
  s_axi_wdata_lane2, s_axi_wstrb_lane2, s_axi_wvalid_lane2, s_axi_wready_lane2, 
  s_axi_bvalid_lane2, s_axi_bresp_lane2, s_axi_bready_lane2, s_axi_wdata_lane3, 
  s_axi_wstrb_lane3, s_axi_wvalid_lane3, s_axi_wready_lane3, s_axi_bvalid_lane3, 
  s_axi_bresp_lane3, s_axi_bready_lane3, s_axi_araddr, s_axi_arvalid, s_axi_arready, 
  s_axi_araddr_lane1, s_axi_arvalid_lane1, s_axi_arready_lane1, s_axi_araddr_lane2, 
  s_axi_arvalid_lane2, s_axi_arready_lane2, s_axi_araddr_lane3, s_axi_arvalid_lane3, 
  s_axi_arready_lane3, s_axi_rdata, s_axi_rvalid, s_axi_rresp, s_axi_rready, 
  s_axi_rdata_lane1, s_axi_rvalid_lane1, s_axi_rresp_lane1, s_axi_rready_lane1, 
  s_axi_rdata_lane2, s_axi_rvalid_lane2, s_axi_rresp_lane2, s_axi_rready_lane2, 
  s_axi_rdata_lane3, s_axi_rvalid_lane3, s_axi_rresp_lane3, s_axi_rready_lane3, init_clk, 
  link_reset_out, gt_powergood, sys_reset_out, bufg_gt_clr_out, tx_out_clk)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:255],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:255],m_axi_rx_tvalid,rxp[0:3],rxn[0:3],txp[0:3],txn[0:3],refclk1_in,hard_err,soft_err,channel_up,lane_up[0:3],mmcm_not_locked,user_clk,sync_clk,reset_pb,gt_rxcdrovrden_in,power_down,loopback[2:0],pma_init,gt_pll_lock,gt_qpllclk_quad1_in,gt_qpllrefclk_quad1_in,gt_qplllock_quad1_in,gt_qpllrefclklost_quad1,gt_to_common_qpllreset_out,s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_awaddr_lane1[31:0],s_axi_awvalid_lane1,s_axi_awready_lane1,s_axi_awaddr_lane2[31:0],s_axi_awvalid_lane2,s_axi_awready_lane2,s_axi_awaddr_lane3[31:0],s_axi_awvalid_lane3,s_axi_awready_lane3,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bvalid,s_axi_bresp[1:0],s_axi_bready,s_axi_wdata_lane1[31:0],s_axi_wstrb_lane1[3:0],s_axi_wvalid_lane1,s_axi_wready_lane1,s_axi_bvalid_lane1,s_axi_bresp_lane1[1:0],s_axi_bready_lane1,s_axi_wdata_lane2[31:0],s_axi_wstrb_lane2[3:0],s_axi_wvalid_lane2,s_axi_wready_lane2,s_axi_bvalid_lane2,s_axi_bresp_lane2[1:0],s_axi_bready_lane2,s_axi_wdata_lane3[31:0],s_axi_wstrb_lane3[3:0],s_axi_wvalid_lane3,s_axi_wready_lane3,s_axi_bvalid_lane3,s_axi_bresp_lane3[1:0],s_axi_bready_lane3,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_araddr_lane1[31:0],s_axi_arvalid_lane1,s_axi_arready_lane1,s_axi_araddr_lane2[31:0],s_axi_arvalid_lane2,s_axi_arready_lane2,s_axi_araddr_lane3[31:0],s_axi_arvalid_lane3,s_axi_arready_lane3,s_axi_rdata[31:0],s_axi_rvalid,s_axi_rresp[1:0],s_axi_rready,s_axi_rdata_lane1[31:0],s_axi_rvalid_lane1,s_axi_rresp_lane1[1:0],s_axi_rready_lane1,s_axi_rdata_lane2[31:0],s_axi_rvalid_lane2,s_axi_rresp_lane2[1:0],s_axi_rready_lane2,s_axi_rdata_lane3[31:0],s_axi_rvalid_lane3,s_axi_rresp_lane3[1:0],s_axi_rready_lane3,init_clk,link_reset_out,gt_powergood[3:0],sys_reset_out,bufg_gt_clr_out,tx_out_clk" */;
  input [0:255]s_axi_tx_tdata;
  input s_axi_tx_tvalid;
  output s_axi_tx_tready;
  output [0:255]m_axi_rx_tdata;
  output m_axi_rx_tvalid;
  input [0:3]rxp;
  input [0:3]rxn;
  output [0:3]txp;
  output [0:3]txn;
  input refclk1_in;
  output hard_err;
  output soft_err;
  output channel_up;
  output [0:3]lane_up;
  input mmcm_not_locked;
  input user_clk;
  input sync_clk;
  input reset_pb;
  input gt_rxcdrovrden_in;
  input power_down;
  input [2:0]loopback;
  input pma_init;
  output gt_pll_lock;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  input gt_qplllock_quad1_in;
  input gt_qpllrefclklost_quad1;
  output gt_to_common_qpllreset_out;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_awaddr_lane1;
  input s_axi_awvalid_lane1;
  output s_axi_awready_lane1;
  input [31:0]s_axi_awaddr_lane2;
  input s_axi_awvalid_lane2;
  output s_axi_awready_lane2;
  input [31:0]s_axi_awaddr_lane3;
  input s_axi_awvalid_lane3;
  output s_axi_awready_lane3;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output s_axi_bvalid;
  output [1:0]s_axi_bresp;
  input s_axi_bready;
  input [31:0]s_axi_wdata_lane1;
  input [3:0]s_axi_wstrb_lane1;
  input s_axi_wvalid_lane1;
  output s_axi_wready_lane1;
  output s_axi_bvalid_lane1;
  output [1:0]s_axi_bresp_lane1;
  input s_axi_bready_lane1;
  input [31:0]s_axi_wdata_lane2;
  input [3:0]s_axi_wstrb_lane2;
  input s_axi_wvalid_lane2;
  output s_axi_wready_lane2;
  output s_axi_bvalid_lane2;
  output [1:0]s_axi_bresp_lane2;
  input s_axi_bready_lane2;
  input [31:0]s_axi_wdata_lane3;
  input [3:0]s_axi_wstrb_lane3;
  input s_axi_wvalid_lane3;
  output s_axi_wready_lane3;
  output s_axi_bvalid_lane3;
  output [1:0]s_axi_bresp_lane3;
  input s_axi_bready_lane3;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  input [31:0]s_axi_araddr_lane1;
  input s_axi_arvalid_lane1;
  output s_axi_arready_lane1;
  input [31:0]s_axi_araddr_lane2;
  input s_axi_arvalid_lane2;
  output s_axi_arready_lane2;
  input [31:0]s_axi_araddr_lane3;
  input s_axi_arvalid_lane3;
  output s_axi_arready_lane3;
  output [31:0]s_axi_rdata;
  output s_axi_rvalid;
  output [1:0]s_axi_rresp;
  input s_axi_rready;
  output [31:0]s_axi_rdata_lane1;
  output s_axi_rvalid_lane1;
  output [1:0]s_axi_rresp_lane1;
  input s_axi_rready_lane1;
  output [31:0]s_axi_rdata_lane2;
  output s_axi_rvalid_lane2;
  output [1:0]s_axi_rresp_lane2;
  input s_axi_rready_lane2;
  output [31:0]s_axi_rdata_lane3;
  output s_axi_rvalid_lane3;
  output [1:0]s_axi_rresp_lane3;
  input s_axi_rready_lane3;
  input init_clk;
  output link_reset_out;
  output [3:0]gt_powergood;
  output sys_reset_out;
  output bufg_gt_clr_out;
  output tx_out_clk;
endmodule
