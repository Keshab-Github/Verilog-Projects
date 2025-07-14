module decoder_test;
    reg in;
    reg [1:0] sel;
    wire [3:0] out;
    
    generate_decoder DEC(out, in, sel);
    initial
        begin
            $dumpfile("decoder.vcd");
            $dumpvars(0, decoder_test);
            $monitor($time, " in=%b sel=%2b out=%b", in, sel, out);
            #5 in = 0; sel=2'b00;
            #5 in = 1; sel=2'b01;
            #5 in = 0; sel=2'b10;
            #5 in = 1; sel=2'b11;
            #5 $finish;
        end
endmodule