`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 16:01:38
// Design Name: 
// Module Name: sr_latch_norgate
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


module sr_latch_norgate(

    input s, r,
    output  q,
    output  qbar
);

    assign q = ~(r | qbar);
    assign qbar = ~(s | q);

endmodule


