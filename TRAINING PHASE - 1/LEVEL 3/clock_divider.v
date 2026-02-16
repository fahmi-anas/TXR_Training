`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:56:09
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clkin, rst,
    output  clkout
    );
    
    reg q;
    
    always @(posedge  clkin) begin
        if (rst) begin
            q <= 1'b0;
        end
        else begin
            q <= ~q;
        end
    end
    
    assign clkout = q;
endmodule
