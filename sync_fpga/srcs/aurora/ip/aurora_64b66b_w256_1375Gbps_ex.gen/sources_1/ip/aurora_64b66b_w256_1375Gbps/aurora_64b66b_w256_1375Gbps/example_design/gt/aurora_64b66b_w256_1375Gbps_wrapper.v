 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2014 Xilinx, Inc. All rights reserved.
 //
 // This file contains confidential and proprietary information
 // of Xilinx, Inc. and is protected under U.S. and
 // international copyright and other intellectual property
 // laws.
 //
 // DISCLAIMER
 // This disclaimer is not a license and does not grant any
 // rights to the materials distributed herewith. Except as
 // otherwise provided in a valid license issued to you by
 // Xilinx, and to the maximum extent permitted by applicable
 // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 // (2) Xilinx shall not be liable (whether in contract or tort,
 // including negligence, or under any other theory of
 // liability) for any loss or damage of any kind or nature
 // related to, arising under or in connection with these
 // materials, including for any direct, or any indirect,
 // special, incidental, or consequential loss or damage
 // (including loss of data, profits, goodwill, or any type of
 // loss or damage suffered as a result of any action brought
 // by a third party) even if such damage or loss was
 // reasonably foreseeable or Xilinx had been advised of the
 // possibility of the same.
 //
 // CRITICAL APPLICATIONS
 // Xilinx products are not designed or intended to be fail-
 // safe, or for use in any application requiring fail-safe
 // performance, such as life-support or safety devices or
 // systems, Class III medical devices, nuclear facilities,
 // applications related to the deployment of airbags, or any
 // other applications that could lead to death, personal
 // injury, or severe property or environmental damage
 // (individually and collectively, "Critical
 // Applications"). Customer assumes the sole risk and
 // liability of any use of Xilinx products in Critical
 // Applications, subject only to applicable laws and
 // regulations governing limitations on product liability.
 //
 // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 // PART OF THIS FILE AT ALL TIMES.

 //
 //
 ////////////////////////////////////////////////////////////////////////////////
 // Design Name: aurora_64b66b_w256_1375Gbps_WRAPPER
 //
 // Module aurora_64b66b_w256_1375Gbps_WRAPPER

 // This is V8/K8 wrapper

`timescale 1 ps / 1 ps
   (* core_generation_info = "aurora_64b66b_w256_1375Gbps,aurora_64b66b_v12_0_10,{c_aurora_lanes=4,c_column_used=left,c_gt_clock_1=GTYQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=3,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=4,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=25.0,c_gt_type=GTYE4,c_qpll=true,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=156.25,c_simplex=false,c_simplex_mode=TX,c_stream=true,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Streaming,dataflow_config=Duplex}" *)
(* DowngradeIPIdentifiedWarnings="yes" *)
 module aurora_64b66b_w256_1375Gbps_WRAPPER #
 (
      parameter INTER_CB_GAP  = 5'd9,
      parameter SEQ_COUNT  = 4,
    parameter wait_for_fifo_wr_rst_busy_value = 6'd32,
      parameter TRAVELLING_STAGES = 3'd2,
      parameter BACKWARD_COMP_MODE1 = 1'b0, //disable check for interCB gap
      parameter BACKWARD_COMP_MODE2 = 1'b0, //reduce RXCDR lock time, Block Sync SH max count, disable CDR FSM in wrapper
      parameter BACKWARD_COMP_MODE3 = 1'b0, //clear hot-plug counter with any valid btf detected
      parameter SCRAMBLER_SEED = 58'h2AA_AAAA_AAAA_AAAA,
     // Channel bond MASTER/SLAVE connection
      parameter CHAN_BOND_MODE_0 = 2'b10,
      parameter CHAN_BOND_MODE_1 = 2'b10,
      parameter CHAN_BOND_MODE_0_LANE1 = 2'b10,
      parameter CHAN_BOND_MODE_1_LANE1 = 2'b10,
      parameter CHAN_BOND_MODE_0_LANE2 = 2'b01,
      parameter CHAN_BOND_MODE_1_LANE2 = 2'b01,
      parameter CHAN_BOND_MODE_0_LANE3 = 2'b10,
      parameter CHAN_BOND_MODE_1_LANE3 = 2'b10,
 // Simulation attributes
     parameter   EXAMPLE_SIMULATION   =   0            // Set to 1 to speed up sim reset
 )
 `define DLY #1
 (

 
    //----------------- Receive Ports - Channel Bonding Ports -----------------
       ENCHANSYNC_IN,
       ENCHANSYNC_IN_LANE1,
       ENCHANSYNC_IN_LANE2,
       ENCHANSYNC_IN_LANE3,

       CHBONDDONE_OUT,
       CHBONDDONE_OUT_LANE1,
       CHBONDDONE_OUT_LANE2,
       CHBONDDONE_OUT_LANE3,
     //RXLOSSOFSYNC indication
       RXLOSSOFSYNC_OUT,
       RXLOSSOFSYNC_OUT_LANE1,
       RXLOSSOFSYNC_OUT_LANE2,
       RXLOSSOFSYNC_OUT_LANE3,
 //----------------- Receive Ports - Clock Correction Ports -----------------
       RXBUFERR_OUT,
       RXBUFERR_OUT_LANE1,
       RXBUFERR_OUT_LANE2,
       RXBUFERR_OUT_LANE3,
     //----------------- Receive Ports - RX Data Path interface -----------------
       RXDATA_OUT,
       RXDATA_OUT_LANE1,
       RXDATA_OUT_LANE2,
       RXDATA_OUT_LANE3,
       RXHEADER_OUT,
       RXHEADER_OUT_LANE1,
       RXHEADER_OUT_LANE2,
       RXHEADER_OUT_LANE3,
       RXHEADER_OUT_ERR,
       RXHEADER_OUT_ERR_LANE1,
       RXHEADER_OUT_ERR_LANE2,
       RXHEADER_OUT_ERR_LANE3,
       RXRESET_IN,
       RXRESET_IN_LANE1,
       RXRESET_IN_LANE2,
       RXRESET_IN_LANE3,
       RXUSRCLK2_IN,
     //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
       RX1N_IN,
       RX1N_IN_LANE1,
       RX1N_IN_LANE2,
       RX1N_IN_LANE3,
       RX1P_IN,
       RX1P_IN_LANE1,
       RX1P_IN_LANE2,
       RX1P_IN_LANE3,
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       CHECK_POLARITY_IN,
       RXPOLARITY_IN,
       RX_NEG_OUT,
       CHECK_POLARITY_IN_LANE1,
       RXPOLARITY_IN_LANE1,
       RX_NEG_OUT_LANE1,
       CHECK_POLARITY_IN_LANE2,
       RXPOLARITY_IN_LANE2,
       RX_NEG_OUT_LANE2,
       CHECK_POLARITY_IN_LANE3,
       RXPOLARITY_IN_LANE3,
       RX_NEG_OUT_LANE3,
 //------------------- Shared Ports - Tile and PLL Ports --------------------
       REFCLK1_IN,

       GTXRESET_IN,
       RESET,
       GT_RXCDROVRDEN_IN,

       CHAN_BOND_RESET,

       PLLLKDET_OUT,
       PLLLKDET_OUT_LANE1,
       PLLLKDET_OUT_LANE2,
       PLLLKDET_OUT_LANE3,

       POWERDOWN_IN,

       TXOUTCLK1_OUT,
       TXOUTCLK1_OUT_LANE1,
       TXOUTCLK1_OUT_LANE2,
       TXOUTCLK1_OUT_LANE3,
     //-------------- Transmit Ports - 64b66b TX Header Ports --------------
       TXHEADER_IN,
       TXHEADER_IN_LANE1,
       TXHEADER_IN_LANE2,
       TXHEADER_IN_LANE3,
       //---------------- Transmit Ports - TX Data Path interface -----------------
       TXDATA_IN,
       TXDATA_IN_LANE1,
       TXDATA_IN_LANE2,
       TXDATA_IN_LANE3,
       TXRESET_IN,
       TXRESET_IN_LANE1,
       TXRESET_IN_LANE2,
       TXRESET_IN_LANE3,

       TXUSRCLK_IN,//
       TXUSRCLK2_IN,//
       //txusrclk_out,
       //txusrclk2_out,

       TXBUFERR_OUT,
       TXBUFERR_OUT_LANE1,
       TXBUFERR_OUT_LANE2,
       TXBUFERR_OUT_LANE3,
       //--------------Data Valid Signals for Local Link
       TXDATAVALID_OUT,
       TXDATAVALID_SYMGEN_OUT,
       TXDATAVALID_OUT_lane1,
       TXDATAVALID_SYMGEN_OUT_lane1,
       TXDATAVALID_OUT_lane2,
       TXDATAVALID_SYMGEN_OUT_lane2,
       TXDATAVALID_OUT_lane3,
       TXDATAVALID_SYMGEN_OUT_lane3,

       RXDATAVALID_OUT,
       RXDATAVALID_OUT_LANE1,
       RXDATAVALID_OUT_LANE2,
       RXDATAVALID_OUT_LANE3,
     //------------- Transmit Ports - TX Driver and OOB signalling --------------
       TX1N_OUT,
       TX1N_OUT_LANE1,
       TX1N_OUT_LANE2,
       TX1N_OUT_LANE3,
       TX1P_OUT,
       TX1P_OUT_LANE1,
       TX1P_OUT_LANE2,
       TX1P_OUT_LANE3,
    //---------------------- Loopback Port ----------------------
       LOOPBACK_IN,
    //---------------------- GTXE2 CHANNEL DRP Ports ----------------------
       DRP_CLK_IN,
       CHANNEL_UP_RX_IF,
       CHANNEL_UP_TX_IF,
//---{
       gt_qpllclk_quad1_in,
       gt_qpllrefclk_quad1_in,
       gt_qplllock_quad1_in,
       gt_qpllrefclklost_quad1,





       //gt_qplllock_in,
       //gt_qpllrefclklost_in,
       gt_to_common_qpllreset_out,
//---}
       gt0_drpaddr,
       gt0_drpdi,
       gt0_drpdo,
       gt0_drprdy,
       gt0_drpen,
       gt0_drpwe,
       gt1_drpaddr,
       gt1_drpdi,
       gt1_drpdo,
       gt1_drprdy,
       gt1_drpen,
       gt1_drpwe,
       gt2_drpaddr,
       gt2_drpdi,
       gt2_drpdo,
       gt2_drprdy,
       gt2_drpen,
       gt2_drpwe,
       gt3_drpaddr,
       gt3_drpdi,
       gt3_drpdo,
       gt3_drprdy,
       gt3_drpen,
       gt3_drpwe,

       //---------------------- GTXE2 COMMON DRP Ports ----------------------


       gt_powergood,




       //TXCLK_LOCK,
       INIT_CLK,
       USER_CLK,
       FSM_RESETDONE,
       LINK_RESET_OUT,
       bufg_gt_clr_out, // connect to clk_locked port of clocking module
       gtwiz_userclk_tx_active_out// connect to mmcm not locked of clocking module
 );
 //***************************** Port Declarations *****************************


     //---------------------- Loopback and Powerdown Ports ----------------------
     input    [2:0]      LOOPBACK_IN;
     input               CHANNEL_UP_RX_IF;
     input               CHANNEL_UP_TX_IF;
     //----------------- Receive Ports - Channel Bonding Ports -----------------
     //----------------- Receive Ports - Channel Bonding Ports -----------------
       input             ENCHANSYNC_IN;
       output            CHBONDDONE_OUT;
       output            RXLOSSOFSYNC_OUT;
     //----------------- Receive Ports - Clock Correction Ports -----------------
       output            RXBUFERR_OUT;
     //----------------- Receive Ports - RX Data Path interface -----------------
       output   [63:0]   RXDATA_OUT;
       output   [1:0]    RXHEADER_OUT;
       output            RXHEADER_OUT_ERR;
       input             RXRESET_IN;
       input             ENCHANSYNC_IN_LANE1;
       output            CHBONDDONE_OUT_LANE1;
       output            RXLOSSOFSYNC_OUT_LANE1;
     //----------------- Receive Ports - Clock Correction Ports -----------------
       output            RXBUFERR_OUT_LANE1;
     //----------------- Receive Ports - RX Data Path interface -----------------
       output   [63:0]   RXDATA_OUT_LANE1;
       output   [1:0]    RXHEADER_OUT_LANE1;
       output            RXHEADER_OUT_ERR_LANE1;
       input             RXRESET_IN_LANE1;
       input             ENCHANSYNC_IN_LANE2;
       output            CHBONDDONE_OUT_LANE2;
       output            RXLOSSOFSYNC_OUT_LANE2;
     //----------------- Receive Ports - Clock Correction Ports -----------------
       output            RXBUFERR_OUT_LANE2;
     //----------------- Receive Ports - RX Data Path interface -----------------
       output   [63:0]   RXDATA_OUT_LANE2;
       output   [1:0]    RXHEADER_OUT_LANE2;
       output            RXHEADER_OUT_ERR_LANE2;
       input             RXRESET_IN_LANE2;
       input             ENCHANSYNC_IN_LANE3;
       output            CHBONDDONE_OUT_LANE3;
       output            RXLOSSOFSYNC_OUT_LANE3;
     //----------------- Receive Ports - Clock Correction Ports -----------------
       output            RXBUFERR_OUT_LANE3;
     //----------------- Receive Ports - RX Data Path interface -----------------
       output   [63:0]   RXDATA_OUT_LANE3;
       output   [1:0]    RXHEADER_OUT_LANE3;
       output            RXHEADER_OUT_ERR_LANE3;
       input             RXRESET_IN_LANE3;
     input               RXUSRCLK2_IN;
     //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
       input             RX1N_IN;
       input             RX1P_IN;
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       input             CHECK_POLARITY_IN;
       input             RXPOLARITY_IN;
       output reg        RX_NEG_OUT;
       input             RX1N_IN_LANE1;
       input             RX1P_IN_LANE1;
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       input             CHECK_POLARITY_IN_LANE1;
       input             RXPOLARITY_IN_LANE1;
       output reg        RX_NEG_OUT_LANE1;
       input             RX1N_IN_LANE2;
       input             RX1P_IN_LANE2;
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       input             CHECK_POLARITY_IN_LANE2;
       input             RXPOLARITY_IN_LANE2;
       output reg        RX_NEG_OUT_LANE2;
       input             RX1N_IN_LANE3;
       input             RX1P_IN_LANE3;
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       input             CHECK_POLARITY_IN_LANE3;
       input             RXPOLARITY_IN_LANE3;
       output reg        RX_NEG_OUT_LANE3;
     //------------------- Shared Ports - Tile and PLL Ports --------------------
       input               REFCLK1_IN;
       input               GTXRESET_IN;
       input               CHAN_BOND_RESET;
       output            PLLLKDET_OUT;
       output            PLLLKDET_OUT_LANE1;
       output            PLLLKDET_OUT_LANE2;
       output            PLLLKDET_OUT_LANE3;
       output            TXOUTCLK1_OUT;
       output            TXOUTCLK1_OUT_LANE1;
       output            TXOUTCLK1_OUT_LANE2;
       output            TXOUTCLK1_OUT_LANE3;
       input               POWERDOWN_IN;
       input               RESET;
       input               GT_RXCDROVRDEN_IN;
     //-------------- Transmit Ports - TX Header Control Port ----------------
       input    [1:0]    TXHEADER_IN;
     //---------------- Transmit Ports - TX Data Path interface -----------------
       input    [63:0]   TXDATA_IN;
       input             TXRESET_IN;
       output            TXBUFERR_OUT;
       input    [1:0]    TXHEADER_IN_LANE1;
     //---------------- Transmit Ports - TX Data Path interface -----------------
       input    [63:0]   TXDATA_IN_LANE1;
       input             TXRESET_IN_LANE1;
       output            TXBUFERR_OUT_LANE1;
       input    [1:0]    TXHEADER_IN_LANE2;
     //---------------- Transmit Ports - TX Data Path interface -----------------
       input    [63:0]   TXDATA_IN_LANE2;
       input             TXRESET_IN_LANE2;
       output            TXBUFERR_OUT_LANE2;
       input    [1:0]    TXHEADER_IN_LANE3;
     //---------------- Transmit Ports - TX Data Path interface -----------------
       input    [63:0]   TXDATA_IN_LANE3;
       input             TXRESET_IN_LANE3;
       output            TXBUFERR_OUT_LANE3;
     input               TXUSRCLK_IN;//
     input               TXUSRCLK2_IN;//
     //output              txusrclk_out;//
     //output              txusrclk2_out;//
     //------------- Transmit Ports - TX Driver and OOB signalling --------------
       output            TX1N_OUT;
       output            TX1P_OUT;
       output            TX1N_OUT_LANE1;
       output            TX1P_OUT_LANE1;
       output            TX1N_OUT_LANE2;
       output            TX1P_OUT_LANE2;
       output            TX1N_OUT_LANE3;
       output            TX1P_OUT_LANE3;
     output              TXDATAVALID_OUT;
     output              TXDATAVALID_SYMGEN_OUT;
     output              TXDATAVALID_OUT_lane1;
     output              TXDATAVALID_SYMGEN_OUT_lane1;
     output              TXDATAVALID_OUT_lane2;
     output              TXDATAVALID_SYMGEN_OUT_lane2;
     output              TXDATAVALID_OUT_lane3;
     output              TXDATAVALID_SYMGEN_OUT_lane3;
       output            RXDATAVALID_OUT;
       output            RXDATAVALID_OUT_LANE1;
       output            RXDATAVALID_OUT_LANE2;
       output            RXDATAVALID_OUT_LANE3;
    //---------------------- GTXE2 CHANNEL DRP Ports ----------------------
     input             DRP_CLK_IN;
