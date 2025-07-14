module gated_sr_latch_test;
    reg S,R,En;
    wire Q, Qbar;
    gated_sr_latch LAT(Q, Qbar, S, R, En);
    initial
        begin
            $monitor($time, " En=%b, S=%b, R=%b, Q=%b, Qbar=%b", En, S, R, Q, Qbar);
            En=1'b0; S=1'b0; R=1'b1;     //Enable is 0(low)
            #5 En=1'b0; S=1'b1; R=1'b0;
            #5 En=1'b0; S=1'b0; R=1'b0;
            #5 En=1'b0; S=1'b1; R=1'b1;

            #5 En=1'b1; S=1'b0; R=1'b1;     //reset //Enable is 1(High) at t=20 sec
            #5 S=1'b0; R=1'b0;              //memory
            #5 S=1'b1; R=1'b0;              //set
            #5 S=1'b0; R=1'b0;              //memory
            #5 S=1'b1; R=1'b1;              //invalid output
            #5 S=1'b1; R=1'b0;              //set
            #5 S=1'b0; R=1'b1;              //reset
        end
endmodule