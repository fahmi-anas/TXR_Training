`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 10:24:33
// Design Name: 
// Module Name: pipo
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


module pipo(
    input clk, reset,
    input [3:0] din,
    output reg[3:0] dout
    );
    
    always @(posedge clk) begin
        if ( reset ) begin
            dout <= 4'b0000;
        end
        else begin
            dout <= din;
        end
    end
endmodule
