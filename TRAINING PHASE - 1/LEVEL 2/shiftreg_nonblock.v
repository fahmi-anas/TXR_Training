`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 14:51:23
// Design Name: 
// Module Name: shiftreg_nonblock
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


module shiftreg_nonblock(
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg [2:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= 3'b000;
    else
        q <= {q[1:0], din};   // shift left, insert din at LSB
end

endmodule

