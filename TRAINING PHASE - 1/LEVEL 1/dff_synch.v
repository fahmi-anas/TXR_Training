module dff_synch(
    input d, clk,
    input reset,
    input reg q, qbar
);

    always @(posedge clk) begin
        if (!reset) begin
            q <= d;
            qbar <= ~d;
        end
    end
endmodule