//---{
    input                     gt_qpllclk_quad1_in;// connected to GT common
    input                     gt_qpllrefclk_quad1_in;// connected to GT common
    input                     gt_qplllock_quad1_in   ;
    input                     gt_qpllrefclklost_quad1;


    //input                     gt_qplllock_in;
    //input                     gt_qpllrefclklost_in;
    output                    gt_to_common_qpllreset_out;

//---}
 
       input   [9:0]   gt0_drpaddr;
       input   [15:0]  gt0_drpdi;
       output  [15:0]  gt0_drpdo;
       output          gt0_drprdy;
       input           gt0_drpen;
       input           gt0_drpwe;
 
       input   [9:0]   gt1_drpaddr;
       input   [15:0]  gt1_drpdi;
       output  [15:0]  gt1_drpdo;
       output          gt1_drprdy;
       input           gt1_drpen;
       input           gt1_drpwe;
 
       input   [9:0]   gt2_drpaddr;
       input   [15:0]  gt2_drpdi;
       output  [15:0]  gt2_drpdo;
       output          gt2_drprdy;
       input           gt2_drpen;
       input           gt2_drpwe;
 
       input   [9:0]   gt3_drpaddr;
       input   [15:0]  gt3_drpdi;
       output  [15:0]  gt3_drpdo;
       output          gt3_drprdy;
       input           gt3_drpen;
       input           gt3_drpwe;

       output [3:0]           gt_powergood;



     //input             TXCLK_LOCK;
     input             INIT_CLK;
	 input             USER_CLK;
     output   reg      LINK_RESET_OUT;
     output   wire      FSM_RESETDONE;
     output            bufg_gt_clr_out; // connect to clocking module
     input             gtwiz_userclk_tx_active_out;// connect to clocking module

 //***************************** FIFO Watermark settings ************************
     localparam LOW_WATER_MARK_SLAVE  = 13'd450;
     localparam LOW_WATER_MARK_MASTER = 13'd450;

     localparam HIGH_WATER_MARK_SLAVE  = 13'd8;
     localparam HIGH_WATER_MARK_MASTER = 13'd14;

     localparam SH_CNT_MAX   = EXAMPLE_SIMULATION ? 16'd64 : (BACKWARD_COMP_MODE2) ? 16'd64 : 16'd60000;

     localparam SH_INVALID_CNT_MAX = 16'd16;
 //***************************** Wire Declarations *****************************
     // Ground and VCC signals
     wire                    tied_to_ground_i;
     wire    [280:0]          tied_to_ground_vec_i;

     // floating input port connection signals
       wire [11:0]       int_gt_rxbufstatus;
       wire [7:0]       int_gt_txbufstatus;
     //  wire to output lock signal
       wire                    tx_plllkdet_i;
       wire                    rx_plllkdet_i;
       wire                    tx_plllkdet_lane1_i;
       wire                    rx_plllkdet_lane1_i;
       wire                    tx_plllkdet_lane2_i;
       wire                    rx_plllkdet_lane2_i;
       wire                    tx_plllkdet_lane3_i;
       wire                    rx_plllkdet_lane3_i;

     // Electrical idle reset logic signals
     wire                    resetdone_i;

     // Channel Bonding
       wire     [4:0]          chbondi;
       wire     [4:0]          chbondi_lane1;
       wire     [4:0]          chbondi_lane2;
       wire     [4:0]          chbondi_lane3;

     wire     [4:0]          chbondi_unused_i;
     wire     [4:0]          chbondo_to_slaves_i;
     wire                    state;
     wire  [6:0]             txsequence_i;

     reg                     txsequence_ctr_en_int = 1'b0;
     reg   [6:0]             txseq_counter_i;
     wire                    data_valid_i;
     reg   [6:0]             txseq_counter_i_lane1;
     wire                    data_valid_i_lane1;
     reg   [6:0]             txseq_counter_i_lane2;
     wire                    data_valid_i_lane2;
     reg   [6:0]             txseq_counter_i_lane3;
     wire                    data_valid_i_lane3;
     reg   [2:0]             extend_reset_r;
     reg                     resetdone_r1;
     reg                     resetdone_r2;
     reg                     resetdone_r3;
     reg                     reset_r1;
     reg                     reset_r2;
     reg                     rx_reset_r1;
     reg                     rx_reset_r2;
     reg   [3:0]             reset_debounce_r;
     reg                     data_valid_r;
              reg      FSM_RESETDONE_j;
     //reg   [63:0]            pmaInitStage = 64'd0;
       wire  [1:0]             txheader_i;
       wire  [63:0]            scrambled_data_i;

(* shift_extract = "{no}"*)     wire  [63:0]            pre_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     wire  [1:0]             pre_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     wire                    pre_rxdatavalid_i;
(* shift_extract = "{no}"*)     wire                    pre_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r1_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r1_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r2_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r2_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r3_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r3_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r4_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r4_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pos_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pos_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pos_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pos_rxheadervalid_i;
(* shift_extract = "{no}"*)     reg   [63:0]            rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     rxheadervalid_i;

       wire                    rxgearboxslip_i;
       wire                    open_rxheader_i;
       wire                    rxlossofsync_out_i;
       reg                     rxlossofsync_out_q;
       wire  [63:0]            rxdata_to_fifo_i;
       wire                    rxrecclk_from_gtx_i;
       wire  [0:6]             not_connected_i;

       wire sync_rx_polarity_r;
       wire [3:0] sync_rx_polarity_r_j;
wire check_polarity_r2;
       wire  [1:0]             txheader_lane1_i;
       wire  [63:0]            scrambled_data_lane1_i;

(* shift_extract = "{no}"*)     wire  [63:0]            pre_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     wire  [1:0]             pre_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     wire                    pre_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     wire                    pre_rxheadervalid_lane1_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r1_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r1_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxheadervalid_lane1_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r2_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r2_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxheadervalid_lane1_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r3_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r3_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxheadervalid_lane1_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r4_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r4_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxheadervalid_lane1_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pos_rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pos_rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     pos_rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     pos_rxheadervalid_lane1_i;
(* shift_extract = "{no}"*)     reg   [63:0]            rxdata_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg   [1:0]             rxheader_from_gtx_lane1_i;
(* shift_extract = "{no}"*)     reg                     rxdatavalid_lane1_i;
(* shift_extract = "{no}"*)     reg                     rxheadervalid_lane1_i;

       wire                    rxgearboxslip_lane1_i;
       wire                    open_rxheader_lane1_i;
       wire                    rxlossofsync_out_lane1_i;
       reg                     rxlossofsync_out_lane1_q;
       wire  [63:0]            rxdata_to_fifo_lane1_i;
       wire                    rxrecclk_from_gtx_lane1_i;
       wire  [0:6]             not_connected_lane1_i;

       wire sync_rx_polarity_lane1_r;
wire check_polarity_lane1_r2;
       wire  [1:0]             txheader_lane2_i;
       wire  [63:0]            scrambled_data_lane2_i;

(* shift_extract = "{no}"*)     wire  [63:0]            pre_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     wire  [1:0]             pre_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     wire                    pre_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     wire                    pre_rxheadervalid_lane2_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r1_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r1_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxheadervalid_lane2_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r2_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r2_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxheadervalid_lane2_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r3_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r3_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxheadervalid_lane2_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r4_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r4_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxheadervalid_lane2_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pos_rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pos_rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     pos_rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     pos_rxheadervalid_lane2_i;
(* shift_extract = "{no}"*)     reg   [63:0]            rxdata_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg   [1:0]             rxheader_from_gtx_lane2_i;
(* shift_extract = "{no}"*)     reg                     rxdatavalid_lane2_i;
(* shift_extract = "{no}"*)     reg                     rxheadervalid_lane2_i;

       wire                    rxgearboxslip_lane2_i;
       wire                    open_rxheader_lane2_i;
       wire                    rxlossofsync_out_lane2_i;
       reg                     rxlossofsync_out_lane2_q;
       wire  [63:0]            rxdata_to_fifo_lane2_i;
       wire                    rxrecclk_from_gtx_lane2_i;
       wire  [0:6]             not_connected_lane2_i;

       wire sync_rx_polarity_lane2_r;
