`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 13:28:58
// Design Name: 
// Module Name: mux_2to1_nolatch
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


module mux_2to1_nolatch(
    input a ,b ,
    input sel,
    output y
    );
    
    assign y = sel ? b : a;
endmodule
