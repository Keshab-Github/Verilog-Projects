// A T flip-flop
primitive TFF(q, clk, clr);
    input clk, clr;
    output reg q;
    table
    // clk clr  q  q_new
        ?   1 : ? : 0;    // FF is cleared
        ? (10): ? : -;    //remain in the previous state
      (10)  0 : 1 : 0;    // FF toggles at -ve edge of "clk"
      (10)  0 : 0 : 1;    // FF toggles at -ve edge of "clk"
      (0?)  0 : ? : -;    // remain in the previous state
    endtable
endprimitive