`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 12:16:31
// Design Name: 
// Module Name: tff
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


module tff(
    input clk, reset, t,
    output reg q
    );
    
    always @(posedge clk) begin
        if (reset)begin
            q <= 1'b0;
        end
        else if (t) begin
            q <= ~q;
        end
    end   
endmodule
