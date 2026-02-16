module button_debouncer #(
    parameter CLK_FREQ    = 50_000_000,  // 50 MHz default
    parameter DEBOUNCE_MS = 10           // 10 ms debounce time
)(
    input  wire clk,
    input  wire rst,         // synchronous reset
    input  wire btn_in,      // raw button input
    output reg  btn_out      // debounced output
);

    // Calculate counter max value
    localparam integer MAX_COUNT = (CLK_FREQ / 1000) * DEBOUNCE_MS;
    localparam integer COUNTER_WIDTH = $clog2(MAX_COUNT);

    reg [COUNTER_WIDTH-1:0] counter = 0;

    // 2-stage synchronizer (important for real hardware)
    reg btn_sync0, btn_sync1;

    always @(posedge clk) begin
        if (rst) begin
            btn_sync0 <= 0;
            btn_sync1 <= 0;
        end else begin
            btn_sync0 <= btn_in;
            btn_sync1 <= btn_sync0;
        end
    end

    // Debounce logic
    always @(posedge clk) begin
        if (rst) begin
            btn_out <= 0;
            counter <= 0;
        end else begin
            if (btn_sync1 != btn_out) begin
                // Button changed — start counting
                if (counter < MAX_COUNT - 1)
                    counter <= counter + 1;
                else begin
                    btn_out <= btn_sync1; // accept new state
                    counter <= 0;
                end
            end else begin
                counter <= 0; // stable, reset counter
            end
        end
    end

endmodule
