module mux_8to1_test;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    mux_8to1 DUT(in, sel, out);
    initial
        begin
            $dumpfile("mux_behav.vcd");
            $dumpvars(0, mux_8to1_test);
            $monitor($time, " In:%8b Sel:%3b Out:%b", in, sel, out);
            #5 in = 8'b10001010; sel= 3'b001;
            #5 sel = 3'b100;
            #5 sel = 3'b110;
            #5 sel = 3'b111;
            #5 sel = 4'b1000;  //last 3 bits get assigned to sel
            #5 $finish;
        end
endmodule