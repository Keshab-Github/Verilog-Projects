module compare_test;
    reg A1, A0, B1, B0;
    wire lt, gt, eq;
    
    compare CMP(A1, A0, B1, B0, lt, gt, eq);
    initial
        begin
            $dumpfile("compare.vcd");
            $dumpvars(0, compare_test);
            $monitor($time, " A=%b%b B=%b%b lt=%b gt=%b eq=%b", A1,A0, B1,B0, lt, gt, eq);
            #5 A1=0;A0=0;B1=1;B0=0;
            #5 A1=1;A0=1;B1=1;B0=0;
            #5 A1=0;A0=1;B1=0;B0=1;
            #5 $finish;
        end
endmodule