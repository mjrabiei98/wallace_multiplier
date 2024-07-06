module RippleCarryAdder_2 #(parameter WIDTH = 32) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH-1:0] sum,
    output cout
);
    assign {cout, sum} = a + b;
endmodule


module wallace_16bit (
    input [15:0] a,
    input [15:0] b,
    output [31:0] Mul
);

    wire [31:0] interim_mul, carry, mull;
    wire [15:0] mul0, mul1, mul2, mul3;
    wire [16:0] s1, s2, c1, c2;
    wire cc;

    wallace_8bit multiplier0 (
        .a(a[7:0]),
        .b(b[7:0]),
        .Mul(mul0)
    );

    wallace_8bit multiplier1 (
        .a(a[7:0]),
        .b(b[15:8]),
        .Mul(mul1)
    );

    wallace_8bit multiplier2 (
        .a(a[15:8]),
        .b(b[7:0]),
        .Mul(mul2)
    );

    wallace_8bit multiplier3 (
        .a(a[15:8]),
        .b(b[15:8]),
        .Mul(mul3)
    );

    FullAdder fa11 (.a(mul0[8]),  .b(mul1[0]),  .cin(mul2[0]),  .sum(s1[1]),  .cout(c1[1]));
    FullAdder fa12 (.a(mul0[9]),  .b(mul1[1]),  .cin(mul2[1]),  .sum(s1[2]),  .cout(c1[2]));
    FullAdder fa13 (.a(mul0[10]), .b(mul1[2]),  .cin(mul2[2]),  .sum(s1[3]),  .cout(c1[3]));
    FullAdder fa14 (.a(mul0[11]), .b(mul1[3]),  .cin(mul2[3]),  .sum(s1[4]),  .cout(c1[4]));
    FullAdder fa15 (.a(mul0[12]), .b(mul1[4]),  .cin(mul2[4]),  .sum(s1[5]),  .cout(c1[5]));
    FullAdder fa16 (.a(mul0[13]), .b(mul1[5]),  .cin(mul2[5]),  .sum(s1[6]),  .cout(c1[6]));
    FullAdder fa17 (.a(mul0[14]), .b(mul1[6]),  .cin(mul2[6]),  .sum(s1[7]),  .cout(c1[7]));
    FullAdder fa18 (.a(mul0[15]), .b(mul1[7]),  .cin(mul2[7]),  .sum(s1[8]),  .cout(c1[8]));
    FullAdder fa19 (.a(mul3[0]),  .b(mul1[8]),  .cin(mul2[8]),  .sum(s1[9]),  .cout(c1[9]));
    FullAdder fa110 (.a(mul3[1]),  .b(mul1[9]),  .cin(mul2[9]),  .sum(s1[10]), .cout(c1[10]));
    FullAdder fa111 (.a(mul3[2]),  .b(mul1[10]), .cin(mul2[10]), .sum(s1[11]), .cout(c1[11]));
    FullAdder fa112 (.a(mul3[3]),  .b(mul1[11]), .cin(mul2[11]), .sum(s1[12]), .cout(c1[12]));
    FullAdder fa113 (.a(mul3[4]),  .b(mul1[12]), .cin(mul2[12]), .sum(s1[13]), .cout(c1[13]));
    FullAdder fa114 (.a(mul3[5]),  .b(mul1[13]), .cin(mul2[13]), .sum(s1[14]), .cout(c1[14]));
    FullAdder fa115 (.a(mul3[6]),  .b(mul1[14]), .cin(mul2[14]), .sum(s1[15]), .cout(c1[15]));
    FullAdder fa116 (.a(mul3[7]),  .b(mul1[15]), .cin(mul2[15]), .sum(s1[16]), .cout(c1[16]));

    FullAdder fa21 (.a(s1[2]),   .b(c1[1]),   .cin(1'b0), .sum(s2[1]),  .cout(c2[1]));
    FullAdder fa22 (.a(s1[3]),   .b(c1[2]),   .cin(1'b0), .sum(s2[2]),  .cout(c2[2]));
    FullAdder fa23 (.a(s1[4]),   .b(c1[3]),   .cin(1'b0), .sum(s2[3]),  .cout(c2[3]));
    FullAdder fa24 (.a(s1[5]),   .b(c1[4]),   .cin(1'b0), .sum(s2[4]),  .cout(c2[4]));
    FullAdder fa25 (.a(s1[6]),   .b(c1[5]),   .cin(1'b0), .sum(s2[5]),  .cout(c2[5]));
    FullAdder fa26 (.a(s1[7]),   .b(c1[6]),   .cin(1'b0), .sum(s2[6]),  .cout(c2[6]));
    FullAdder fa27 (.a(s1[8]),   .b(c1[7]),   .cin(1'b0), .sum(s2[7]),  .cout(c2[7]));
    FullAdder fa28 (.a(s1[9]),   .b(c1[8]),   .cin(1'b0), .sum(s2[8]),  .cout(c2[8]));
    FullAdder fa29 (.a(s1[10]),  .b(c1[9]),   .cin(1'b0), .sum(s2[9]),  .cout(c2[9]));
    FullAdder fa210 (.a(s1[11]),  .b(c1[10]),  .cin(1'b0), .sum(s2[10]), .cout(c2[10]));
    FullAdder fa211 (.a(s1[12]),  .b(c1[11]),  .cin(1'b0), .sum(s2[11]), .cout(c2[11]));
    FullAdder fa212 (.a(s1[13]),  .b(c1[12]),  .cin(1'b0), .sum(s2[12]), .cout(c2[12]));
    FullAdder fa213 (.a(s1[14]),  .b(c1[13]),  .cin(1'b0), .sum(s2[13]), .cout(c2[13]));
    FullAdder fa214 (.a(s1[15]),  .b(c1[14]),  .cin(1'b0), .sum(s2[14]), .cout(c2[14]));
    FullAdder fa215 (.a(s1[16]),  .b(c1[15]),  .cin(1'b0), .sum(s2[15]), .cout(c2[15]));
    FullAdder fa216 (.a(mul3[8]), .b(c1[16]),  .cin(1'b0), .sum(s2[16]), .cout(c2[16]));

    assign interim_mul = {mul3[15:9], s2[16:1], s1[1], mul0[7:0]};
    assign carry       = {6'b000000, c2[16:1], 10'b0000000000};

    RippleCarryAdder_2 cra (
        .a(interim_mul),
        .b(carry),
        .sum(mull),
        .cout(cc)
    );

    assign Mul = mull;

endmodule
