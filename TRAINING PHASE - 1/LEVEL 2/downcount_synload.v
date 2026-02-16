`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 11:50:40
// Design Name: 
// Module Name: downcount_synload
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


module downcount_synload(
    input clk, reset, load,
    input [3:0] din,
    output reg [3:0] out
    );
    
    always @(posedge clk)
    begin
        if (reset)begin
            out <= 4'b0000;
        end
        else if (load) begin
            out <= din;
        end
        else begin
            out <= out - 1'b1;
        end
    end
    
endmodule
