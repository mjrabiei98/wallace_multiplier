module wallace_8bit (
    input [7:0] a,
    input [7:0] b,
    output [15:0] Mul
);

    wire [11:0] sum_interim, carry_interim, product_interim;
    wire [80:0] partial_products;
    wire cout_final;

    wire s0_1, c0_1, s1_1, c1_1, s2_1, c2_1, s3_1, c3_1;
    wire s0_2, c0_2, s1_2, c1_2, s2_2, c2_2, s3_2, c3_2;
    wire s0_3, c0_3, s1_3, c1_3, s2_3, c2_3, s3_3, c3_3;
    wire s0_4, c0_4, s1_4, c1_4, s2_4, c2_4, s3_4, c3_4;
    wire s0_5, c0_5, s1_5, c1_5, s2_5, c2_5, s3_5, c3_5;
    wire s0_6, c0_6, s1_6, c1_6, s2_6, c2_6, s3_6, c3_6;
    wire s0_7, c0_7, s1_7, c1_7, s2_7, c2_7, s3_7, c3_7;
    wire s0_8, c0_8, s1_8, c1_8, s2_8, c2_8, s3_8, c3_8;
    wire s4_0, s4_1, c4_1, s4_2, c4_2, s4_3, c4_0, c4_3;
    wire s4_4, c4_4, s4_5, c4_5, s4_6, c4_6, s4_7, c4_7;
    wire s4_8, c4_8, s4_9, c4_9, s5_0, c5_0, s5_1, c5_1;
    wire s5_2, c5_2, s5_3, c5_3, s5_4, c5_4, s5_5, c5_5;
    wire s5_6, c5_6, s5_7, c5_7, s5_8, c5_8, s5_9, c5_9;
    wire s5_10, c5_10;

    wire pp0_0, pp1_0, pp2_0, pp3_0, pp0_1, pp1_1, pp2_1, pp3_1;
    wire pp0_2, pp1_2, pp2_2, pp3_2, pp0_3, pp1_3, pp2_3, pp3_3;
    wire pp0_4, pp1_4, pp2_4, pp3_4, pp0_5, pp1_5, pp2_5, pp3_5;
    wire pp0_6, pp1_6, pp2_6, pp3_6, pp0_7, pp1_7, pp2_7, pp3_7;
    wire pp4_0, pp5_0, pp6_0, pp7_0, pp4_1, pp5_1, pp6_1, pp7_1;
    wire pp4_2, pp5_2, pp6_2, pp7_2, pp4_3, pp5_3, pp6_3, pp7_3;
    wire pp4_4, pp5_4, pp6_4, pp7_4, pp4_5, pp5_5, pp6_5, pp7_5;
    wire pp4_6, pp5_6, pp6_6, pp7_6, pp4_7, pp5_7, pp6_7, pp7_7;

    assign pp0_0 = a[0] & b[0]; assign pp1_0 = a[1] & b[0]; assign pp2_0 = a[2] & b[0]; assign pp3_0 = a[3] & b[0];
    assign pp0_1 = a[0] & b[1]; assign pp1_1 = a[1] & b[1]; assign pp2_1 = a[2] & b[1]; assign pp3_1 = a[3] & b[1];
    assign pp0_2 = a[0] & b[2]; assign pp1_2 = a[1] & b[2]; assign pp2_2 = a[2] & b[2]; assign pp3_2 = a[3] & b[2];
    assign pp0_3 = a[0] & b[3]; assign pp1_3 = a[1] & b[3]; assign pp2_3 = a[2] & b[3]; assign pp3_3 = a[3] & b[3];
    assign pp0_4 = a[0] & b[4]; assign pp1_4 = a[1] & b[4]; assign pp2_4 = a[2] & b[4]; assign pp3_4 = a[3] & b[4];
    assign pp0_5 = a[0] & b[5]; assign pp1_5 = a[1] & b[5]; assign pp2_5 = a[2] & b[5]; assign pp3_5 = a[3] & b[5];
    assign pp0_6 = a[0] & b[6]; assign pp1_6 = a[1] & b[6]; assign pp2_6 = a[2] & b[6]; assign pp3_6 = a[3] & b[6];
    assign pp0_7 = a[0] & b[7]; assign pp1_7 = a[1] & b[7]; assign pp2_7 = a[2] & b[7]; assign pp3_7 = a[3] & b[7];
    assign pp4_0 = a[4] & b[0]; assign pp5_0 = a[5] & b[0]; assign pp6_0 = a[6] & b[0]; assign pp7_0 = a[7] & b[0];
    assign pp4_1 = a[4] & b[1]; assign pp5_1 = a[5] & b[1]; assign pp6_1 = a[6] & b[1]; assign pp7_1 = a[7] & b[1];
    assign pp4_2 = a[4] & b[2]; assign pp5_2 = a[5] & b[2]; assign pp6_2 = a[6] & b[2]; assign pp7_2 = a[7] & b[2];
    assign pp4_3 = a[4] & b[3]; assign pp5_3 = a[5] & b[3]; assign pp6_3 = a[6] & b[3]; assign pp7_3 = a[7] & b[3];
    assign pp4_4 = a[4] & b[4]; assign pp5_4 = a[5] & b[4]; assign pp6_4 = a[6] & b[4]; assign pp7_4 = a[7] & b[4];
    assign pp4_5 = a[4] & b[5]; assign pp5_5 = a[5] & b[5]; assign pp6_5 = a[6] & b[5]; assign pp7_5 = a[7] & b[5];
    assign pp4_6 = a[4] & b[6]; assign pp5_6 = a[5] & b[6]; assign pp6_6 = a[6] & b[6]; assign pp7_6 = a[7] & b[6];
    assign pp4_7 = a[4] & b[7]; assign pp5_7 = a[5] & b[7]; assign pp6_7 = a[6] & b[7]; assign pp7_7 = a[7] & b[7];

    FullAdder fa01 (.a(pp0_1), .b(pp1_0), .cin(1'b0), .sum(s0_1), .cout(c0_1));
    FullAdder fa02 (.a(pp0_2), .b(pp1_1), .cin(pp2_0), .sum(s0_2), .cout(c0_2));
    FullAdder fa03 (.a(pp0_3), .b(pp1_2), .cin(pp2_1), .sum(s0_3), .cout(c0_3));
    FullAdder fa04 (.a(pp0_4), .b(pp1_3), .cin(pp2_2), .sum(s0_4), .cout(c0_4));
    FullAdder fa05 (.a(pp0_5), .b(pp1_4), .cin(pp2_3), .sum(s0_5), .cout(c0_5));
    FullAdder fa06 (.a(pp0_6), .b(pp1_5), .cin(pp2_4), .sum(s0_6), .cout(c0_6));
    FullAdder fa07 (.a(pp0_7), .b(pp1_6), .cin(pp2_5), .sum(s0_7), .cout(c0_7));
    FullAdder fa08 (.a(1'b0), .b(pp1_7), .cin(pp2_6), .sum(s0_8), .cout(c0_8));

    FullAdder fa11 (.a(pp3_1), .b(pp4_0), .cin(1'b0), .sum(s1_1), .cout(c1_1));
    FullAdder fa12 (.a(pp3_2), .b(pp4_1), .cin(pp5_0), .sum(s1_2), .cout(c1_2));
    FullAdder fa13 (.a(pp3_3), .b(pp4_2), .cin(pp5_1), .sum(s1_3), .cout(c1_3));
    FullAdder fa14 (.a(pp3_4), .b(pp4_3), .cin(pp5_2), .sum(s1_4), .cout(c1_4));
    FullAdder fa15 (.a(pp3_5), .b(pp4_4), .cin(pp5_3), .sum(s1_5), .cout(c1_5));
    FullAdder fa16 (.a(pp3_6), .b(pp4_5), .cin(pp5_4), .sum(s1_6), .cout(c1_6));
    FullAdder fa17 (.a(pp3_7), .b(pp4_6), .cin(pp5_5), .sum(s1_7), .cout(c1_7));
    FullAdder fa18 (.a(1'b0), .b(pp4_7), .cin(pp5_6), .sum(s1_8), .cout(c1_8));

    FullAdder fa21 (.a(s0_2), .b(c0_1), .cin(1'b0), .sum(s2_1), .cout(c2_1));
    FullAdder fa22 (.a(s0_3), .b(c0_2), .cin(pp3_5), .sum(s2_2), .cout(c2_2));
    FullAdder fa23 (.a(s0_4), .b(c0_3), .cin(s1_1), .sum(s2_3), .cout(c2_3));
    FullAdder fa24 (.a(s0_5), .b(c0_4), .cin(s1_2), .sum(s2_4), .cout(c2_4));
    FullAdder fa25 (.a(s0_6), .b(c0_5), .cin(s1_3), .sum(s2_5), .cout(c2_5));
    FullAdder fa26 (.a(s0_7), .b(c0_6), .cin(s1_4), .sum(s2_6), .cout(c2_6));
    FullAdder fa27 (.a(s0_8), .b(c0_7), .cin(s1_5), .sum(s2_7), .cout(c2_7));
    FullAdder fa28 (.a(pp2_7), .b(c0_8), .cin(s1_6), .sum(s2_8), .cout(c2_8));
    FullAdder fa31 (.a(c1_2), .b(pp6_0), .cin(1'b0), .sum(s3_1), .cout(c3_1));
    FullAdder fa32 (.a(c1_3), .b(pp6_1), .cin(pp7_1), .sum(s3_2), .cout(c3_2));
    FullAdder fa33 (.a(c1_4), .b(pp6_2), .cin(pp7_2), .sum(s3_3), .cout(c3_3));
    FullAdder fa34 (.a(c1_5), .b(pp6_3), .cin(pp7_3), .sum(s3_4), .cout(c3_4));
    FullAdder fa35 (.a(c1_6), .b(pp6_4), .cin(pp7_4), .sum(s3_5), .cout(c3_5));
    FullAdder fa36 (.a(c1_7), .b(pp6_5), .cin(pp7_5), .sum(s3_6), .cout(c3_6));
    FullAdder fa37 (.a(c1_8), .b(pp6_6), .cin(pp7_6), .sum(s3_7), .cout(c3_7));

    FullAdder fa40 (.a(s2_2), .b(c2_1), .cin(1'b0), .sum(s4_0), .cout(c4_0));
    FullAdder fa41 (.a(s2_3), .b(c2_2), .cin(1'b0), .sum(s4_1), .cout(c4_1));
    FullAdder fa42 (.a(s2_4), .b(c2_3), .cin(c1_1), .sum(s4_2), .cout(c4_2));
    FullAdder fa43 (.a(s2_5), .b(c2_4), .cin(s3_1), .sum(s4_3), .cout(c4_3));
    FullAdder fa44 (.a(s2_6), .b(c2_5), .cin(s3_2), .sum(s4_4), .cout(c4_4));
    FullAdder fa45 (.a(s2_7), .b(c2_6), .cin(s3_3), .sum(s4_5), .cout(c4_5));
    FullAdder fa46 (.a(s2_8), .b(c2_7), .cin(s3_4), .sum(s4_6), .cout(c4_6));
    FullAdder fa47 (.a(s1_7), .b(c2_8), .cin(s3_5), .sum(s4_7), .cout(c4_7));
    FullAdder fa48 (.a(s1_8), .b(1'b0), .cin(s3_6), .sum(s4_8), .cout(c4_8));
    FullAdder fa49 (.a(pp5_7), .b(1'b0), .cin(s3_7), .sum(s4_9), .cout(c4_9));

    FullAdder fa50 (.a(s4_1), .b(c4_0), .cin(1'b0), .sum(s5_0), .cout(c5_0));
    FullAdder fa51 (.a(s4_2), .b(c4_1), .cin(1'b0), .sum(s5_1), .cout(c5_1));
    FullAdder fa52 (.a(s4_3), .b(c4_2), .cin(1'b0), .sum(s5_2), .cout(c5_2));
    FullAdder fa53 (.a(s4_4), .b(c4_3), .cin(c3_1), .sum(s5_3), .cout(c5_3));
    FullAdder fa54 (.a(s4_5), .b(c4_4), .cin(c3_2), .sum(s5_4), .cout(c5_4));
    FullAdder fa55 (.a(s4_6), .b(c4_5), .cin(c3_3), .sum(s5_5), .cout(c5_5));
    FullAdder fa56 (.a(s4_7), .b(c4_6), .cin(c3_4), .sum(s5_6), .cout(c5_6));
    FullAdder fa57 (.a(s4_8), .b(c4_7), .cin(c3_5), .sum(s5_7), .cout(c5_7));
    FullAdder fa58 (.a(s4_9), .b(c4_8), .cin(c3_6), .sum(s5_8), .cout(c5_8));
    FullAdder fa59 (.a(s3_8), .b(c4_9), .cin(c3_7), .sum(s5_9), .cout(c5_9));
    FullAdder fa510 (.a(pp7_7), .b(1'b0), .cin(c3_8), .sum(s5_10), .cout(c5_10));

    assign sum_interim = {1'b0, s5_10, s5_9, s5_8, s5_7, s5_6, s5_5, s5_4, s5_3, s5_2, s5_1, s5_0};
    assign carry_interim = {c5_10, c5_9, c5_8, c5_7, c5_6, c5_5, c5_4, c5_3, c5_2, c5_1, c5_0, 1'b0};

    RippleCarryAdder #(12) cra (
        .a(sum_interim),
        .b(carry_interim),
        .sum(product_interim),
        .cout(cout_final)
    );

    assign Mul = {3'b0,product_interim[8:0], s4_0, s2_1, s0_1, pp0_0};

endmodule
