`timescale 1ns / 1ps
`include "cb_fpga.vh"

module cb_fpga(
    input  wire                         sysclk1_clk_n,
    input  wire                         sysclk1_clk_p,
   
    input  wire                         ch0_reference_clk_p,
    input  wire                         ch0_reference_clk_n,
    input  wire[0:`AURORA_LANE_NUM-1]   ch0_rxp,  
    input  wire[0:`AURORA_LANE_NUM-1]   ch0_rxn,  
    output wire[0:`AURORA_LANE_NUM-1]   ch0_txp,  
    output wire[0:`AURORA_LANE_NUM-1]   ch0_txn,

    input  wire                         ch1_reference_clk_p,
    input  wire                         ch1_reference_clk_n,
    input  wire[0:`AURORA_LANE_NUM-1]   ch1_rxp,  
    input  wire[0:`AURORA_LANE_NUM-1]   ch1_rxn,  
    output wire[0:`AURORA_LANE_NUM-1]   ch1_txp,  
    output wire[0:`AURORA_LANE_NUM-1]   ch1_txn
);
wire aurora_clk;
wire clk, rst_n;
// Aurora
(*mark_debug = "true"*)wire                          ch0_channel_up;
(*mark_debug = "true"*)wire[`AURORA_LANE_NUM-1:0]    ch0_lane_up;
(*mark_debug = "true"*)wire                          ch0_hard_err;

(*mark_debug = "true"*)wire                          ch0_rx_rst_busy;
(*mark_debug = "true"*)wire                          ch0_rx_fifo_rd_en;
(*mark_debug = "true"*)wire                          ch0_rx_fifo_rd_valid;
(*mark_debug = "true"*)wire                          ch0_rx_fifo_empty;
(*mark_debug = "true"*)wire[`AURORA_DATA_SIZE-1:0]   ch0_rx_fifo_rd_data;

(*mark_debug = "true"*)wire                          ch0_tx_rst_busy;
(*mark_debug = "true"*)wire                          ch0_tx_fifo_full;
(*mark_debug = "true"*)reg                           ch0_tx_fifo_wr_en;
(*mark_debug = "true"*)reg [`AURORA_DATA_SIZE-1:0]   ch0_tx_fifo_wr_data;


// Aurora
(*mark_debug = "true"*)wire                          ch1_channel_up;
(*mark_debug = "true"*)wire[`AURORA_LANE_NUM-1:0]    ch1_lane_up;
(*mark_debug = "true"*)wire                          ch1_hard_err;

(*mark_debug = "true"*)wire                          ch1_rx_rst_busy;
(*mark_debug = "true"*)wire                          ch1_rx_fifo_rd_en;
(*mark_debug = "true"*)wire                          ch1_rx_fifo_rd_valid;
(*mark_debug = "true"*)wire                          ch1_rx_fifo_empty;
(*mark_debug = "true"*)wire[`AURORA_DATA_SIZE-1:0]   ch1_rx_fifo_rd_data;

(*mark_debug = "true"*)wire                          ch1_tx_rst_busy;
(*mark_debug = "true"*)wire                          ch1_tx_fifo_full;
(*mark_debug = "true"*)reg                           ch1_tx_fifo_wr_en;
(*mark_debug = "true"*)reg [`AURORA_DATA_SIZE-1:0]   ch1_tx_fifo_wr_data;

clk_wiz_0 u_clk_wiz_0(
    .clk_out1(aurora_clk),
    .clk_out2(clk),
    .locked(),      
    .clk_in1_p(sysclk1_clk_p), 
    .clk_in1_n(sysclk1_clk_n)  
);

vio_0 u_vio_0 (
  .clk(clk),          
  .probe_out0(rst_n) 
);

(*mark_debug = "true"*)reg [`AURORA_DATA_SIZE-1:0]   prev_ch0_rx_fifo_rd_data;
(*mark_debug = "true"*)reg [`AURORA_DATA_SIZE-1:0]   prev_ch1_rx_fifo_rd_data;

// channel 0
always @(posedge clk) begin
    if (~rst_n) begin
        ch0_tx_fifo_wr_en <= 1'b0;
        ch0_tx_fifo_wr_data<= 256'h0;
    end else begin
        ch0_tx_fifo_wr_en <= 1'b1;
        ch0_tx_fifo_wr_data<= ch0_tx_fifo_wr_data + 1'b1;
    end
end

assign ch0_rx_fifo_rd_en = ~ch0_rx_fifo_empty;
always @(posedge clk) begin
  if (~rst_n) begin
    prev_ch0_rx_fifo_rd_data <= 256'h0;
  end else if (ch0_rx_fifo_rd_en && ch0_rx_fifo_rd_valid) begin
    prev_ch0_rx_fifo_rd_data <= ch0_rx_fifo_rd_data;
  end
