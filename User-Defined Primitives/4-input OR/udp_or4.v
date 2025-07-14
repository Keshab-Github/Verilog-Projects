// A 4-input OR function
primitive udp_or4(f,a,b,c,d);
    input a,b,c,d;
    output f;
    table
    // a b c d   f
       1 ? ? ? : 1;
       ? 1 ? ? : 1;
       ? ? 1 ? : 1;
       ? ? ? 1 : 1;
       0 0 0 0 : 0;
    endtable
endprimitive