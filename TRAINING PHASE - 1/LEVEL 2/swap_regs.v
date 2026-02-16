`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 11:59:57
// Design Name: 
// Module Name: swap_regs
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


module swap_regs(
    input clk, reset, swap,
    input [7:0] ain, bin,
    output reg [7:0] aout, bout
    );
    
    always @(posedge clk) begin 
        if (reset) begin
            aout <= 8'b00000000;
            bout <= 8'b0;
        end
        else if (swap) begin
            aout <= bin;
            bout <= ain;
        end
        else begin
            aout <= ain;
            bout <= bin;
            
        end
    end 
endmodule
