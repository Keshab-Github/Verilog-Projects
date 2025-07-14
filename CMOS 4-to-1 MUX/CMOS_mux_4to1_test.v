module cmos_mux_4to1_test;
    reg s0,s1,i0,i1,i2,i3;
    wire out;
    integer k;

    cmos_mux_4to1 MYMUX41(out, s0, s1, i0, i1, i2,i3);
    initial
        begin  
            for(k=0;k<64;k++)
                begin
                    #5 {s0,s1,i0,i1,i2,i3}=k;
                    $display("Sel:%2b, in:%4b, Out:%b", {s0,s1}, {i0,i1,i2,i3}, out);
                end
        end
endmodule