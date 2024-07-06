module test;

    reg [15:0] x, y;
    wire [31:0] mult_out;

    reg [7:0] dd, cc;
    wire [15:0] out;


    wallace_8bit Multiplier1 (
        .a(dd),
        .b(cc),
        .Mul(out)
    );

    wallace_16bit Multiplier2 (
        .a(x),
        .b(y),
        .Mul(mult_out)
    );

    initial begin
        x = 16'b0010000000000011;
        y = 16'b0000000000000100;
        cc = 16'b00110011;
        dd = 16'b00111100;
        #100 $stop; 
    end

endmodule
