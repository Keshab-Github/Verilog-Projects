module add4(s,cy4,cy_in,x,y);
    input [3:0]x,y;
    input cy_in;
    output [3:0]s;
    output cy4;
    wire [2:0]cy_out;
    add B0 (cy_out[0], s[0], x[0], y[0], cy_in);
    add B1 (cy_out[1], s[1], x[1], y[1], cy_out[0]);
    add B2 (cy_out[2], s[2], x[2], y[2], cy_out[1]);
    add B3 (cy4, s[3], x[3], y[3], cy_out[2]);
endmodule

module add(cy_out, sum, a, b, cy_in);
    input a,b,cy_in;
    output sum, cy_out;
    sum s1(sum, a, b, cy_in);
    carry c1(cy_out, a,b, cy_in);
endmodule

module sum(sum,a,b,cy_in);
    input a,b,cy_in;
    output sum;
    wire t;
    xor x1(t,a,b);
    xor x2(sum, t, cy_in);
endmodule

module carry(cy_out, a,b, cy_in);
    input a,b,cy_in;
    output cy_out;
    wire t1,t2,t3;
    and g1(t1,a,b);
    and g2(t2,a,cy_in);
    and g3(t3,b,cy_in);
    or g4(cy_out,t1,t2,t3);
endmodule
