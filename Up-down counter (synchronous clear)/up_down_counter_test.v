module counter_test;
    reg mode, clr, ld, clk;
    reg [7:0] d_in;
    wire [7:0] count;

    always
        #5 clk =~clk;

    initial
        begin
            clk=0;
            $dumpfile("up_down.vcd");
            $dumpvars(0, counter_test);
            $monitor($time, " Mode:%b Clr:%b Ld:%b Data:%8b Count:%8b", mode, clr, ld, d_in, count);
            mode = 1; clr = 0; ld =0;d_in=8'b0;
            #2 clr =1;
            #6 clr=0;ld =1; d_in = 8'b0;
            #100 clr=1;ld = 1; d_in= 8'b00010000;
            #6 clr=0; mode = 0;
            #100 $finish;
        end
endmodule