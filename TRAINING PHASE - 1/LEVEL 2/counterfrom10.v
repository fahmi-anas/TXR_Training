`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 14:17:30
// Design Name: 
// Module Name: counterfrom10
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


module counterfrom10(
    input clk, rst,
    output reg [3:0] q
    );
    
    always @(posedge clk) begin
        if (rst) begin
            q <= 4'b1010;
        end
        else begin
            q <= q + 1'b1;
        end
    end
endmodule
