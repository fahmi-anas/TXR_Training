module dff(
    input clk, 
    input d,
    input resetn,

    output reg q
); // w / active low reset 

    always @(posedge clk or negedge resetn) begin
        if (resetn) begin
            q <= d;
        end
        else q <= 1'b0;
    end

endmodule