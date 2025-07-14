module four_bit_counter2_test;
    reg clk, rst;
    wire [3:0] count;
    counter2 CNT(clk, rst, count);
    always
        #5 clk = ~clk;
    initial
        begin
            clk = 0;
            $dumpfile("counter4bit_2.vcd");
            $dumpvars(0, four_bit_counter2_test);
            $monitor($time, " Count:%4b", count);
            rst = 0;
            #13 rst =1;
            #9 rst =0;
            #40 rst =1;
            #9 rst =0;
            #100 $finish;
        end
endmodule