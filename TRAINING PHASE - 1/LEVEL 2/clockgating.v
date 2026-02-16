`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 13:51:16
// Design Name: 
// Module Name: clockgating
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


module clockgating(
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
