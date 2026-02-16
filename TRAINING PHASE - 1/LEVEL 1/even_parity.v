module even_parity_8bit (
    input  wire [7:0] data,
    output wire parity
);

assign parity = ^data;   // Reduction XOR operator

endmodule
