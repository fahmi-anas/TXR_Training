module pwm_generator #(
    parameter WIDTH = 8     // Resolution (8-bit PWM)
)(
    input  wire                 clk,
    input  wire                 rst,       // synchronous reset
    input  wire [WIDTH-1:0]     duty,      // duty cycle input
    output reg                  pwm_out
);

    reg [WIDTH-1:0] counter;

    // Counter
    always @(posedge clk) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // Comparator
    always @(posedge clk) begin
        if (rst)
            pwm_out <= 0;
        else
            pwm_out <= (counter < duty);
    end

endmodule
