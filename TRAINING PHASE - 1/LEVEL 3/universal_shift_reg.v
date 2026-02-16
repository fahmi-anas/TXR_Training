module universal_shift_reg (
    input wire clk,
    input wire rst,                   
    input wire [1:0] sel,            
    input wire [3:0] d,               
    input wire serial_in_left,        
    input wire serial_in_right,       
    output reg [3:0] q                
);

always @(posedge clk) begin
    if (rst) begin
        q <= 4'b0000;
    end
    else begin
        case (sel)
            2'b00: q <= q;                                 
            2'b01: q <= {serial_in_right, q[3:1]};            
            2'b10: q <= {q[2:0], serial_in_left};            
            2'b11: q <= d;                                   
            default: q <= q;
        endcase
    end
end

endmodule
