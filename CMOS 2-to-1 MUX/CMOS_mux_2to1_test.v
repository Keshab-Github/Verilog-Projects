module cmos_mux_2to1_test;
    reg sel, in0, in1;
    wire out;
    integer k;
    cmos_mux_2to1 MUX2to1(out, sel, in0, in1);
    initial
        begin
            for(k=0;k<8;k++)
                begin
                #5 {sel, in0, in1}=k;
                $display("Sel:%b In0:%b, In1:%b, Out:%b", sel, in0, in1, out);
                end
        end
endmodule