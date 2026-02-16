module ram_16x8_readmemh (
    input  wire        clk,
    input  wire        we,          // Write enable
    input  wire [3:0]  addr,        // 4-bit address (16 locations)
    input  wire [7:0]  din,         // Data input
    output wire [7:0]  dout         // Data output
);

    reg [7:0] mem [0:15];

    initial begin
        $readmemh("mem_init.hex", mem);
    end

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;
    end

    assign dout = mem[addr];

endmodule
