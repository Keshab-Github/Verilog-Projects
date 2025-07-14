module sr_latch_test;
    reg S,R;
    wire Q, Qbar;
    sr_latch LAT(Q, Qbar, S, R);
    initial
        begin
            $display("Active Low NAND SR latch:");
            $display("0 means Active, 1 means Inactive");
            $monitor($time, " S=%b, R=%b, Q=%b, Qbar=%b", S,R, Q, Qbar);
            
            //Active Low NAND SR latch: 0 means Active, 1 means Inactive
               S=1'b0; R=1'b1;     //set
            #5 S=1'b1; R=1'b1;     //memory
            #5 S=1'b1; R=1'b0;     //reset
            #5 S=1'b1; R=1'b1;     //memory
            #5 S=1'b0; R=1'b0;     //invalid output
            #5 S=1'b0; R=1'b1;     //set
            #5 S=1'b1; R=1'b0;     //reset
        end
endmodule