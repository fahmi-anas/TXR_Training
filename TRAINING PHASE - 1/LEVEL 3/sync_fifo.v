module sync_fifo #(
    parameter DEPTH = 16,
    parameter WIDTH = 8
)(
    input  wire              clk,
    input  wire              rst,
    input  wire              wr_en,
    input  wire              rd_en,
    input  wire [WIDTH-1:0]  din,
    output reg  [WIDTH-1:0]  dout,
    output wire              full,
    output wire              empty
);

    localparam ADDR_WIDTH = 4;  

    reg [WIDTH-1:0] mem [0:DEPTH-1];

    reg [ADDR_WIDTH:0] wr_ptr;
    reg [ADDR_WIDTH:0] rd_ptr;


    always @(posedge clk) begin
        if (rst)
            wr_ptr <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
            wr_ptr <= wr_ptr + 1;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            dout   <= 0;
        end
        else if (rd_en && !empty) begin
            dout <= mem[rd_ptr[ADDR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

    assign empty = (wr_ptr == rd_ptr);

    assign full = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                  (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule
