module rca_test;
    reg [3:0]x,y;
    reg cy_in;
    wire [3:0]s;
    wire cy4;
    add4 RCA(s,cy4,cy_in,x,y);
    initial
        begin
            $dumpfile("rca.vcd");
            $dumpvars(0,rca_test);
            $monitor($time, " x=%4b y= %4b c=%b Sum=%4b Carry =%b", x,y,cy_in, s, cy4);
            #5 x= 4'b0001; y= 4'b0010; cy_in = 1'b0;
            #5 x= 4'b0010; y= 4'b1000;
            #5 x= 4'b1110; y= 4'b1001;
            #5 $finish;
        end
endmodule