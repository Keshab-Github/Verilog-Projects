// BEHAVIORAL Description of a 16-bit adder
module ALU(X,Y,Z, Sign, Zero, Carry, Parity, Overflow);
    input [15:0] X,Y;
    output [15:0] Z;
    output Sign, Zero, Carry, Parity, Overflow;
    
    assign {Carry, Z} = X+Y; //16-bit addition
    
    assign Sign = Z[15];
    assign Zero = ~|Z;    // bitwise NOR
    assign Parity = ~^Z;  // bitwise XNOR
    assign Overflow = (X[15]&Y[15]&~Z[15]) | (~X[15]&~Y[15]&Z[15]);

endmodule

//In signed arithmetic, overflow occurs when:
//  adding two +ve numbers yields a negative result
//  adding two -ve numbers yields a positive result
//So, overflow detection logic is correct for a 2's complement signed 16-bit adder

