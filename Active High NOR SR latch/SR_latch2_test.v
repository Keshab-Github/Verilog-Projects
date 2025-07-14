module sr_latch2_test;
    reg S,R;
    wire Q, Qbar;
    sr_latch2 LAT(Q, Qbar, S, R);
    initial
        begin
            $display("Active High NOR SR latch:");
            $display("1 means Active, 0 means Inactive");
            $monitor($time, " S=%b, R=%b, Q=%b, Qbar=%b", S,R, Q, Qbar);
            
            //Active High NOR SR latch: 1 means Active, 0 means Inactive
               S=1'b0; R=1'b1;     //reset
            #5 S=1'b0; R=1'b0;     //memory
            #5 S=1'b1; R=1'b0;     //set
            #5 S=1'b0; R=1'b0;     //memory
            #5 S=1'b1; R=1'b1;     //invalid output
            #5 S=1'b0; R=1'b1;     //reset
            #5 S=1'b1; R=1'b0;     //set
        end
endmodule