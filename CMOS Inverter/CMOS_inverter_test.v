module cmosnot_test;
    reg x;
    wire f;
    integer k;
    cmosnot MYNOT(x,f);
    initial
        begin
            for(k=0;k<2;k++)
                begin
                    #5 x=k;
                    $display("X=%b Out=%b",x,f);
                end
        end
endmodule