module trans_latch_test;
    reg din, enable;
    wire q, qbar;
    latch LAT(q, qbar, din, enable);
    initial
        begin
            $dumpfile("latch.vcd");
            $dumpvars(0,trans_latch_test);
            $monitor($time," En:%b D=%b Q=%b Qbar=%b", enable, din, q, qbar);
            enable = 1'b0; din=1'b0;
            #5 enable = 1'b0; din=1'b1;
            #5 enable = 1'b1; din=1'b1; //enable becomes high(1) here at t=10 sec
            #5 enable = 1'b1; din=1'b0;
            #5 enable = 1'b1; din=1'b1;
            #5 enable = 1'b1; din=1'b1;
            #5 enable = 1'b1; din=1'b0;
            #5 $finish;
        end
endmodule