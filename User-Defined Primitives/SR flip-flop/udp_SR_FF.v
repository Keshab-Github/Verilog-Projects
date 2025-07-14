// A positive edge sensitive SR flip-flop
primitive SRFF(q, s, r, clk, clr);
    input s,r,clk, clr;
    output reg q;
    table
    // s r clk clr  q  q_new
       ? ?  ?   1 : ? : 0;   // clear
       ? ?  ? (10): ? : -;   // ignore...(no change)
       0 0 (01) 0 : ? : -;   // no change
       0 1 (01) 0 : ? : 0;   // reset condition 
       1 0 (01) 0 : ? : 1;   // set condition 
       1 1 (01) 0 : ? : x;   // invalid condition
       ? ? (10) 0 : ? : -;   // ignore...(no change)
    endtable
endprimitive