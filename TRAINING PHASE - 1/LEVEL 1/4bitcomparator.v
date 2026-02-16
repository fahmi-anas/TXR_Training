module comparator(
    input [3:0] a, b;
    output great, less, eq;
    input enable
);


    assign great = (a>b) ? 1'b1 : 1'b0;
    assign less = (a<b) ? 1'b1 : 1'b0;
    assign equal = (a==b) ? 1'b1 : 1'b0;

endmodule