module uart_rx (
    input  wire clk,
    input  wire rst,
    input  wire tick,
    input  wire rx,
    output reg  [7:0] data_out,
    output reg  data_valid
);

    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    reg [1:0] state;
    reg [3:0] bit_index;
    reg [1:0] stop_count;
    reg [7:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state       <= IDLE;
            bit_index   <= 0;
            stop_count  <= 0;
            data_valid  <= 0;
        end
        else begin
            data_valid <= 0;  // default

            case (state)

            // -------------------------
            // IDLE
            // -------------------------
            IDLE: begin
                if (rx == 0) begin
                    state <= START;
                end
            end

            // -------------------------
            // START
            // Wait one tick to align
            // -------------------------
            START: begin
                if (tick) begin
                    if (rx == 0) begin
                        state <= DATA;
                        bit_index <= 0;
                    end
                    else begin
                        state <= IDLE;  // false start
                    end
                end
            end

            // -------------------------
            // DATA (8 bits)
            // -------------------------
            DATA: begin
                if (tick) begin
                    shift_reg[bit_index] <= rx;
                    bit_index <= bit_index + 1;

                    if (bit_index == 7)
                        state <= STOP;
                end
            end

            // -------------------------
            // STOP (2 stop bits)
            // -------------------------
            STOP: begin
                if (tick) begin
                    if (rx == 1) begin
                        stop_count <= stop_count + 1;

                        if (stop_count == 1) begin
                            data_out  <= shift_reg;
                            data_valid <= 1;
                            state <= IDLE;
                            stop_count <= 0;
                        end
                    end
                    else begin
                        state <= IDLE;  // framing error
                        stop_count <= 0;
                    end
                end
            end

            endcase
        end
    end

endmodule
