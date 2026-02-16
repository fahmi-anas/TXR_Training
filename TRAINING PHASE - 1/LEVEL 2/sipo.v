`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 10:02:10
// Design Name: 
// Module Name: sipo
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


module sipo(
    input clk, 
    input reset,
    input din,
    output reg [2:0] q
    );
    
    always @(posedge clk) begin
        if (reset) begin
            q <= 3'b000;
        end
        else begin
            q <= {din, q[2:1]};
        end
     end
     
endmodule
