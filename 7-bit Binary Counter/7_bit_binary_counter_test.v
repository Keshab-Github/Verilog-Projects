module test_counter;
    reg clk, clr;
    wire [7:0] out;
    counter CNT(clr, clk, out);
    initial clk=1'b0;
    always #5 clk=~clk;
    initial
        begin
            clr=1'b1;
            #15 clr=1'b0;
            #200 clr = 1'b1;
            #10 $finish;
        end
    initial
        begin
            $dumpfile("counter.vcd");
            $dumpvars(0, test_counter);
            $monitor($time, " Count: %d", out);
        end
endmodule