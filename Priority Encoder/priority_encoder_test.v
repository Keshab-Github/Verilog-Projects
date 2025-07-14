module priority_encoder_test;
    reg [7:0] in;
    wire [2:0] code;
    priority_encoder PE(in, code);
    initial
        begin
            $dumpfile("priority.vcd");
            $dumpvars(0, priority_encoder_test);
            $monitor($time, " In:%8b Out:%3b", in, code);
            #5 in = 8'b00000001;
            #5 in = 8'b00000010;
            #5 in = 8'b00100000;
            #5 in = 8'b00000000;  //default case
            #5 in = 8'b01001000;  //multiple bits are active
            #5 $finish;
        end
endmodule