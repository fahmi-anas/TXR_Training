`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 14:36:19
// Design Name: 
// Module Name: uart_tx
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


module uart_tx (
    input  wire clk,
    input  wire rst,
    input  wire tick,
    input  wire tx_start,
    input  wire [7:0] data_in,
    output reg  tx,
    output reg  tx_busy
);

    reg [3 :0] bit_index;
    reg [10:0] shift_reg;  // 1 start + 8 data + 2 stop = 11 bits

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1;   // idle high
            tx_busy <= 0;
            bit_index <= 0;
        end
        else begin
            if (tx_start && !tx_busy) begin
                // Load frame: stop bits, data, start bit
                shift_reg <= {2'b11, data_in, 1'b0};
                tx_busy <= 1;
                bit_index <= 0;
            end
            else if (tick && tx_busy) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                bit_index <= bit_index + 1;

                if (bit_index == 10) begin
                    tx_busy <= 0;
                end
            end
        end
    end

endmodule
