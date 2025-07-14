module dff_test;
    reg d, set, reset, clk;
    wire q, qbar;
    dff DUT(q, qbar, d, set, reset, clk);
    always
        #5 clk = ~clk;
    initial
        begin
            clk=0;
            $dumpfile("dff.vcd");
            $dumpvars(0,dff_test);
            $monitor($time, " Set:%b Reset:%b D=%b Q=%b Qbar=%b",set, reset, d, q, qbar);
            set = 1; reset = 1; d=0;
            #7 set= 0; d=1;
            #5 d=0;
            #10 set =1; 
            #10 d=0;
            #10 d=1;
            #2 reset =0;
            #12 reset = 1;
            #10 d=0;
            #10 $finish;
        end
endmodule