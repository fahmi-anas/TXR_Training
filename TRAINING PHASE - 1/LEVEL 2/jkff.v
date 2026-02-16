`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 13:20:45
// Design Name: 
// Module Name: jkff
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


module jkff(
    input clk, reset,
    input j, k,
    output reg q
    );
    
    always @(posedge clk) begin
        if (reset) begin
            q <= 1'b0;
        end
        else begin
            case ({j, k}) 
                2'b00 : q <= q ;
                2'b01 : q <= 1'b0 ;
                2'b10 : q <= 1'b1 ;
                2'b11 : q <= ~q ;
            endcase
        end
       
    end
    
endmodule
