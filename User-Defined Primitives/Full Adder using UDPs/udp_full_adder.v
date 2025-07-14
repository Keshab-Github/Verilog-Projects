primitive udp_sum(sum, a, b, c);
    input a, b, c;
    output sum;
    table
    // a b c  sum
       0 0 0 : 0;
       0 0 1 : 1;
       0 1 0 : 1;
       0 1 1 : 0;
       1 0 0 : 1;
       1 0 1 : 0;
       1 1 0 : 0;
       1 1 1 : 1;
    endtable
endprimitive

//primitive udp_cy(cout, a,b,c);
//    input a,b,c;
//    output cout;
//    table
//    // a b c  cout
//       0 0 0 : 0;
//       0 0 1 : 0;
//       0 1 0 : 0;
//       0 1 1 : 1;
//       1 0 0 : 0;
//       1 0 1 : 1;
//       1 1 0 : 1;
//       1 1 1 : 1;
//    endtable
//endprimitive


primitive udp_cy(cout, a,b,c);  //using don't care(?)
    input a,b,c;
    output cout;
    table
    // a b c  cout
       0 0 ? : 0;
       0 ? 0 : 0;
       ? 0 0 : 0;
       1 1 ? : 1;
       1 ? 1 : 1;
       ? 1 1 : 1;
    endtable
endprimitive


module full_adder(sum, cout, a,b,c);
    input a,b,c;
    output sum, cout;
    udp_sum SUM(sum, a,b,c);
    udp_cy CARRY(cout, a,b,c);
endmodule

