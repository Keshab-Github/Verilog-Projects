module bcd_to_7seg_test;
    reg [3:0] bcd;
    wire [6:0] seg;
    bcd_to_7seg DUT(bcd, seg);
    initial
        begin
            $dumpfile("bcdto7seg.vcd");
            $dumpvars(0, bcd_to_7seg_test);
            $monitor($time, " In:%3b Out:%7b", bcd, seg);
            #5 bcd = 3'b001;
            #5 bcd = 3'b100;
            #5 $finish;
        end
endmodule