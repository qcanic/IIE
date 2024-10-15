`timescale 1ns / 1ps
//13.75Gbps;USER_CLK=215M
module aurora_top_w256_1375Gbps#(
    parameter LANE_NUM   = 4,
    parameter DATA_WIDTH = LANE_NUM * 64
)(
	input		            init_clk,	//50MHz
	input		            locked,     //rst_n
/************write fifo*****************/
	input			        tx_wr_clk,
	output			        tx_rst_busy,//detected low is ready
	output			        tx_fifo_full,
	input			        tx_fifo_wr_en,
	input [DATA_WIDTH-1:0]	tx_fifo_wr_data,
	
/************read fifo*****************/
	input			        rx_rd_clk,
	output			        rx_rst_busy,//detected low is ready
	output			        rx_fifo_empty,
	input			        rx_fifo_rd_en,
	output			        rx_fifo_rd_valid,
	output[DATA_WIDTH-1:0]	rx_fifo_rd_data,

//Status
	output			        channel_up,
	output[LANE_NUM-1:0]	lane_up,
	output                  hard_err,
// GTX reference clk	
	input   	            reference_clk_p,//direct to top
	input   	            reference_clk_n,//direct to top
// GTX Serial I/O
	input [0:LANE_NUM-1]    rxp,//direct to top
	input [0:LANE_NUM-1]    rxn,//direct to top
	output[0:LANE_NUM-1]    txp,//direct to top
	output[0:LANE_NUM-1]    txn//direct to top
 );


aurora_64b66b_w256_1375Gbps_exdes aurora_i
 (
     // User IO
     .RESET(~locked),
     // Error signals from Aurora    
     .HARD_ERR              ( hard_err),
     // Status Signals
     .LANE_UP               ( lane_up),
     .CHANNEL_UP            ( channel_up),
 
 
     .INIT_CLK_i            ( init_clk),
     .PMA_INIT              (~locked),
 
     // Clock Signals
     .GTYQ0_P               ( reference_clk_p),
     .GTYQ0_N               ( reference_clk_n),
 
     // GT I/O
     .RXP                   ( rxp),
     .RXN                   ( rxn),

     .TXP                   ( txp),
     .TXN                   ( txn),

     .TX_FIFO_FULL	        ( tx_fifo_full ),
     .WR_CLK                ( tx_wr_clk ),
     .WR_EN                 ( tx_fifo_wr_en ),
     .WR_DIN                ( tx_fifo_wr_data ),
	 .wr_rst_busy           ( tx_rst_busy  ),
	 
     .RX_FIFO_EMPTY         ( rx_fifo_empty ),
     .RD_CLK                ( rx_rd_clk ),
     .RD_EN                 ( rx_fifo_rd_en ),
     .RD_VALID              ( rx_fifo_rd_valid ),
     .RD_DOUT               ( rx_fifo_rd_data ),
	 .rd_rst_busy           ( rx_rst_busy )
 );

endmodule