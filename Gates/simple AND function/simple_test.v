module simple_and_test;
    reg x,y;
    wire f;
    integer i;
    simple_and MYAND1(f,x,y);
    initial
        begin
            $dumpfile("simple_and.vcd");
            $dumpvars(0,simple_and_test);
            for(i=0;i<4;i++)
                begin
                    #5 {x,y}=i;
                    #5 $display($time, " X=%b Y=%b F=%b", x,y,f);
                end
            
            
            //$monitor($time, " X=%b Y=%b F=%b", x,y,f);
            //#5 x=1; y=0;
            //#5 x=1; y=1;
            //#5 x=0; y=0;
            //#5 $finish;
        end
endmodule