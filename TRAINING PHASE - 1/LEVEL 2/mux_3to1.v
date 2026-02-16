`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 13:41:57
// Design Name: 
// Module Name: mux_3to1
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


module mux_3to1(
    input a, b, c,
    input [1:0] sel,
    output reg y
    );
    
    always @(*) begin
        case (sel) 
            2'b00 : y = a;
            2'b01 : y = b;
            2'b10 : y = c;
            default: y = 1'b0 ;
        endcase
    end
endmodule
