module compare_test;
    
    reg [3:0]A,B;
    wire lt, gt, eq;

    compare CMPTR(A, B, lt, gt, eq);
    initial
        begin
            $dumpfile("comparator.vcd");
            $dumpvars(0,compare_test);
            $monitor($time, " A=%4b B=%4b lt=%b gt=%b eq=%b", A,B,lt,gt,eq);
            #5 A=4'b0001; B=4'b0100;
            #5 A=4'b1010; B=4'b0110;
            #5 A=4'b1111; B=4'b1100;
            #5 A=4'b1101; B=4'b1101;
            #5 A=4'b1100; B=4'b0000;
            #5 $finish;
        end
endmodule