module sim_counter_test;
    reg clk, rst;
    wire [31:0] count;
    sim_counter CNT(clk, rst, count);
    initial
        begin 
            clk=0;
            $dumpfile("count.vcd");
            $dumpvars(0, sim_counter_test);
        end
    always
        #5 clk=~clk;
    initial
        begin
            rst =0;
            #12 rst = 1;
            #10 rst = 0;
            $monitor($time, " Count:%h",count);
            #200 $finish;
        end
endmodule