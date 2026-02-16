`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 14:03:24
// Design Name: 
// Module Name: clock_enable
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


module clock_enable(
input clk, 
    input reset,
    input en,
    input d,
    output reg q
    );
    
    always @(posedge clk) begin
        if (reset) begin
            q <= 1'b0;
        end
        else if (en) begin
            q <= d ;
        end
    end
    
endmodule