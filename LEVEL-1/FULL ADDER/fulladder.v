module fulladder(
    input a,
    input b,
    input c,
    output sum,
    output carry
);
    wire temp1, temp2, temp3;

    halfadder ha1 (.s(temp1), .c(temp2), .a(a), .b(b));
    halfadder ha2 (.s(sum), .c(temp3), .a(c), .b(temp1));
    or gate1(carry, temp2, temp3);

endmodule