wire check_polarity_lane2_r2;
       wire  [1:0]             txheader_lane3_i;
       wire  [63:0]            scrambled_data_lane3_i;

(* shift_extract = "{no}"*)     wire  [63:0]            pre_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     wire  [1:0]             pre_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     wire                    pre_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     wire                    pre_rxheadervalid_lane3_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r1_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r1_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxheadervalid_lane3_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r2_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r2_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxheadervalid_lane3_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r3_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r3_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxheadervalid_lane3_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pre_r4_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r4_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxheadervalid_lane3_i;

(* shift_extract = "{no}"*)     reg   [63:0]            pos_rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pos_rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     pos_rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     pos_rxheadervalid_lane3_i;
(* shift_extract = "{no}"*)     reg   [63:0]            rxdata_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg   [1:0]             rxheader_from_gtx_lane3_i;
(* shift_extract = "{no}"*)     reg                     rxdatavalid_lane3_i;
(* shift_extract = "{no}"*)     reg                     rxheadervalid_lane3_i;

       wire                    rxgearboxslip_lane3_i;
       wire                    open_rxheader_lane3_i;
       wire                    rxlossofsync_out_lane3_i;
       reg                     rxlossofsync_out_lane3_q;
       wire  [63:0]            rxdata_to_fifo_lane3_i;
       wire                    rxrecclk_from_gtx_lane3_i;
       wire  [0:6]             not_connected_lane3_i;

       wire sync_rx_polarity_lane3_r;
wire check_polarity_lane3_r2;
wire      gtpll_locked_out_r2;
     reg                     reset_blocksync_r;
     reg                    new_gtx_rx_pcsreset_comb = 1'b1;

// (* KEEP = "TRUE" *) wire    rxrecclk_to_fabric_i;
   (* KEEP = "TRUE" *) wire    rxfsm_reset_i;//
     wire                    clkfbout_i;

     wire                    locked_i;
     wire                    gtx_rx_pcsreset_comb;
     wire   enable_32_i = 1'b1;

     wire                    gtpll_locked_out_i;
     wire                    gt_qplllock_quad1_i;
     wire                    gt_qplllock_quad2_i;
     wire                    gt_qplllock_quad3_i;
     wire                    gt_qplllock_quad4_i;
     wire                    gt_qplllock_quad5_i;
     wire                    txusrclk_gtx_reset_comb;
     wire                    stableclk_gtx_reset_comb;
     wire                    gtx_reset_comb;
       reg   [1:0]             txheader_r;
       reg   [1:0]             tx_hdr_r;
       reg   [1:0]             txheader_lane1_r;
       reg   [1:0]             tx_hdr_lane1_r;
       reg   [1:0]             txheader_lane2_r;
       reg   [1:0]             tx_hdr_lane2_r;
       reg   [1:0]             txheader_lane3_r;
       reg   [1:0]             tx_hdr_lane3_r;
      reg [1:0] cdr_reset_fsm_r = 2'd0;
      reg [7:0] cdr_reset_fsm_cntr_r = 8'd0;
      reg allow_block_sync_propagation = 1'b0;
      reg cdr_reset_fsm_lnkreset = 1'b0;
      localparam IDLE = 2'b00;
      localparam ASSERT_RXRESET = 2'b01;
      localparam DONE = 2'b10;

     wire allow_block_sync_propagation_inrxclk;
     wire blocksync_all_lanes_instableclk;
     wire                    blocksync_out_i;
     wire                    blocksync_out_lane1_i;
     wire                    blocksync_out_lane2_i;
     wire                    blocksync_out_lane3_i;
     wire blocksync_all_lanes_inrxclk;
     reg  blocksync_all_lanes_inrxclk_q = 1'b0;
     wire hpreset_or_pma_init_in;
     wire hpreset_in;
     wire hp_reset_i;
       wire  [1:0]             rxbuferr_out_i;
       wire  [1:0]             rxbuferr_out_lane1_i;
       wire  [1:0]             rxbuferr_out_lane2_i;
       wire  [1:0]             rxbuferr_out_lane3_i;
     wire  [1:0]             link_reset_0_c;
     wire  [1:0]             link_reset_1_c;
     wire  [1:0]             link_reset_2_c;
     wire  [1:0]             link_reset_3_c;
     wire                    link_reset_c;
//-------------------------------------------------
//-------------------------------------------------
     wire                    qpllreset_i;
     assign                  gt_to_common_qpllreset_out = qpllreset_i;

     wire                    gtxreset_i;
       reg                    rxdatavalid_to_fifo_i;
       reg  [1:0]             rxheader_to_fifo_i;
       reg                    rxdatavalid_to_fifo_lane1_i;
       reg  [1:0]             rxheader_to_fifo_lane1_i;
       reg                    rxdatavalid_to_fifo_lane2_i;
       reg  [1:0]             rxheader_to_fifo_lane2_i;
       reg                    rxdatavalid_to_fifo_lane3_i;
       reg  [1:0]             rxheader_to_fifo_lane3_i;
     wire                      tied_to_vcc_i;
     reg    [7:0]              reset_counter = 8'd0;
     (* KEEP = "TRUE" *) wire  rx_fsm_resetdone_i;
     (* KEEP = "TRUE" *) wire  tx_fsm_resetdone_i;
     (* KEEP = "TRUE" *) wire  rx_fsm_resetdone_ii;
     (* KEEP = "TRUE" *) wire  tx_fsm_resetdone_ii;
	 wire                    rx_fsm_resetdone_i_i;
	 wire                    tx_fsm_resetdone_i_i;
	 wire                    rx_fsm_resetdone_i_j;
	 wire                    tx_fsm_resetdone_i_j;

     wire                    gttxreset_t;
//     wire                    txuserrdy_t;
//     wire                    rxuserrdy_t;
     wire                    cpllreset_t;
     wire                    qpllreset_t;
     wire                    qpllrefclklost_i;
     wire                    cpllrefclklost_i;
     wire [3:0]  tx_resetdone_j;
     wire [3:0]  rx_resetdone_j;
     wire                    mmcm_reset_i;
     wire                    enchansync_all_i;
     wire                    txreset_for_lanes;
     wire                    rxreset_for_lanes;
     reg                     rxreset_for_lanes_q;
     wire                    HPCNT_RESET_IN;
     wire                    sys_and_fsm_reset_for_hpcnt;

// Common CBCC Reset module wires
     wire                    cbcc_fifo_reset_wr_clk;
     wire                    cbcc_fifo_reset_to_fifo_wr_clk;
     wire                    cbcc_data_srst;
     wire                    cbcc_fifo_reset_rd_clk;
     wire                    cbcc_fifo_reset_to_fifo_rd_clk;
     wire                    cbcc_only_reset_rd_clk;
     wire                    cbcc_reset_cbstg2_rd_clk;
// Common Logic for CBCC module reg/wires
     wire                    any_vld_btf_i;
     wire                    start_cb_writes_i;
(* KEEP = "TRUE" *) wire     do_rd_en_i;
(* KEEP = "TRUE" *) wire     bit_err_chan_bond_i;
(* KEEP = "TRUE" *) wire     final_gater_for_fifo_din_i;
     wire                    any_vld_btf_lane1_i;
     wire                    start_cb_writes_lane1_i;
(* KEEP = "TRUE" *) wire     do_rd_en_lane1_i;
(* KEEP = "TRUE" *) wire     bit_err_chan_bond_lane1_i;
(* KEEP = "TRUE" *) wire     final_gater_for_fifo_din_lane1_i;
     wire                    any_vld_btf_lane2_i;
     wire                    start_cb_writes_lane2_i;
(* KEEP = "TRUE" *) wire     do_rd_en_lane2_i;
(* KEEP = "TRUE" *) wire     bit_err_chan_bond_lane2_i;
(* KEEP = "TRUE" *) wire     final_gater_for_fifo_din_lane2_i;
     wire                    any_vld_btf_lane3_i;
     wire                    start_cb_writes_lane3_i;
(* KEEP = "TRUE" *) wire     do_rd_en_lane3_i;
(* KEEP = "TRUE" *) wire     bit_err_chan_bond_lane3_i;
(* KEEP = "TRUE" *) wire     final_gater_for_fifo_din_lane3_i;
(* KEEP = "TRUE" *) wire      all_start_cb_writes_i  ;
(* KEEP = "TRUE" *) wire      master_do_rd_en_i      ;
(* KEEP = "TRUE" *) wire      all_vld_btf_flag_i     ;

     wire  cb_bit_err_i;

     wire fsm_resetdone_to_new_gtx_rx_comb;

     wire  rxusrclk_out;
 //********************************* Main Body of Code**************************
 // For GT Assignment


    assign sync_rx_polarity_r_j = {
           sync_rx_polarity_lane3_r,
           sync_rx_polarity_lane2_r,
           sync_rx_polarity_lane1_r,
           sync_rx_polarity_r
                             };


     //-------------------------  Static signal Assigments ---------------------
     assign tied_to_ground_i             = 1'b0;
     assign tied_to_ground_vec_i         = 281'h0;
     assign tied_to_vcc_i                = 1'b1;

//------------------------------------------------------------------------------
// Assign lock signals
  //-----------------------
  //-----------------------
   /// quad 1 channels
   assign  PLLLKDET_OUT        = gt_qplllock_quad1_i &
                               //!mmcm_reset_i;// channel 1 will be default
                                      //!mmcm_reset_i;
                                  mmcm_reset_i;

aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_gt_qplllock_quad1_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (gt_qplllock_quad1_in),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (gt_qplllock_quad1_i),
       .scndry_vect_out ( )
      );

   assign  PLLLKDET_OUT_LANE1  = gt_qplllock_quad1_i & //!mmcm_reset_i;
                                  mmcm_reset_i;

   assign  PLLLKDET_OUT_LANE2  = gt_qplllock_quad1_i & //!mmcm_reset_i;
                                  mmcm_reset_i;

   assign  PLLLKDET_OUT_LANE3  = gt_qplllock_quad1_i &  //!mmcm_reset_i;
                                  mmcm_reset_i;
   /// quad 2 channels




   /// quad 3 channels




   /// quad 4 channels




   /// quad 5 channels




  //-----------------------
//------------------------------------------------------------------------------
        wire rx_elastic_buf_err;
        wire rx_elastic_buf_err_int = 1'b0
                                  || int_gt_rxbufstatus [2]
                                  || int_gt_rxbufstatus [5]
                                  || int_gt_rxbufstatus [8]
                                  || int_gt_rxbufstatus [11]
         ;
aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (1),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_rx_elastic_buferr
     (
       .prmry_aclk      (rxusrclk_out),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (rx_elastic_buf_err_int),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (USER_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (rx_elastic_buf_err),
       .scndry_vect_out ( )
      );
     wire rx_hard_err_usr;
                assign  RXBUFERR_OUT  = rxbuferr_out_i[1] || rxbuferr_out_i[0] || rx_elastic_buf_err;
                assign  RXBUFERR_OUT_LANE1  = rxbuferr_out_lane1_i[1] || rxbuferr_out_lane1_i[0] || rx_elastic_buf_err;
                assign  RXBUFERR_OUT_LANE2  = rxbuferr_out_lane2_i[1] || rxbuferr_out_lane2_i[0] || rx_elastic_buf_err;
                assign  RXBUFERR_OUT_LANE3  = rxbuferr_out_lane3_i[1] || rxbuferr_out_lane3_i[0] || rx_elastic_buf_err;
        assign rx_hard_err_usr = 1'b0
                                || RXBUFERR_OUT
                                || RXBUFERR_OUT_LANE1
                                || RXBUFERR_OUT_LANE2
                                || RXBUFERR_OUT_LANE3
         ;
//------------------------------------------------------------------------------
        wire tx_elastic_buf_err = 1'b0
                                  || int_gt_txbufstatus [1]
                                  || int_gt_txbufstatus [3]
                                  || int_gt_txbufstatus [5]
                                  || int_gt_txbufstatus [7]
;
     wire tx_hard_err_usr;
        // TXBUFERR_OUT ports are not used & are tied to ground
        assign  TXBUFERR_OUT  =  tx_elastic_buf_err;
        assign  TXBUFERR_OUT_LANE1  =  tx_elastic_buf_err;
        assign  TXBUFERR_OUT_LANE2  =  tx_elastic_buf_err;
        assign  TXBUFERR_OUT_LANE3  =  tx_elastic_buf_err;
        assign tx_hard_err_usr = 1'b0
                                || TXBUFERR_OUT
                                || TXBUFERR_OUT_LANE1
                                || TXBUFERR_OUT_LANE2
                                || TXBUFERR_OUT_LANE3
        ;
  // Logic to infer hard error
  reg hard_err_usr = 0;
  wire hard_err_init_sync;
  always @(posedge USER_CLK)
  begin
    hard_err_usr <= (tx_hard_err_usr && CHANNEL_UP_TX_IF) || (rx_hard_err_usr && CHANNEL_UP_RX_IF);
  end
aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_hard_err_init
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (hard_err_usr),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (hard_err_init_sync),
       .scndry_vect_out ( )
      );
    
     reg [7:0]  hard_err_cntr_r = 8'd0;
     reg        hard_err_rst_int;
     
     always @(posedge INIT_CLK)
     begin
       if(HPCNT_RESET_IN)
       begin
         hard_err_cntr_r <= 8'd0;
         hard_err_rst_int <= 1'b0;
       end
       else if(hard_err_init_sync || (|hard_err_cntr_r))
       begin
         if(&hard_err_cntr_r)
           hard_err_cntr_r <= hard_err_cntr_r;
         else
           hard_err_cntr_r <= hard_err_cntr_r + 1'b1;
         
         if((hard_err_cntr_r > 8'h03) & (hard_err_cntr_r < 8'hFD))
           hard_err_rst_int <= 1'b1;
         else
           hard_err_rst_int <= 1'b0;

       end
     end

