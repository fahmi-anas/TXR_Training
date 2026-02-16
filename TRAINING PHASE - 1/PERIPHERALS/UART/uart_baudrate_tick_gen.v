`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 14:51:06
// Design Name: 
// Module Name: uart_baudrate_tick_gen
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


module uart_baudrate_tick_gen
    #(
     parameter CLK_FREQ = 50_000_000,
     parameter BAUD_RATE = 9600
    )
    (
     input clk, rst,
     output reg tick
    );
     
    localparam integer BAUD_COUNT = CLK_FREQ / BAUD_RATE;
    localparam integer COUNTER_WIDTH = $clog2(BAUD_COUNT);
    
    reg [COUNTER_WIDTH-1:0] count;
    
    always @(posedge clk) begin 
        if (rst) begin
            count <= 1'b0;
            tick <= 1'b0;
        end
        else if (count == BAUD_COUNT - 1)begin
            count <= 1'b0;
            tick <= 1'b1;
        end
        else begin
            count <= count + 1'b1;
            tick <= 1'b0;
        end
    end 
     
endmodule
