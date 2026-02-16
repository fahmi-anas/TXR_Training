`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 16:35:45
// Design Name: 
// Module Name: posedge_detector
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


//module posedge_detector(
//    input clk, sig,
//    output pulse,
//    output noty
    
//    );
    
//    reg delay;
    
//    always @(posedge clk) begin 
//        delay <= sig;
//    end 
    
//    assign noty = delay;
//    assign pulse = sig & ~delay;
//endmodule


module posedge_detector ( input sig,            // Input signal for which positive edge has to be detected
                      input clk,            // Input signal for clock
                      output pe);           // Output signal that gives a pulse when a positive edge occurs

    reg   sig_dly;                          // Internal signal to store the delayed version of signal

    // This always block ensures that sig_dly is exactly 1 clock behind sig
	always @ (posedge clk) begin
		sig_dly <= sig;
	end

    // Combinational logic where sig is AND with delayed, inverted version of sig
    // Assign statement assigns the evaluated expression in the RHS to the internal net pe
	assign pe = sig & ~sig_dly;
endmodule