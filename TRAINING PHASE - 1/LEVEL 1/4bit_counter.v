module counter(
    input clk,
    input reset,
    output reg [3:0] out
);

    always @(posedge clk or negedge reset) begin
        if (!reset)
            out <= out + 1'b1;
    end
    
    endmodule
