`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 14:22:38
// Design Name: 
// Module Name: dff_synch
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


module dff_synch(
    input clk, rst, en, d,
    output reg q

    );
    always @(posedge clk) begin 
        if (rst) q <= 1'b0;
        else if (en) q <= d;
    end
endmodule
