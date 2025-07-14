module ALU_8bit_test;
    reg [1:0] op;
    reg [7:0] a,b;
    wire [7:0]f;
    ALU_8bit DUT(f, a, b, op);
    initial
        begin
            $dumpfile("alu_8bit.vcd");
            $dumpvars(0, ALU_8bit_test);
            $monitor($time, " A=%8b B=%8b Op =%2b F=%8b", a, b, op, f);
            #5 a=8'b00011010; b=8'b00000001; op=2'b00;
            #5 a=8'b00011010; b=8'b00000001; op=2'b01;
            #5 a=8'b00011010; b=8'b00000001; op=2'b10;
            #5 a=8'b00011010; b=8'b00000001; op=2'b11;
            #5 $finish;
        end
endmodule