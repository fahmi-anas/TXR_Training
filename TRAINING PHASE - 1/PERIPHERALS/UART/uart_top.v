`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 14:03:11
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_top(
    input clk, rst,
    input rx,
    input tx_start,
    input [7:0] txdata,
    
    output tx_busy,
    output tx,
    output [7:0] rxdata,
    output rxdata_valid
    );
    
    wire tick;
    
    uart_baudrate_tick_gen baud ( .clk(clk), .rst(rst), .tick(tick) );
    
    uart_tx txd (.clk(clk), .rst(rst), .tick(tick),
                .tx_start(tx_start),
                .data_in(txdata),
                .tx_busy(tx_busy),
                .tx(tx) ) ;
     
    uart_rx rxd (.clk(clk), .rst(rst), .tick(tick),
                 .rx(rx),
                 .data_out(rxdata),
                 .data_valid(rxdata_valid) ) ;
endmodule
