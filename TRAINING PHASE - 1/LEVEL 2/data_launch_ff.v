`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 14:07:45
// Design Name: 
// Module Name: data_launch_ff
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


module data_launch_ff(
    input clk, reset,
    input en,
    input [3:0] d,
    output reg [3:0] q
    );
    always @(posedge clk) begin
        if (reset) begin 
            q <= 4'b0;
        end 
        else if (en) begin
            q <= d;
        end 
    end 
endmodule
