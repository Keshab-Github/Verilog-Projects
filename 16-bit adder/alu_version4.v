// Structural description of 16-bit adder using 4-bit adder blocks
// (four Carry Lookahead Adders)
module ALU(X,Y,Z, Sign, Zero, Carry, Parity, Overflow);
    input [15:0] X,Y;
    output [15:0] Z;
    output Sign, Zero, Carry, Parity, Overflow;
    wire [3:1]c;
    
    assign Sign = Z[15];
    assign Zero = ~|Z;    // bitwise NOR
    assign Parity = ~^Z;  // bitwise XNOR
    assign Overflow = (X[15]&Y[15]&~Z[15]) | (~X[15]&~Y[15]&Z[15]);

    adder4 A0(Z[3:0],c[1], X[3:0], Y[3:0], 1'b0);
    adder4 A1(Z[7:4],c[2], X[7:4], Y[7:4], c[1]);
    adder4 A2(Z[11:8],c[3], X[11:8], Y[11:8], c[2]);
    adder4 A3(Z[15:12],Carry, X[15:12], Y[15:12], c[3]);

endmodule


//Structural description of a Carry Lookahead Adder of 4-bits

module adder4(S, cout, A,B, cin);
    input [3:0] A,B;
    input cin;
    output [3:0] S;
    output cout;
    wire p0,g0,p1,g1,p2,g2,p3,g3;
    wire c1,c2,c3;

    //generating the propagate signals
    assign p0=A[0]^B[0], p1=A[1]^B[1], p2=A[2]^B[2], p3=A[3]^B[3];

    //generating the carry generate signals
    assign g0=A[0]&B[0], g1=A[1]&B[1], g2=A[2]&B[2], g3=A[3]&B[3];

    assign c1 = g0 | (p0 & cin),
           c2 = g1 | (p1 & g0) | (p1 & p0 & cin),
           c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin),
           cout=g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);

    assign S[0] = p0^cin,
           S[1] = p1^c1,
           S[2] = p2^c2,
           S[3] = p3^c3;

endmodule