//------------------------------------------------------------------------------
     // Channel Bonding
   assign  chbondi_unused_i  = 5'b0;
//------------------------------------------------------------------------------
                        assign  chbondi =  chbondo_to_slaves_i;
                        assign  chbondi_lane1 =  chbondo_to_slaves_i;
                        assign  chbondi_lane2 = chbondi_unused_i;
                        assign  chbondi_lane3 =  chbondo_to_slaves_i;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// below synchronizers are needed for synchronizing the xx_fsm_resetdone in user clock domain
    //----------------------------------------
    // rx_fsm_resetdone_i sychronized on user_clock
     aurora_64b66b_w256_1375Gbps_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_rx 
     ( 
         .prmry_in     (rx_fsm_resetdone_i), 
         .scndry_aclk  (USER_CLK), 
         .scndry_out   (rx_fsm_resetdone_i_i) 
     ); 
    //----------------------------------------
    // rx_fsm_resetdone_i sychronized on rxusrclk_out
	 aurora_64b66b_w256_1375Gbps_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_rx1 
    ( 
         .prmry_in     (rx_fsm_resetdone_i), 
         .scndry_aclk  (rxusrclk_out), 
         .scndry_out   (rx_fsm_resetdone_i_j) 
     );
    //----------------------------------------
    // tx_fsm_resetdone_i sychronized on user_clock
	aurora_64b66b_w256_1375Gbps_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_tx 
     ( 
         .prmry_in     (tx_fsm_resetdone_i), 
         .scndry_aclk  (USER_CLK), 
         .scndry_out   (tx_fsm_resetdone_i_i) 
     ); 
    //----------------------------------------
    // tx_fsm_resetdone_i sychronized on rxusrclk_out
    aurora_64b66b_w256_1375Gbps_rst_sync # 
    ( 
        .c_mtbf_stages (3) 
    )u_rst_done_sync_tx1 
    ( 
        .prmry_in     (tx_fsm_resetdone_i), 
        .scndry_aclk  (rxusrclk_out), 
        .scndry_out   (tx_fsm_resetdone_i_j) 
    ); 
    //----------------------------------------
//------------------------------------------------------------------------------
        // Assumption: TR/RX Reset Done are static and will remain active once activated
        assign FSM_RESETDONE   = tx_fsm_resetdone_i_i & rx_fsm_resetdone_i_i;
		assign FSM_RESETDONE_i = tx_fsm_resetdone_i_j & rx_fsm_resetdone_i_j;
        always @(posedge USER_CLK) begin
            FSM_RESETDONE_j <= `DLY FSM_RESETDONE;
        end
//------------------------------------------------------------------------------

aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_txusrclk_gtx_reset_comb
    (
      .prmry_in         (txusrclk_gtx_reset_comb),
      .scndry_aclk      (INIT_CLK),
      .scndry_out       (stableclk_gtx_reset_comb)
    );

aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_gtx_reset_comb
    (
      .prmry_in         (stableclk_gtx_reset_comb),
      .scndry_aclk      (TXUSRCLK2_IN),
      .scndry_out       (gtx_reset_comb)
    );
//------------------------------------------------------------------------------

     //------------------------- External Sequence Counter--------------------------
     //always @(TXUSRCLK2_IN)//
     always @(posedge TXUSRCLK2_IN)
     begin
         if(gtx_reset_comb) begin
             txseq_counter_i <=  `DLY  7'd0;
             txseq_counter_i_lane1 <=  `DLY  7'd0;
             txseq_counter_i_lane2 <=  `DLY  7'd0;
             txseq_counter_i_lane3 <=  `DLY  7'd0;
             txsequence_ctr_en_int <= `DLY 1'b0;
         end
         else if (txsequence_ctr_en_int) begin
           if(txseq_counter_i == 32)
             txseq_counter_i <=  `DLY  7'd0;
           else
             txseq_counter_i <=  `DLY txseq_counter_i + 7'd1;
           if(txseq_counter_i_lane1 == 32)
             txseq_counter_i_lane1 <=  `DLY  7'd0;
           else
             txseq_counter_i_lane1 <=  `DLY txseq_counter_i_lane1 + 7'd1;
           if(txseq_counter_i_lane2 == 32)
             txseq_counter_i_lane2 <=  `DLY  7'd0;
           else
             txseq_counter_i_lane2 <=  `DLY txseq_counter_i_lane2 + 7'd1;
           if(txseq_counter_i_lane3 == 32)
             txseq_counter_i_lane3 <=  `DLY  7'd0;
           else
             txseq_counter_i_lane3 <=  `DLY txseq_counter_i_lane3 + 7'd1;
         end
         txsequence_ctr_en_int <= `DLY ~txsequence_ctr_en_int;         
     end

     //Assign the Data Valid signal
     assign TXDATAVALID_OUT           = !((txseq_counter_i == 30) && !txsequence_ctr_en_int) && !((txseq_counter_i == 29) && txsequence_ctr_en_int);

     assign TXDATAVALID_SYMGEN_OUT    = (txseq_counter_i != 31);

     assign data_valid_i = (txseq_counter_i != 32);
     assign TXDATAVALID_OUT_lane1           = !((txseq_counter_i_lane1 == 30) && !txsequence_ctr_en_int) && !((txseq_counter_i_lane1 == 29) && txsequence_ctr_en_int);

     assign TXDATAVALID_SYMGEN_OUT_lane1    = (txseq_counter_i_lane1 != 31);

     assign data_valid_i_lane1 = (txseq_counter_i_lane1 != 32);
     assign TXDATAVALID_OUT_lane2           = !((txseq_counter_i_lane2 == 30) && !txsequence_ctr_en_int) && !((txseq_counter_i_lane2 == 29) && txsequence_ctr_en_int);

     assign TXDATAVALID_SYMGEN_OUT_lane2    = (txseq_counter_i_lane2 != 31);

     assign data_valid_i_lane2 = (txseq_counter_i_lane2 != 32);
     assign TXDATAVALID_OUT_lane3           = !((txseq_counter_i_lane3 == 30) && !txsequence_ctr_en_int) && !((txseq_counter_i_lane3 == 29) && txsequence_ctr_en_int);

     assign TXDATAVALID_SYMGEN_OUT_lane3    = (txseq_counter_i_lane3 != 31);

     assign data_valid_i_lane3 = (txseq_counter_i_lane3 != 32);





       //------------------------
       //------------------------
         //------------------------
        assign gtpll_locked_out_i = gt_qplllock_quad1_i;
        //------------------------
        //------------------------
        //------------------------
        //------------------------
        //------------------------
//------------------------------------------------------------------------------
       assign gtpll_locked_out_r2 = gtpll_locked_out_i;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
     // qualifying the reset from gtx_rx_pcsreset_comb  with !FSM_RESETDONE to
     // avoid X propagation

     aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_fsm_resetdone
     (
         .prmry_in(FSM_RESETDONE_j),
         .scndry_aclk           (rxusrclk_out), // (rxrecclk_to_fabric_i),
         .scndry_out            (fsm_resetdone_to_new_gtx_rx_comb)

     );

     //-- logical oring of incoming rx reset in signal for no. of lanes
     assign rxreset_for_lanes = RXRESET_IN |
                              RXRESET_IN_LANE1 |
                              RXRESET_IN_LANE2 |
                              RXRESET_IN_LANE3;
     
	 //--ored rx_reset_in signal is taken in  the recovered rx clock
     always @(posedge RXUSRCLK2_IN)
     begin
         rxreset_for_lanes_q <= `DLY rxreset_for_lanes;
     end

     //-- added synchronizer
	 wire fsm_resetdone_to_rxreset_in;

     aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_rxreset_in
     (
         .prmry_in              (rxreset_for_lanes_q),
         .scndry_aclk           (rxusrclk_out),
         .scndry_out            (fsm_resetdone_to_rxreset_in)

     );
     //--

   always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)
   begin
      new_gtx_rx_pcsreset_comb <=  gtx_rx_pcsreset_comb 
	                            | (!fsm_resetdone_to_new_gtx_rx_comb) 
                                | fsm_resetdone_to_rxreset_in ;
   end



   assign  hpreset_or_pma_init_in = GTXRESET_IN | hpreset_in | hard_err_rst_int;
   assign  hpreset_in             = link_reset_0_c[0] | link_reset_1_c[0] | link_reset_2_c[0] | link_reset_3_c[0];

//------------------------------------------------------------------------------
     always @ (posedge TXUSRCLK2_IN)//always @ (posedge TXUSRCLK2_IN)
     begin
           tx_hdr_r   <= `DLY TXHEADER_IN;
           tx_hdr_lane1_r   <= `DLY TXHEADER_IN_LANE1;
           tx_hdr_lane2_r   <= `DLY TXHEADER_IN_LANE2;
           tx_hdr_lane3_r   <= `DLY TXHEADER_IN_LANE3;
     end

        assign txreset_for_lanes = TXRESET_IN |
                            TXRESET_IN_LANE1 |
                            TXRESET_IN_LANE2 |
                            TXRESET_IN_LANE3;
