`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 11:19:23
// Design Name: 
// Module Name: single_port_ram
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

// WRITE ENABLE
module single_port_ram(
    
    input clk,
    input we,
    inout [7:0] data,
    input [3:0] addr
    );
    
    reg [7:0] mem [15:0] ;
    reg [7:0] temp;
    
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data;
        end
        else if (!we) begin
            temp <= mem[addr] ;
        end
    end
    
    assign data = !we ? temp : 8'bz;
endmodule
