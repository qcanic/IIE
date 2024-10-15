 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B 
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2009 Xilinx, Inc. All rights reserved.
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
 ///////////////////////////////////////////////////////////////////////////////
 //  FRAME GEN
 //
 //
 //  Description: This module is a pattern generator to test the Aurora
 //               designs in hardware. It generates data and passes it 
 //               through the Aurora channel. 
 ///////////////////////////////////////////////////////////////////////////////
 
 `timescale 1 ns / 10 ps

(* DowngradeIPIdentifiedWarnings="yes" *)
 module aurora_64b66b_w256_1375Gbps_FRAME_GEN #
 (
     parameter            DATA_WIDTH         = 16, // DATA bus width
     parameter            STRB_WIDTH         = 2 // STROBE bus width
 )
 (
     // User Interface
    output                         AXI4_S_OP_TVALID,
    output [0:(DATA_WIDTH-1)]      AXI4_S_OP_TDATA,
    input                          AXI4_S_IP_TREADY,
 
 
     // System Interface
//    input                          CHANNEL_UP,
    input                          USER_CLK,       
//    input                          RESET,

    input                          INIT_RST,
    output                         FIFO_FULL,
    input                          WR_CLK,
    input                          WR_EN,
    input [DATA_WIDTH-1:0]         WR_DIN,
    output                         wr_rst_busy
 ); 
wire                  rd_clk;
wire                  rd_en;
wire[DATA_WIDTH-1:0]  dout;
wire                  empty;
wire                  valid;
wire                  rd_rst_busy;

assign                rd_clk = USER_CLK;

assign  rd_en = (!empty) && AXI4_S_IP_TREADY && (!rd_rst_busy);
assign  AXI4_S_OP_TDATA      = dout;
assign  AXI4_S_OP_TVALID     = valid;


FIFO_Builtin_ASYN_W256D512_F500E0_R215W200 tx_fifo (
  .srst       ( INIT_RST   ),          
  .wr_clk     ( WR_CLK     ),          
  .rd_clk     ( rd_clk     ),          
  .din        ( WR_DIN     ),             
  .wr_en      ( WR_EN      ),            
  .rd_en      ( rd_en      ),            
  .dout       ( dout       ),
  .full       ( full       ),                   
  .prog_full  ( FIFO_FULL  ),    
  .empty      ( empty      ),            
  .valid      ( valid      ),      
  .wr_rst_busy( wr_rst_busy),
  .rd_rst_busy( rd_rst_busy)
);


 
endmodule 