end

(*mark_debug = "true"*)wire ch0_rd_error = (prev_ch0_rx_fifo_rd_data > 1) && ch0_rx_fifo_rd_en && ch0_rx_fifo_rd_valid && (ch0_rx_fifo_rd_data - prev_ch0_rx_fifo_rd_data) != 1;



// channel 1

always @(posedge clk) begin
    if (~rst_n) begin
        ch1_tx_fifo_wr_en <= 1'b0;
        ch1_tx_fifo_wr_data<= 256'h0;
    end else begin
        ch1_tx_fifo_wr_en <= 1'b1;
        ch1_tx_fifo_wr_data<= ch1_tx_fifo_wr_data + 1'b1;
    end
end


assign ch1_rx_fifo_rd_en = ~ch1_rx_fifo_empty;
always @(posedge clk) begin
  if (~rst_n) begin
    prev_ch1_rx_fifo_rd_data <= 256'h0;
  end else if (ch1_rx_fifo_rd_en && ch1_rx_fifo_rd_valid) begin
    prev_ch1_rx_fifo_rd_data <= ch1_rx_fifo_rd_data;
  end
end

(*mark_debug = "true"*)wire ch1_rd_error = (prev_ch1_rx_fifo_rd_data > 1) && ch1_rx_fifo_rd_en && ch1_rx_fifo_rd_valid && (ch1_rx_fifo_rd_data - prev_ch1_rx_fifo_rd_data) != 1;


aurora_top_w256_1375Gbps u_aurora_top_w256_1375Gbps_ch0(
    .init_clk         ( aurora_clk           ),
    .locked           ( rst_n                ),
    .tx_wr_clk        ( clk                  ),
    .tx_rst_busy      ( ch0_tx_rst_busy      ),
    .tx_fifo_full     ( ch0_tx_fifo_full     ),
    .tx_fifo_wr_en    ( ch0_tx_fifo_wr_en    ),
    .tx_fifo_wr_data  ( ch0_tx_fifo_wr_data  ),
    .rx_rd_clk        ( clk                  ),
    .rx_rst_busy      ( ch0_rx_rst_busy      ),
    .rx_fifo_empty    ( ch0_rx_fifo_empty    ),
    .rx_fifo_rd_en    ( ch0_rx_fifo_rd_en    ),
    .rx_fifo_rd_valid ( ch0_rx_fifo_rd_valid ),
    .rx_fifo_rd_data  ( ch0_rx_fifo_rd_data  ),
    .channel_up       ( ch0_channel_up       ),
    .lane_up          ( ch0_lane_up          ),
    .hard_err         ( ch0_hard_err         ),
    .reference_clk_p  ( ch0_reference_clk_p  ),
    .reference_clk_n  ( ch0_reference_clk_n  ),
    .rxp              ( ch0_rxp              ),
    .rxn              ( ch0_rxn              ),
    .txp              ( ch0_txp              ),
    .txn              ( ch0_txn              )
);    


aurora_top_w256_1375Gbps u_aurora_top_w256_1375Gbps_ch1(
    .init_clk         ( aurora_clk           ),
    .locked           ( rst_n                ),
    .tx_wr_clk        ( clk                  ),
    .tx_rst_busy      ( ch1_tx_rst_busy      ),
    .tx_fifo_full     ( ch1_tx_fifo_full     ),
    .tx_fifo_wr_en    ( ch1_tx_fifo_wr_en    ),
    .tx_fifo_wr_data  ( ch1_tx_fifo_wr_data  ),
    .rx_rd_clk        ( clk                  ),
    .rx_rst_busy      ( ch1_rx_rst_busy      ),
    .rx_fifo_empty    ( ch1_rx_fifo_empty    ),
    .rx_fifo_rd_en    ( ch1_rx_fifo_rd_en    ),
    .rx_fifo_rd_valid ( ch1_rx_fifo_rd_valid ),
    .rx_fifo_rd_data  ( ch1_rx_fifo_rd_data  ),
    .channel_up       ( ch1_channel_up       ),
    .lane_up          ( ch1_lane_up          ),
    .hard_err         ( ch1_hard_err         ),
    .reference_clk_p  ( ch1_reference_clk_p  ),
    .reference_clk_n  ( ch1_reference_clk_n  ),
    .rxp              ( ch1_rxp              ),
    .rxn              ( ch1_rxn              ),
    .txp              ( ch1_txp              ),
    .txn              ( ch1_txn              )
);



endmodule