//------------------------------------------------------------------------------

     always @ (posedge INIT_CLK)
          LINK_RESET_OUT <= `DLY 
                             cdr_reset_fsm_lnkreset |
                             link_reset_0_c[0]                              | link_reset_1_c[0]                              | link_reset_2_c[0]                              | link_reset_3_c[0] ;

  //Clocking onto the INIT-clock.
aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_tx_fsm_resetdone_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (tx_fsm_resetdone_i),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (tx_fsm_resetdone_ii),
       .scndry_vect_out ( )
      );
  //Clocking onto the INIT-clock.
aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_rx_fsm_resetdone_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (rx_fsm_resetdone_i),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (rx_fsm_resetdone_ii),
       .scndry_vect_out ( )
      );
assign mmcm_reset_i = tx_fsm_resetdone_ii & rx_fsm_resetdone_ii;

wire fabric_pcs_reset;
 assign txusrclk_gtx_reset_comb = fabric_pcs_reset;
//------------------------------------------------------------------------------
 //*************************************************************************************************
 //-----------------------------------GTX INSTANCE-----------------------------------------------
 //*************************************************************************************************
aurora_64b66b_w256_1375Gbps_MULTI_GT  aurora_64b66b_w256_1375Gbps_multi_gt_i
 (
         //---------------------------------------------------------------------
         //gtwix reset module interface ports starts
         //---------------------------------------------------------------------
		 .gtwiz_reset_all_in                       (GTXRESET_IN),

         .gtwiz_reset_clk_freerun_in               (INIT_CLK   ),

         .gtwiz_reset_tx_pll_and_datapath_in       (1'b0),

         .gtwiz_reset_tx_datapath_in               (1'b0),

         .gtwiz_reset_rx_pll_and_datapath_in       (GTXRESET_IN),
         .gtwiz_reset_rx_datapath_in               (rxfsm_reset_i),
         .gtwiz_reset_rx_data_good_in              (1'b1),

         .gtwiz_reset_rx_cdr_stable_out            (),
         .gtwiz_reset_tx_done_out                  (tx_fsm_resetdone_i),
         .gtwiz_reset_rx_done_out                  (rx_fsm_resetdone_i),
         .gtwiz_reset_qpll0reset_output            (qpllreset_i),//(??  gt common is in GT at the moment      ),
         //---------------------------------------------------------------------
         //gtwix reset module interface ports ends
         //---------------------------------------------------------------------

         .fabric_pcs_reset                     (fabric_pcs_reset            ),
         .bufg_gt_clr_out                      (bufg_gt_clr_out       ),// connect to clk_locked of clock module
         .gtwiz_userclk_tx_active_out          (gtwiz_userclk_tx_active_out ),// connect to mmcm not locked of clock module
         .userclk_rx_active_out                (gtx_rx_pcsreset_comb        ),

         //---------------------------------------------------------------------
         // connection of GT comman and GT channel clk and refclk starts
         //---------------------------------------------------------------------
         // when no . of channels are less than or equal to 4
         // connect the qpllclk and ref clk from GT common to GT channel
         //.gtrefclk00_in                                  (gt_qpllclk_quad1_in),//(gtrefclk00_in[0]),
         .gt0_qpll0clk_in             (gt_qpllclk_quad1_in   ),
         .gt0_qpll0refclk_in          (gt_qpllrefclk_quad1_in),
         .gt1_qpll0clk_in             (gt_qpllclk_quad1_in   ),
         .gt1_qpll0refclk_in          (gt_qpllrefclk_quad1_in),
         .gt2_qpll0clk_in             (gt_qpllclk_quad1_in   ),
         .gt2_qpll0refclk_in          (gt_qpllrefclk_quad1_in),
         .gt3_qpll0clk_in             (gt_qpllclk_quad1_in   ),
         .gt3_qpll0refclk_in          (gt_qpllrefclk_quad1_in),
         .gt0_gtwiz_reset_qpll0lock_in         (gt_qplllock_quad1_i  ),




         //---------------------------------------------------------------------
         // connection of GT comman and GT channel clk and refclk ends
         //---------------------------------------------------------------------

         .gt0_gtrefclk0_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         .gt1_gtrefclk0_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         .gt2_gtrefclk0_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         .gt3_gtrefclk0_in                 (REFCLK1_IN),// connect to same as GT common ref clock


         // GT reference clock per channel, connect to REF clk - same as for GT Common
         //, only one gt ref clk is needed
         //.gt0_gtrefclk1_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //-------------------------- Channel - DRP Ports  --------------------------
         .gt0_drpaddr                  (gt0_drpaddr),
         .gt0_drp_clk_in               (INIT_CLK),
         .gt0_drpdi                    (gt0_drpdi),
         .gt0_drpdo                    (gt0_drpdo),
         .gt0_drpen                    (gt0_drpen),
         .gt0_drprdy                   (gt0_drprdy),
         .gt0_drpwe                    (gt0_drpwe),
    //----------------------------- Loopback Ports -----------------------------
    //------------------- RX Initialization and Reset Ports --------------------
         .gt0_rxusrclk_out                 (),
         .gt0_rxusrclk2_out                (),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
         .gt0_txusrclk_in                 (TXUSRCLK_IN), 
         .gt0_txusrclk2_in                (TXUSRCLK2_IN),
    //----------------------------- Loopback Ports -----------------------------
         .gt_loopback                             ({4{LOOPBACK_IN}}),

         //.gt0_rxuserrdy_in                 (rxuserrdy_t),
         .gt_rxpolarity                            (sync_rx_polarity_r_j),
         .gt0_rxdata_out                   (pre_rxdata_from_gtx_i),
         //---------------------- Receive Ports - RX AFE Ports ----------------------
         .gt0_gthrxn_in                    (RX1N_IN),
         .gt0_gthrxp_in                    (RX1P_IN),
         //------------- Receive Ports - RX Fabric Output Control Ports -------------
         .gt0_rxoutclk_out                 (rxrecclk_from_gtx_i),
         //-------------------- Receive Ports - RX Gearbox Ports --------------------
         .gt0_rxdatavalid_out              (pre_rxdatavalid_i),
         .gt0_rxheader_out                 (pre_rxheader_from_gtx_i),
         .gt0_rxheadervalid_out            (pre_rxheadervalid_i),
         //------------------- Receive Ports - RX Gearbox Ports  --------------------
         .gt0_rxgearboxslip_in             (rxgearboxslip_i),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------
         .gt_gtrxreset                 ({4{GTXRESET_IN}}),
        //------------ Receive Ports -RX Initialization and Reset Ports ------------
         .gt_rxresetdone                (rx_resetdone_j),
        //------------------- TX Initialization and Reset Ports --------------------
         .gt_gttxreset                 ({4{GTXRESET_IN}}),

        //.gt0_txuserrdy_in                 (txuserrdy_t),//
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
         .gt0_txheader_in                  (txheader_r),
        //---------------- Transmit Ports - TX Data Path interface -----------------
           .gt0_txdata_in                  (scrambled_data_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
          .gt0_gthtxn_out                  (TX1N_OUT),
          .gt0_gthtxp_out                  (TX1P_OUT),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
          .gt0_txoutclk_out                (TXOUTCLK1_OUT),
          .gt0_txoutclkfabric_out          (),
          .gt0_txoutclkpcs_out             (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
          .gt0_txsequence_in               (txseq_counter_i),
        //----------------------- Receive Ports - CDR Ports ------------------------
         .gt0_rxcdrovrden_in               (GT_RXCDROVRDEN_IN),

         // GT reference clock per channel, connect to REF clk - same as for GT Common
         //, only one gt ref clk is needed
         //.gt1_gtrefclk1_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //-------------------------- Channel - DRP Ports  --------------------------
         .gt1_drpaddr                  (gt1_drpaddr),
         .gt1_drp_clk_in               (INIT_CLK),
         .gt1_drpdi                    (gt1_drpdi),
         .gt1_drpdo                    (gt1_drpdo),
         .gt1_drpen                    (gt1_drpen),
         .gt1_drprdy                   (gt1_drprdy),
         .gt1_drpwe                    (gt1_drpwe),
    //----------------------------- Loopback Ports -----------------------------
    //------------------- RX Initialization and Reset Ports --------------------
         .gt1_rxusrclk_out                 (),
         .gt1_rxusrclk2_out                (),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
         .gt1_txusrclk_in                 (TXUSRCLK_IN), 
         .gt1_txusrclk2_in                (TXUSRCLK2_IN),

         //.gt1_rxuserrdy_in                 (rxuserrdy_t),
         .gt1_rxdata_out                   (pre_rxdata_from_gtx_lane1_i),
         //---------------------- Receive Ports - RX AFE Ports ----------------------
         .gt1_gthrxn_in                    (RX1N_IN_LANE1),
         .gt1_gthrxp_in                    (RX1P_IN_LANE1),
         //------------- Receive Ports - RX Fabric Output Control Ports -------------
         .gt1_rxoutclk_out                 (rxrecclk_from_gtx_lane1_i),
         //-------------------- Receive Ports - RX Gearbox Ports --------------------
         .gt1_rxdatavalid_out              (pre_rxdatavalid_lane1_i),
         .gt1_rxheader_out                 (pre_rxheader_from_gtx_lane1_i),
         .gt1_rxheadervalid_out            (pre_rxheadervalid_lane1_i),
         //------------------- Receive Ports - RX Gearbox Ports  --------------------
         .gt1_rxgearboxslip_in             (rxgearboxslip_lane1_i),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------

        //.gt1_txuserrdy_in                 (txuserrdy_t),//
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
         .gt1_txheader_in                  (txheader_lane1_r),
        //---------------- Transmit Ports - TX Data Path interface -----------------
           .gt1_txdata_in                  (scrambled_data_lane1_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
          .gt1_gthtxn_out                  (TX1N_OUT_LANE1),
          .gt1_gthtxp_out                  (TX1P_OUT_LANE1),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
          .gt1_txoutclk_out                (TXOUTCLK1_OUT_LANE1),
          .gt1_txoutclkfabric_out          (),
          .gt1_txoutclkpcs_out             (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
          .gt1_txsequence_in               (txseq_counter_i_lane1),
        //----------------------- Receive Ports - CDR Ports ------------------------
         .gt1_rxcdrovrden_in               (GT_RXCDROVRDEN_IN),

         // GT reference clock per channel, connect to REF clk - same as for GT Common
         //, only one gt ref clk is needed
         //.gt2_gtrefclk1_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //-------------------------- Channel - DRP Ports  --------------------------
         .gt2_drpaddr                  (gt2_drpaddr),
         .gt2_drp_clk_in               (INIT_CLK),
         .gt2_drpdi                    (gt2_drpdi),
         .gt2_drpdo                    (gt2_drpdo),
         .gt2_drpen                    (gt2_drpen),
         .gt2_drprdy                   (gt2_drprdy),
         .gt2_drpwe                    (gt2_drpwe),
    //----------------------------- Loopback Ports -----------------------------
    //------------------- RX Initialization and Reset Ports --------------------
         .gt2_rxusrclk_out                 (rxusrclk_out), //(rxrecclk_to_fabric_i),
         .gt2_rxusrclk2_out                (),//(keep it open --> rxusrclk2_out),//(rxrecclk_to_fabric_i),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
         .gt2_txusrclk_in                 (TXUSRCLK_IN), 
         .gt2_txusrclk2_in                (TXUSRCLK2_IN),

         //.gt2_rxuserrdy_in                 (rxuserrdy_t),
         .gt2_rxdata_out                   (pre_rxdata_from_gtx_lane2_i),
         //---------------------- Receive Ports - RX AFE Ports ----------------------
         .gt2_gthrxn_in                    (RX1N_IN_LANE2),
         .gt2_gthrxp_in                    (RX1P_IN_LANE2),
         //------------- Receive Ports - RX Fabric Output Control Ports -------------
         .gt2_rxoutclk_out                 (rxrecclk_from_gtx_lane2_i),
         //-------------------- Receive Ports - RX Gearbox Ports --------------------
         .gt2_rxdatavalid_out              (pre_rxdatavalid_lane2_i),
         .gt2_rxheader_out                 (pre_rxheader_from_gtx_lane2_i),
         .gt2_rxheadervalid_out            (pre_rxheadervalid_lane2_i),
         //------------------- Receive Ports - RX Gearbox Ports  --------------------
         .gt2_rxgearboxslip_in             (rxgearboxslip_lane2_i),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------

        //.gt2_txuserrdy_in                 (txuserrdy_t),//
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
         .gt2_txheader_in                  (txheader_lane2_r),
        //---------------- Transmit Ports - TX Data Path interface -----------------
           .gt2_txdata_in                  (scrambled_data_lane2_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
          .gt2_gthtxn_out                  (TX1N_OUT_LANE2),
          .gt2_gthtxp_out                  (TX1P_OUT_LANE2),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
          .gt2_txoutclk_out                (TXOUTCLK1_OUT_LANE2),
          .gt2_txoutclkfabric_out          (),
          .gt2_txoutclkpcs_out             (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
          .gt2_txsequence_in               (txseq_counter_i_lane2),
        //----------------------- Receive Ports - CDR Ports ------------------------
         .gt2_rxcdrovrden_in               (GT_RXCDROVRDEN_IN),

         // GT reference clock per channel, connect to REF clk - same as for GT Common
         //, only one gt ref clk is needed
         //.gt3_gtrefclk1_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //-------------------------- Channel - DRP Ports  --------------------------
         .gt3_drpaddr                  (gt3_drpaddr),
         .gt3_drp_clk_in               (INIT_CLK),
         .gt3_drpdi                    (gt3_drpdi),
         .gt3_drpdo                    (gt3_drpdo),
         .gt3_drpen                    (gt3_drpen),
         .gt3_drprdy                   (gt3_drprdy),
         .gt3_drpwe                    (gt3_drpwe),
    //----------------------------- Loopback Ports -----------------------------
    //------------------- RX Initialization and Reset Ports --------------------
         .gt3_rxusrclk_out                 (),
         .gt3_rxusrclk2_out                (),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
         .gt3_txusrclk_in                 (TXUSRCLK_IN), 
         .gt3_txusrclk2_in                (TXUSRCLK2_IN),

         //.gt3_rxuserrdy_in                 (rxuserrdy_t),
         .gt3_rxdata_out                   (pre_rxdata_from_gtx_lane3_i),
         //---------------------- Receive Ports - RX AFE Ports ----------------------
         .gt3_gthrxn_in                    (RX1N_IN_LANE3),
         .gt3_gthrxp_in                    (RX1P_IN_LANE3),
         //------------- Receive Ports - RX Fabric Output Control Ports -------------
         .gt3_rxoutclk_out                 (rxrecclk_from_gtx_lane3_i),
         //-------------------- Receive Ports - RX Gearbox Ports --------------------
         .gt3_rxdatavalid_out              (pre_rxdatavalid_lane3_i),
         .gt3_rxheader_out                 (pre_rxheader_from_gtx_lane3_i),
         .gt3_rxheadervalid_out            (pre_rxheadervalid_lane3_i),
         //------------------- Receive Ports - RX Gearbox Ports  --------------------
         .gt3_rxgearboxslip_in             (rxgearboxslip_lane3_i),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------

        //.gt3_txuserrdy_in                 (txuserrdy_t),//
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
         .gt3_txheader_in                  (txheader_lane3_r),
        //---------------- Transmit Ports - TX Data Path interface -----------------
           .gt3_txdata_in                  (scrambled_data_lane3_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
          .gt3_gthtxn_out                  (TX1N_OUT_LANE3),
          .gt3_gthtxp_out                  (TX1P_OUT_LANE3),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
          .gt3_txoutclk_out                (TXOUTCLK1_OUT_LANE3),
          .gt3_txoutclkfabric_out          (),
          .gt3_txoutclkpcs_out             (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
          .gt3_txsequence_in               (txseq_counter_i_lane3),
        //----------------------- Receive Ports - CDR Ports ------------------------
         .gt3_rxcdrovrden_in               (GT_RXCDROVRDEN_IN),

        // transceiver port list is not enabled. below ports are at their default.
         .gt_rxbufstatus                  (int_gt_rxbufstatus),
         .gt_rxpmareset                   (tied_to_ground_vec_i[3:0]),
         .gt_rxrate                       (tied_to_ground_vec_i[11 :0]),
         .gt_txpmareset                   (tied_to_ground_vec_i[3:0]),
         .gt_txpcsreset                   (tied_to_ground_vec_i[3:0]),
         .gt_rxpcsreset                   (tied_to_ground_vec_i[3:0]), //MAS
         .gt_rxbufreset                   (tied_to_ground_vec_i[3:0]),
         .gt_rxpmaresetdone               (),
         .gt_txprbssel                    (tied_to_ground_vec_i[15 :0]),
         .gt_rxprbssel                    (tied_to_ground_vec_i[15 :0]),
         .gt_txprbsforceerr               (tied_to_ground_vec_i[3:0]),
         .gt_rxprbserr                    (),
         .gt_rxprbscntreset               (tied_to_ground_vec_i[3:0]),
         .gt_dmonitorout                  (),
         .gt_txbufstatus                  (int_gt_txbufstatus),
        //------------------------ RX Margin Analysis Ports ------------------------
         .gt_eyescandataerror             (),
         .gt_eyescanreset                 (tied_to_ground_vec_i[3:0]),
         .gt_eyescantrigger               (tied_to_ground_vec_i[3:0]),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
         .gt_rxcdrhold                    (tied_to_ground_vec_i[3:0]),
         .gt_rxdfelpmreset                (tied_to_ground_vec_i[3:0]),
         .gt_rxlpmen                      (tied_to_ground_vec_i[3:0]), 
        //---------------------- TX Configurable Driver Ports ----------------------
         .gt_txpostcursor                 (tied_to_ground_vec_i[19 :0]),
 
         .gt_txdiffctrl                   ({4{5'b01000}}),
         .gt_txprecursor                  (tied_to_ground_vec_i[19 :0]),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
         .gt_txpolarity                   (tied_to_ground_vec_i[3:0]),
         .gt_txinhibit                    (tied_to_ground_vec_i[3:0]),
         .gt_pcsrsvdin                    (tied_to_ground_vec_i[63:0]),
    //----------- GT POWERGOOD STATUS Port -----------
          .gt_powergood                   (gt_powergood),

        //----------- Transmit Ports - TX Initialization and Reset Ports -----------
          .gt_txresetdone             (tx_resetdone_j)

 );




    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        pre_r1_rxdata_from_gtx_i    <= `DLY  pre_rxdata_from_gtx_i    ;
        pre_r1_rxdatavalid_i        <= `DLY  pre_rxdatavalid_i        ;
        pre_r1_rxdata_from_gtx_lane1_i    <= `DLY  pre_rxdata_from_gtx_lane1_i    ;
        pre_r1_rxdatavalid_lane1_i        <= `DLY  pre_rxdatavalid_lane1_i        ;
        pre_r1_rxdata_from_gtx_lane2_i    <= `DLY  pre_rxdata_from_gtx_lane2_i    ;
        pre_r1_rxdatavalid_lane2_i        <= `DLY  pre_rxdatavalid_lane2_i        ;
        pre_r1_rxdata_from_gtx_lane3_i    <= `DLY  pre_rxdata_from_gtx_lane3_i    ;
        pre_r1_rxdatavalid_lane3_i        <= `DLY  pre_rxdatavalid_lane3_i        ;
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxdatavalid_i)
        begin
            pos_rxdata_from_gtx_i <= `DLY pre_r1_rxdata_from_gtx_i;
            pos_rxdatavalid_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxdatavalid_i     <= `DLY 1'b0;
        end
    end
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxdatavalid_lane1_i)
        begin
            pos_rxdata_from_gtx_lane1_i <= `DLY pre_r1_rxdata_from_gtx_lane1_i;
            pos_rxdatavalid_lane1_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxdatavalid_lane1_i     <= `DLY 1'b0;
        end
    end
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxdatavalid_lane2_i)
        begin
            pos_rxdata_from_gtx_lane2_i <= `DLY pre_r1_rxdata_from_gtx_lane2_i;
            pos_rxdatavalid_lane2_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxdatavalid_lane2_i     <= `DLY 1'b0;
        end
    end
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxdatavalid_lane3_i)
        begin
            pos_rxdata_from_gtx_lane3_i <= `DLY pre_r1_rxdata_from_gtx_lane3_i;
            pos_rxdatavalid_lane3_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxdatavalid_lane3_i     <= `DLY 1'b0;
        end
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        pre_r1_rxheader_from_gtx_i    <= `DLY  pre_rxheader_from_gtx_i    ;
        pre_r1_rxheadervalid_i        <= `DLY  pre_rxheadervalid_i        ;
        pre_r1_rxheader_from_gtx_lane1_i    <= `DLY  pre_rxheader_from_gtx_lane1_i    ;
        pre_r1_rxheadervalid_lane1_i        <= `DLY  pre_rxheadervalid_lane1_i        ;
        pre_r1_rxheader_from_gtx_lane2_i    <= `DLY  pre_rxheader_from_gtx_lane2_i    ;
        pre_r1_rxheadervalid_lane2_i        <= `DLY  pre_rxheadervalid_lane2_i        ;
        pre_r1_rxheader_from_gtx_lane3_i    <= `DLY  pre_rxheader_from_gtx_lane3_i    ;
        pre_r1_rxheadervalid_lane3_i        <= `DLY  pre_rxheadervalid_lane3_i        ;
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxheadervalid_i)
        begin
            pos_rxheader_from_gtx_i <= `DLY pre_r1_rxheader_from_gtx_i;
            pos_rxheadervalid_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxheadervalid_i     <= `DLY 1'b0;
        end
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxheadervalid_lane1_i)
        begin
            pos_rxheader_from_gtx_lane1_i <= `DLY pre_r1_rxheader_from_gtx_lane1_i;
            pos_rxheadervalid_lane1_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxheadervalid_lane1_i     <= `DLY 1'b0;
        end
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxheadervalid_lane2_i)
        begin
            pos_rxheader_from_gtx_lane2_i <= `DLY pre_r1_rxheader_from_gtx_lane2_i;
            pos_rxheadervalid_lane2_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxheadervalid_lane2_i     <= `DLY 1'b0;
        end
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxheadervalid_lane3_i)
        begin
            pos_rxheader_from_gtx_lane3_i <= `DLY pre_r1_rxheader_from_gtx_lane3_i;
            pos_rxheadervalid_lane3_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxheadervalid_lane3_i     <= `DLY 1'b0;
        end
    end


    //---- Final stage of posedge flop -----
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        rxdata_from_gtx_i            <= `DLY  pos_rxdata_from_gtx_i;
        rxdatavalid_i                <= `DLY  pos_rxdatavalid_i;
        rxheader_from_gtx_i          <= `DLY  pos_rxheader_from_gtx_i;
        rxheadervalid_i              <= `DLY  pos_rxheadervalid_i;
        rxdata_from_gtx_lane1_i            <= `DLY  pos_rxdata_from_gtx_lane1_i;
        rxdatavalid_lane1_i                <= `DLY  pos_rxdatavalid_lane1_i;
        rxheader_from_gtx_lane1_i          <= `DLY  pos_rxheader_from_gtx_lane1_i;
        rxheadervalid_lane1_i              <= `DLY  pos_rxheadervalid_lane1_i;
        rxdata_from_gtx_lane2_i            <= `DLY  pos_rxdata_from_gtx_lane2_i;
        rxdatavalid_lane2_i                <= `DLY  pos_rxdatavalid_lane2_i;
        rxheader_from_gtx_lane2_i          <= `DLY  pos_rxheader_from_gtx_lane2_i;
        rxheadervalid_lane2_i              <= `DLY  pos_rxheadervalid_lane2_i;
        rxdata_from_gtx_lane3_i            <= `DLY  pos_rxdata_from_gtx_lane3_i;
        rxdatavalid_lane3_i                <= `DLY  pos_rxdatavalid_lane3_i;
        rxheader_from_gtx_lane3_i          <= `DLY  pos_rxheader_from_gtx_lane3_i;
        rxheadervalid_lane3_i              <= `DLY  pos_rxheadervalid_lane3_i;
    end

 // Common_reset_cbcc module to generate & control reset for CBCC module
 // This will drive reset to all CBCC instances used in the core

   assign  enchansync_all_i =  ENCHANSYNC_IN &
 ENCHANSYNC_IN_LANE1 &
 ENCHANSYNC_IN_LANE2 &
 ENCHANSYNC_IN_LANE3;

     aurora_64b66b_w256_1375Gbps_common_reset_cbcc  common_reset_cbcc_i
     (
        .enchansync                     ( enchansync_all_i            ),
        .chan_bond_reset                ( CHAN_BOND_RESET             ),
        .cb_bit_err                     ( cb_bit_err_i                ),
        .reset                          ( new_gtx_rx_pcsreset_comb    ),
        .rd_clk                         ( RXUSRCLK2_IN                ),
        .init_clk                       ( INIT_CLK                    ),
        .user_clk                       ( rxusrclk_out                ),//( rxrecclk_to_fabric_i        ),
        .cbcc_fifo_reset_wr_clk         ( cbcc_fifo_reset_wr_clk      ),
        .cbcc_fifo_reset_to_fifo_wr_clk ( cbcc_fifo_reset_to_fifo_wr_clk ),
        .cbcc_data_srst                 ( cbcc_data_srst              ),
        .cbcc_fifo_reset_rd_clk         ( cbcc_fifo_reset_rd_clk      ),
        .cbcc_fifo_reset_to_fifo_rd_clk ( cbcc_fifo_reset_to_fifo_rd_clk ),
        .cbcc_only_reset_rd_clk         ( cbcc_only_reset_rd_clk      ),
        .cbcc_reset_cbstg2_rd_clk       ( cbcc_reset_cbstg2_rd_clk    )
     );



     aurora_64b66b_w256_1375Gbps_common_logic_cbcc #
     (
         .BACKWARD_COMP_MODE1(BACKWARD_COMP_MODE1)
     )common_logic_cbcc_i
     (
        .start_cb_writes_in   ( start_cb_writes_i ),
        .do_rd_en_in          ( do_rd_en_i ),
        .bit_err_chan_bond_in ( bit_err_chan_bond_i ),
        .final_gater_for_fifo_din_in ( final_gater_for_fifo_din_i ),
        .any_vld_btf_in       ( any_vld_btf_i ),
        .start_cb_writes_lane1_in   ( start_cb_writes_lane1_i ),
        .do_rd_en_lane1_in          ( do_rd_en_lane1_i ),
        .bit_err_chan_bond_lane1_in ( bit_err_chan_bond_lane1_i ),
        .final_gater_for_fifo_din_lane1_in ( final_gater_for_fifo_din_lane1_i ),
        .any_vld_btf_lane1_in       ( any_vld_btf_lane1_i ),
        .start_cb_writes_lane2_in   ( start_cb_writes_lane2_i ),
        .do_rd_en_lane2_in          ( do_rd_en_lane2_i ),
        .bit_err_chan_bond_lane2_in ( bit_err_chan_bond_lane2_i ),
        .final_gater_for_fifo_din_lane2_in ( final_gater_for_fifo_din_lane2_i ),
        .any_vld_btf_lane2_in       ( any_vld_btf_lane2_i ),
        .start_cb_writes_lane3_in   ( start_cb_writes_lane3_i ),
        .do_rd_en_lane3_in          ( do_rd_en_lane3_i ),
        .bit_err_chan_bond_lane3_in ( bit_err_chan_bond_lane3_i ),
        .final_gater_for_fifo_din_lane3_in ( final_gater_for_fifo_din_lane3_i ),
        .any_vld_btf_lane3_in       ( any_vld_btf_lane3_i ),
        .all_start_cb_writes_out                ( all_start_cb_writes_i       ),
        .cbcc_fifo_reset_wr_clk                 ( cbcc_fifo_reset_wr_clk      ),
        .cbcc_fifo_reset_rd_clk                 ( cbcc_fifo_reset_rd_clk      ),
        .master_do_rd_en_out                    ( master_do_rd_en_i           ),
        .cb_bit_err_out                         ( cb_bit_err_i                ),
        .all_vld_btf_out                        ( all_vld_btf_flag_i          ),
        .rxusrclk2_in                           ( RXUSRCLK2_IN                ),
        .rxrecclk_to_fabric                     ( rxusrclk_out                )////( rxrecclk_to_fabric_i )
     );


    //#########################scrambler instantiation########################
       reg    [63:0]   TXDATA_IN_REG;

       always @ (posedge TXUSRCLK2_IN) 
       begin
         TXDATA_IN_REG <= `DLY TXDATA_IN;
         txheader_r    <= `DLY tx_hdr_r;
       end
aurora_64b66b_w256_1375Gbps_SCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .TX_DATA_WIDTH(64)
     )
       scrambler_64b66b_gtx0_i
     (
       // User Interface
        .UNSCRAMBLED_DATA_IN    (TXDATA_IN_REG),
        .SCRAMBLED_DATA_OUT     (scrambled_data_i),
        .DATA_VALID_IN          (data_valid_i),
        // System Interface
        .USER_CLK               (TXUSRCLK2_IN), // (TXUSRCLK2_IN),
        .SYSTEM_RESET           (gtx_reset_comb)
     );


     //---------------------------Polarity Control Logic---------------------
     //Double synchronize CHECK_POLARITY_IN signal to account for domain crossing

aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (2)   // Number of sync stages needed
     )   u_cdc__check_polarity
     (
       .prmry_aclk      (1'b0                               ),
       .prmry_rst_n     (1'b1                               ),
       .prmry_in        (CHECK_POLARITY_IN),
       .prmry_vect_in   (32'd0                                ),
       .scndry_aclk     (rxusrclk_out                       ),//(rxrecclk_to_fabric_i ),
       .scndry_rst_n    (1'b1                               ),
       .prmry_ack       (),
       .scndry_out      (check_polarity_r2),
       .scndry_vect_out ()
      );

     //Logic to account for polarity reversal
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
       if(check_polarity_r2 && (rxheader_from_gtx_i == 2'b01) && rxheadervalid_i)
             RX_NEG_OUT     <= `DLY   1'b1;
       else if(check_polarity_r2 && RX_NEG_OUT )
             RX_NEG_OUT     <= `DLY   1'b1;
       else
             RX_NEG_OUT     <= `DLY   1'b0;
     end

     //Finally double synchronize RX_POLARITY_IN signal and port map to RXPOLARITY0/1
   aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (3)   // Number of sync stages needed
     )   u_cdc_rxpolarity_
     (
       .prmry_aclk      (RXUSRCLK2_IN                   ),//?? what about this clock and logic for cdc_sync
       .prmry_rst_n     (1'b1                           ),
       .prmry_in        (RXPOLARITY_IN),
       .prmry_vect_in   (32'd0                            ),
       .scndry_aclk     (rxusrclk_out                   ),//(rxrecclk_to_fabric_i ),//
       .scndry_rst_n    (1'b1                           ),
       .prmry_ack       (),
       .scndry_out      (sync_rx_polarity_r ),
       .scndry_vect_out ()
      );



     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
             rxdatavalid_to_fifo_i  <= `DLY rxdatavalid_i;
             rxheader_to_fifo_i     <= `DLY rxheader_from_gtx_i;
     end

     //##########################descrambler instantiation########################
     aurora_64b66b_w256_1375Gbps_DESCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .RX_DATA_WIDTH(64)
     )
       descrambler_64b66b_gtx0_i
     (
        // User Interface
        .SCRAMBLED_DATA_IN      (rxdata_from_gtx_i    ),
        .UNSCRAMBLED_DATA_OUT   (rxdata_to_fifo_i     ),
        .DATA_VALID_IN          (rxdatavalid_i        ),

        // System Interface
        .USER_CLK               (rxusrclk_out                           ),//(rxrecclk_to_fabric_i),//
        //.ENABLE                 (enable_32_i                            ),
        .SYSTEM_RESET           (!rxlossofsync_out_q  )
     );

     //#########################block sync instantiation##############################
     aurora_64b66b_w256_1375Gbps_BLOCK_SYNC_SM #
     (
       .SH_CNT_MAX              (SH_CNT_MAX             ),
       .SH_INVALID_CNT_MAX      (SH_INVALID_CNT_MAX     )
     )
       block_sync_sm_gtx0_i
     (
       // User Interface
       .BLOCKSYNC_OUT           (blocksync_out_i    ),
       .RXGEARBOXSLIP_OUT       (rxgearboxslip_i    ),
       .RXHEADER_IN             (rxheader_from_gtx_i),
       .RXHEADERVALID_IN        (rxheadervalid_i    ),

       // System Interface
       .USER_CLK                (rxusrclk_out                         ),//(rxrecclk_to_fabric_i),//
       .SYSTEM_RESET            (new_gtx_rx_pcsreset_comb             )
     );


     //#########################CBCC module instantiation########################
     aurora_64b66b_w256_1375Gbps_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_SLAVE           ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_SLAVE          ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0     )

     )
       cbcc_gtx0_i
     (

       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),

       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT         ),
         .CC_RX_HEADER_OUT_ERR          (RXHEADER_OUT_ERR     ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT     ),

         .CHBONDI (chbondi),
         .CHBONDO (),
         .RXCHANISALIGNED               (CHBONDDONE_OUT       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (HPCNT_RESET_IN),//stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_0_c               )
     );
    //#########################scrambler instantiation########################
       reg    [63:0]   TXDATA_IN_REG_LANE1;

       always @ (posedge TXUSRCLK2_IN) 
       begin
         TXDATA_IN_REG_LANE1 <= `DLY TXDATA_IN_LANE1;
         txheader_lane1_r    <= `DLY tx_hdr_lane1_r;
       end
