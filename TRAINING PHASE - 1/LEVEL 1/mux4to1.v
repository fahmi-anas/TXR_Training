module 4n1mux (
    input a, b, c, d,
    output  reg out,
    input [1:0] sel
);

    always @(sel) begin
        case (sel) 
            2'b00: out <= a;
            2'b01: out <= b;
            2'b10: out <= c;
            2'b11: out <= d;
            default : out <= 1'b0;
        endcase
    end

endmodule