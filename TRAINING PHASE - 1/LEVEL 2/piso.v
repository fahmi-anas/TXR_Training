`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 10:10:25
// Design Name: 
// Module Name: piso
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


module piso(
     input clk, 
     input reset,
     input load,
     input [3:0] din,
     output dout
    );
    
    reg [3:0] q;
    
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000;
        end
        else if (load) begin
            q <= din;
        end
        else begin
            q <= {1'b0 , q[3:1]};
        end
    end   
 
    assign dout = q[0];
endmodule

















