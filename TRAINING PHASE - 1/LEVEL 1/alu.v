module alu(
    input [1:0] op,
    input a, b,
    output reg out,
    output reg d
);

    always @(*) begin
        case(op) 
            2'b00: {d, out} = a + b;     // Addition (d is Carry)
            2'b01: {d, out} = a - b;     // Subtraction (d is Borrow)
            2'b10: begin
                 out = a | b;            // OR
                 d = 1'b0;   
            end 
            2'b11: begin
                 out = a & b;            // Changed to AND for variety
                 d = 1'b0;   
            end
            default: begin
                out = 1'b0;
                d = 1'b0;
            end
        endcase
    end
endmodule