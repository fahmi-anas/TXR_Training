module priority_encoder(
  input  [3:0] a,
  output [1:0] reg out,
  input enable 
);

    always @(*) begin
        if (enable)begin

            if (a[3] == 1'b1)
                out <= 2'b11;
            else if (a[2] == 1'b1)
                out <= 2'b10;
            else if (a[1] == 1'b1)
                out <= 2'b01;
            else if (a[0] == 1'b1)
                out <= 2'b00;

    end

    endmodule