aurora_64b66b_w256_1375Gbps_SCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .TX_DATA_WIDTH(64)
     )
       scrambler_64b66b_gtx0_lane1_i
     (
       // User Interface
        .UNSCRAMBLED_DATA_IN    (TXDATA_IN_REG_LANE1),
        .SCRAMBLED_DATA_OUT     (scrambled_data_lane1_i),
        .DATA_VALID_IN          (data_valid_i_lane1),
        // System Interface
        .USER_CLK               (TXUSRCLK2_IN), // (TXUSRCLK2_IN),
        .SYSTEM_RESET           (gtx_reset_comb)
     );


     //---------------------------Polarity Control Logic---------------------
     //Double synchronize CHECK_POLARITY_IN signal to account for domain crossing

aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (2)   // Number of sync stages needed
     )   u_cdc__lane1_check_polarity
     (
       .prmry_aclk      (1'b0                               ),
       .prmry_rst_n     (1'b1                               ),
       .prmry_in        (CHECK_POLARITY_IN_LANE1),
       .prmry_vect_in   (32'd0                                ),
       .scndry_aclk     (rxusrclk_out                       ),//(rxrecclk_to_fabric_i ),
       .scndry_rst_n    (1'b1                               ),
       .prmry_ack       (),
       .scndry_out      (check_polarity_lane1_r2),
       .scndry_vect_out ()
      );

     //Logic to account for polarity reversal
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
       if(check_polarity_lane1_r2 && (rxheader_from_gtx_lane1_i == 2'b01) && rxheadervalid_lane1_i)
             RX_NEG_OUT_LANE1     <= `DLY   1'b1;
       else if(check_polarity_lane1_r2 && RX_NEG_OUT_LANE1 )
             RX_NEG_OUT_LANE1     <= `DLY   1'b1;
       else
             RX_NEG_OUT_LANE1     <= `DLY   1'b0;
     end

     //Finally double synchronize RX_POLARITY_IN signal and port map to RXPOLARITY0/1
   aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (3)   // Number of sync stages needed
     )   u_cdc_rxpolarity__LANE1
     (
       .prmry_aclk      (RXUSRCLK2_IN                   ),//?? what about this clock and logic for cdc_sync
       .prmry_rst_n     (1'b1                           ),
       .prmry_in        (RXPOLARITY_IN_LANE1),
       .prmry_vect_in   (32'd0                            ),
       .scndry_aclk     (rxusrclk_out                   ),//(rxrecclk_to_fabric_i ),//
       .scndry_rst_n    (1'b1                           ),
       .prmry_ack       (),
       .scndry_out      (sync_rx_polarity_lane1_r ),
       .scndry_vect_out ()
      );



     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
             rxdatavalid_to_fifo_lane1_i  <= `DLY rxdatavalid_lane1_i;
             rxheader_to_fifo_lane1_i     <= `DLY rxheader_from_gtx_lane1_i;
     end

     //##########################descrambler instantiation########################
     aurora_64b66b_w256_1375Gbps_DESCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .RX_DATA_WIDTH(64)
     )
       descrambler_64b66b_gtx0_lane1_i
     (
        // User Interface
        .SCRAMBLED_DATA_IN      (rxdata_from_gtx_lane1_i    ),
        .UNSCRAMBLED_DATA_OUT   (rxdata_to_fifo_lane1_i     ),
        .DATA_VALID_IN          (rxdatavalid_lane1_i        ),

        // System Interface
        .USER_CLK               (rxusrclk_out                           ),//(rxrecclk_to_fabric_i),//
        //.ENABLE                 (enable_32_i                            ),
        .SYSTEM_RESET           (!rxlossofsync_out_lane1_q  )
     );

     //#########################block sync instantiation##############################
     aurora_64b66b_w256_1375Gbps_BLOCK_SYNC_SM #
     (
       .SH_CNT_MAX              (SH_CNT_MAX             ),
       .SH_INVALID_CNT_MAX      (SH_INVALID_CNT_MAX     )
     )
       block_sync_sm_gtx0_lane1_i
     (
       // User Interface
       .BLOCKSYNC_OUT           (blocksync_out_lane1_i    ),
       .RXGEARBOXSLIP_OUT       (rxgearboxslip_lane1_i    ),
       .RXHEADER_IN             (rxheader_from_gtx_lane1_i),
       .RXHEADERVALID_IN        (rxheadervalid_lane1_i    ),

       // System Interface
       .USER_CLK                (rxusrclk_out                         ),//(rxrecclk_to_fabric_i),//
       .SYSTEM_RESET            (new_gtx_rx_pcsreset_comb             )
     );


     //#########################CBCC module instantiation########################
     aurora_64b66b_w256_1375Gbps_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_SLAVE           ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_SLAVE          ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0_LANE1     )

     )
       cbcc_gtx0_lane1_i
     (

       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_lane1_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_lane1_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_lane1_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_lane1_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN_LANE1        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),

       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT_LANE1),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_lane1_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT_LANE1      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT_LANE1         ),
         .CC_RX_HEADER_OUT_ERR          (RXHEADER_OUT_ERR_LANE1     ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT_LANE1     ),

         .CHBONDI (chbondi_lane1),
         .CHBONDO (),
         .RXCHANISALIGNED               (CHBONDDONE_OUT_LANE1       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_lane1_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_lane1_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_lane1_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_lane1_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_lane1_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (HPCNT_RESET_IN),//stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_1_c               )
     );
    //#########################scrambler instantiation########################
       reg    [63:0]   TXDATA_IN_REG_LANE2;

       always @ (posedge TXUSRCLK2_IN) 
       begin
         TXDATA_IN_REG_LANE2 <= `DLY TXDATA_IN_LANE2;
         txheader_lane2_r    <= `DLY tx_hdr_lane2_r;
       end
aurora_64b66b_w256_1375Gbps_SCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .TX_DATA_WIDTH(64)
     )
       scrambler_64b66b_gtx0_lane2_i
     (
       // User Interface
        .UNSCRAMBLED_DATA_IN    (TXDATA_IN_REG_LANE2),
        .SCRAMBLED_DATA_OUT     (scrambled_data_lane2_i),
        .DATA_VALID_IN          (data_valid_i_lane2),
        // System Interface
        .USER_CLK               (TXUSRCLK2_IN), // (TXUSRCLK2_IN),
        .SYSTEM_RESET           (gtx_reset_comb)
     );


     //---------------------------Polarity Control Logic---------------------
     //Double synchronize CHECK_POLARITY_IN signal to account for domain crossing

aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (2)   // Number of sync stages needed
     )   u_cdc__lane2_check_polarity
     (
       .prmry_aclk      (1'b0                               ),
       .prmry_rst_n     (1'b1                               ),
       .prmry_in        (CHECK_POLARITY_IN_LANE2),
       .prmry_vect_in   (32'd0                                ),
       .scndry_aclk     (rxusrclk_out                       ),//(rxrecclk_to_fabric_i ),
       .scndry_rst_n    (1'b1                               ),
       .prmry_ack       (),
       .scndry_out      (check_polarity_lane2_r2),
       .scndry_vect_out ()
      );

     //Logic to account for polarity reversal
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
       if(check_polarity_lane2_r2 && (rxheader_from_gtx_lane2_i == 2'b01) && rxheadervalid_lane2_i)
             RX_NEG_OUT_LANE2     <= `DLY   1'b1;
       else if(check_polarity_lane2_r2 && RX_NEG_OUT_LANE2 )
             RX_NEG_OUT_LANE2     <= `DLY   1'b1;
       else
             RX_NEG_OUT_LANE2     <= `DLY   1'b0;
     end

     //Finally double synchronize RX_POLARITY_IN signal and port map to RXPOLARITY0/1
   aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (3)   // Number of sync stages needed
     )   u_cdc_rxpolarity__LANE2
     (
       .prmry_aclk      (RXUSRCLK2_IN                   ),//?? what about this clock and logic for cdc_sync
       .prmry_rst_n     (1'b1                           ),
       .prmry_in        (RXPOLARITY_IN_LANE2),
       .prmry_vect_in   (32'd0                            ),
       .scndry_aclk     (rxusrclk_out                   ),//(rxrecclk_to_fabric_i ),//
       .scndry_rst_n    (1'b1                           ),
       .prmry_ack       (),
       .scndry_out      (sync_rx_polarity_lane2_r ),
       .scndry_vect_out ()
      );



     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
             rxdatavalid_to_fifo_lane2_i  <= `DLY rxdatavalid_lane2_i;
             rxheader_to_fifo_lane2_i     <= `DLY rxheader_from_gtx_lane2_i;
     end

     //##########################descrambler instantiation########################
     aurora_64b66b_w256_1375Gbps_DESCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .RX_DATA_WIDTH(64)
     )
       descrambler_64b66b_gtx0_lane2_i
     (
        // User Interface
        .SCRAMBLED_DATA_IN      (rxdata_from_gtx_lane2_i    ),
        .UNSCRAMBLED_DATA_OUT   (rxdata_to_fifo_lane2_i     ),
        .DATA_VALID_IN          (rxdatavalid_lane2_i        ),

        // System Interface
        .USER_CLK               (rxusrclk_out                           ),//(rxrecclk_to_fabric_i),//
        //.ENABLE                 (enable_32_i                            ),
        .SYSTEM_RESET           (!rxlossofsync_out_lane2_q  )
     );

     //#########################block sync instantiation##############################
     aurora_64b66b_w256_1375Gbps_BLOCK_SYNC_SM #
     (
       .SH_CNT_MAX              (SH_CNT_MAX             ),
       .SH_INVALID_CNT_MAX      (SH_INVALID_CNT_MAX     )
     )
       block_sync_sm_gtx0_lane2_i
     (
       // User Interface
       .BLOCKSYNC_OUT           (blocksync_out_lane2_i    ),
       .RXGEARBOXSLIP_OUT       (rxgearboxslip_lane2_i    ),
       .RXHEADER_IN             (rxheader_from_gtx_lane2_i),
       .RXHEADERVALID_IN        (rxheadervalid_lane2_i    ),

       // System Interface
       .USER_CLK                (rxusrclk_out                         ),//(rxrecclk_to_fabric_i),//
       .SYSTEM_RESET            (new_gtx_rx_pcsreset_comb             )
     );


     //#########################CBCC module instantiation########################
     aurora_64b66b_w256_1375Gbps_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_MASTER          ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_MASTER         ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0_LANE2     )

     )
       cbcc_gtx0_lane2_i
     (

       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_lane2_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_lane2_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_lane2_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_lane2_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN_LANE2        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),

       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT_LANE2),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_lane2_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT_LANE2      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT_LANE2         ),
         .CC_RX_HEADER_OUT_ERR          (RXHEADER_OUT_ERR_LANE2     ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT_LANE2     ),

         .CHBONDI (chbondi_lane2),
         .CHBONDO                       (chbondo_to_slaves_i),
         .RXCHANISALIGNED               (CHBONDDONE_OUT_LANE2       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_lane2_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_lane2_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_lane2_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_lane2_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_lane2_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (HPCNT_RESET_IN),//stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_2_c               )
     );
    //#########################scrambler instantiation########################
       reg    [63:0]   TXDATA_IN_REG_LANE3;

       always @ (posedge TXUSRCLK2_IN) 
       begin
         TXDATA_IN_REG_LANE3 <= `DLY TXDATA_IN_LANE3;
         txheader_lane3_r    <= `DLY tx_hdr_lane3_r;
       end
aurora_64b66b_w256_1375Gbps_SCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .TX_DATA_WIDTH(64)
     )
       scrambler_64b66b_gtx0_lane3_i
     (
       // User Interface
        .UNSCRAMBLED_DATA_IN    (TXDATA_IN_REG_LANE3),
        .SCRAMBLED_DATA_OUT     (scrambled_data_lane3_i),
        .DATA_VALID_IN          (data_valid_i_lane3),
        // System Interface
        .USER_CLK               (TXUSRCLK2_IN), // (TXUSRCLK2_IN),
        .SYSTEM_RESET           (gtx_reset_comb)
     );


     //---------------------------Polarity Control Logic---------------------
     //Double synchronize CHECK_POLARITY_IN signal to account for domain crossing

aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (2)   // Number of sync stages needed
     )   u_cdc__lane3_check_polarity
     (
       .prmry_aclk      (1'b0                               ),
       .prmry_rst_n     (1'b1                               ),
       .prmry_in        (CHECK_POLARITY_IN_LANE3),
       .prmry_vect_in   (32'd0                                ),
       .scndry_aclk     (rxusrclk_out                       ),//(rxrecclk_to_fabric_i ),
       .scndry_rst_n    (1'b1                               ),
       .prmry_ack       (),
       .scndry_out      (check_polarity_lane3_r2),
       .scndry_vect_out ()
      );

     //Logic to account for polarity reversal
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
       if(check_polarity_lane3_r2 && (rxheader_from_gtx_lane3_i == 2'b01) && rxheadervalid_lane3_i)
             RX_NEG_OUT_LANE3     <= `DLY   1'b1;
       else if(check_polarity_lane3_r2 && RX_NEG_OUT_LANE3 )
             RX_NEG_OUT_LANE3     <= `DLY   1'b1;
       else
             RX_NEG_OUT_LANE3     <= `DLY   1'b0;
     end

     //Finally double synchronize RX_POLARITY_IN signal and port map to RXPOLARITY0/1
   aurora_64b66b_w256_1375Gbps_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (3)   // Number of sync stages needed
     )   u_cdc_rxpolarity__LANE3
     (
       .prmry_aclk      (RXUSRCLK2_IN                   ),//?? what about this clock and logic for cdc_sync
       .prmry_rst_n     (1'b1                           ),
       .prmry_in        (RXPOLARITY_IN_LANE3),
       .prmry_vect_in   (32'd0                            ),
       .scndry_aclk     (rxusrclk_out                   ),//(rxrecclk_to_fabric_i ),//
       .scndry_rst_n    (1'b1                           ),
       .prmry_ack       (),
       .scndry_out      (sync_rx_polarity_lane3_r ),
       .scndry_vect_out ()
      );



     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
             rxdatavalid_to_fifo_lane3_i  <= `DLY rxdatavalid_lane3_i;
             rxheader_to_fifo_lane3_i     <= `DLY rxheader_from_gtx_lane3_i;
     end

     //##########################descrambler instantiation########################
     aurora_64b66b_w256_1375Gbps_DESCRAMBLER_64B66B #
     (
        .SCRAMBLER_SEED(SCRAMBLER_SEED),
        .RX_DATA_WIDTH(64)
     )
       descrambler_64b66b_gtx0_lane3_i
     (
        // User Interface
        .SCRAMBLED_DATA_IN      (rxdata_from_gtx_lane3_i    ),
        .UNSCRAMBLED_DATA_OUT   (rxdata_to_fifo_lane3_i     ),
        .DATA_VALID_IN          (rxdatavalid_lane3_i        ),

        // System Interface
        .USER_CLK               (rxusrclk_out                           ),//(rxrecclk_to_fabric_i),//
        //.ENABLE                 (enable_32_i                            ),
        .SYSTEM_RESET           (!rxlossofsync_out_lane3_q  )
     );

     //#########################block sync instantiation##############################
     aurora_64b66b_w256_1375Gbps_BLOCK_SYNC_SM #
     (
       .SH_CNT_MAX              (SH_CNT_MAX             ),
       .SH_INVALID_CNT_MAX      (SH_INVALID_CNT_MAX     )
     )
       block_sync_sm_gtx0_lane3_i
     (
       // User Interface
       .BLOCKSYNC_OUT           (blocksync_out_lane3_i    ),
       .RXGEARBOXSLIP_OUT       (rxgearboxslip_lane3_i    ),
       .RXHEADER_IN             (rxheader_from_gtx_lane3_i),
       .RXHEADERVALID_IN        (rxheadervalid_lane3_i    ),

       // System Interface
       .USER_CLK                (rxusrclk_out                         ),//(rxrecclk_to_fabric_i),//
       .SYSTEM_RESET            (new_gtx_rx_pcsreset_comb             )
     );


     //#########################CBCC module instantiation########################
     aurora_64b66b_w256_1375Gbps_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_SLAVE           ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_SLAVE          ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0_LANE3     )

     )
       cbcc_gtx0_lane3_i
     (

       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_lane3_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_lane3_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_lane3_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_lane3_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN_LANE3        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),

       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT_LANE3),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_lane3_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT_LANE3      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT_LANE3         ),
         .CC_RX_HEADER_OUT_ERR          (RXHEADER_OUT_ERR_LANE3     ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT_LANE3     ),

         .CHBONDI (chbondi_lane3),
         .CHBONDO (),
         .RXCHANISALIGNED               (CHBONDDONE_OUT_LANE3       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_lane3_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_lane3_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_lane3_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_lane3_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_lane3_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (HPCNT_RESET_IN),//stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_3_c               )
     );


    wire reset_initclk;
    wire fsm_resetdone_initclk;

    aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_reset_initclk
      (
      .prmry_in (RESET),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (reset_initclk)
      );

    aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_fsm_resetdone_initclk
      (
      .prmry_in (FSM_RESETDONE_j),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (fsm_resetdone_initclk)
      );

         assign  rxfsm_reset_i                = hpreset_or_pma_init_in | cdr_reset_fsm_lnkreset;
         assign sys_and_fsm_reset_for_hpcnt  = rxfsm_reset_i ? 1'b0 : (reset_initclk | ~fsm_resetdone_initclk);
         assign  hp_reset_i                   = hpreset_in | cdr_reset_fsm_lnkreset;
         assign  HPCNT_RESET_IN = GTXRESET_IN | sys_and_fsm_reset_for_hpcnt | cdr_reset_fsm_lnkreset ;
         assign  blocksync_all_lanes_inrxclk  = blocksync_out_i  &
blocksync_out_lane1_i  &
blocksync_out_lane2_i  &
blocksync_out_lane3_i ;
         assign rxlossofsync_out_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_i : 1'b0;

     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_q <= `DLY rxlossofsync_out_i;
     end


         assign rxlossofsync_out_lane1_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_lane1_i : 1'b0;

     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_lane1_q <= `DLY rxlossofsync_out_lane1_i;
     end


         assign rxlossofsync_out_lane2_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_lane2_i : 1'b0;

     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_lane2_q <= `DLY rxlossofsync_out_lane2_i;
     end


         assign rxlossofsync_out_lane3_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_lane3_i : 1'b0;

     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_lane3_q <= `DLY rxlossofsync_out_lane3_i;
     end



    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        blocksync_all_lanes_inrxclk_q <= `DLY blocksync_all_lanes_inrxclk;
    end


    aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_blocksyncall_initclk_sync
      (
          .prmry_in             (blocksync_all_lanes_inrxclk_q),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (blocksync_all_lanes_instableclk)
      );

    aurora_64b66b_w256_1375Gbps_rst_sync u_rst_sync_blocksyncprop_inrxclk_sync
      (
          .prmry_in             (allow_block_sync_propagation),
          .scndry_aclk          (rxusrclk_out),//(rxrecclk_to_fabric_i),//
          .scndry_out           (allow_block_sync_propagation_inrxclk)
      );

      always @(posedge INIT_CLK)  begin
         if(hpreset_or_pma_init_in | BACKWARD_COMP_MODE2) begin
             cdr_reset_fsm_r <= IDLE;
             cdr_reset_fsm_cntr_r <= 8'h0;
             cdr_reset_fsm_lnkreset <= 1'b0;
             allow_block_sync_propagation <= BACKWARD_COMP_MODE2;
         end else begin
             case(cdr_reset_fsm_r)
             IDLE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 if(blocksync_all_lanes_instableclk) begin
                     cdr_reset_fsm_r <= ASSERT_RXRESET;
                 end
             end
             ASSERT_RXRESET: begin
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b1;
                 if(cdr_reset_fsm_cntr_r == 8'hFF) begin
                     cdr_reset_fsm_r <= DONE;
                 end else begin
                     cdr_reset_fsm_cntr_r <= cdr_reset_fsm_cntr_r +  8'h1;
                 end
             end
             DONE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 cdr_reset_fsm_r      <= DONE;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 allow_block_sync_propagation <= 1'b1;
             end
             endcase
         end
      end

 
 
 endmodule
