module nbit_counter #(
    parameter N = 8
)(
    input  wire             clk,
    input  wire             rst,          
    input  wire             en,   
    input  wire             load,       
    input  wire [N-1:0]     load_value,   
    input  wire [N-1:0]     max_value,   
    output reg  [N-1:0]     count,
    output wire             max_tick      
);

    always @(posedge clk) begin
        if (rst)
            count <= 0;
        else if (load)
            count <= load_value;
        else if (en) begin
            if (count == max_value)
                count <= 0;
            else
                count <= count + 1;
        end
    end

    assign max_tick = (count == max_value);

endmodule
