module D_latch_test;
    reg D, En;
    wire Q;
    level_sensitive_D_latch DUT(D, Q, En);
    initial
        begin
            $dumpfile("Dlatch.vcd");
            $dumpvars(0, D_latch_test);
            $monitor($time, " En=%b, D=%b, Q=%b ",En, D, Q);
            En = 1'b0; D=1'b0;
            #5 En = 1'b0; D=1'b1;
            #5 En = 1'b1; D=1'b1; //enable becomes high(1) here at t=10 sec
            #5 En = 1'b1; D=1'b0;
            #5 En = 1'b1; D=1'b1;
            #5 En = 1'b1; D=1'b1;
            #5 En = 1'b1; D=1'b0;
            #5 $finish;
        end
endmodule