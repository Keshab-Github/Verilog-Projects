module testbench;
    reg a,b,c;
    wire sum, cout;
    integer i;
    full_adder FA(sum, cout,a,b,c);
    initial
        begin
        $dumpfile("fulladder.vcd");
        $dumpvars(0,testbench);
            for(i=0;i<8;i++)
                begin
                    {a,b,c}=i; #5
                    $display($time, " a=%b, b=%b, c=%b, sum=%b, cout=%b", a,b,c,sum, cout);
                end
        #5 $finish;   
        end





    //initial
    //begin
    //    $monitor($time, " a=%b, b=%b, c=%b, sum=%b, cout=%b",a,b,c,sum,cout);
    //    #5 a=0; b=0; c=1;
    //    #5 b=1;
    //    #5 a=1;
    //    #5 a=0;b=0;c=0;
    //    #5 $finish;
    //end

endmodule