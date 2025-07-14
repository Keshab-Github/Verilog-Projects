module dff2_test;
    reg d, set, reset, clk;
    wire q, qbar;
    dff2 DUT(q, qbar, d, set, reset, clk);
    always
        #5 clk = ~clk;
    initial
        begin
            clk=0;
            $dumpfile("dff2.vcd");
            $dumpvars(0,dff2_test);
            $monitor($time, " Set:%b Reset:%b D=%b Q=%b Qbar=%b",set, reset, d, q, qbar);
            set = 1; reset = 1; d=0;
            #7 set= 0;
            #2 d=1;
            #3 d=0;
            #10 set =1; 
            #10 d=1;
            #10 d=1;
            #2 reset =0;
            #12 reset = 1;
            #10 d=0;
            #10 $finish;
        end
endmodule