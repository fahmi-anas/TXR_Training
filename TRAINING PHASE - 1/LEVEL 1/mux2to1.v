module 2n1_mux(
    input a, b, 
    input sel,
    output q
);

assign q = sel ? b : a ;

endmodule   