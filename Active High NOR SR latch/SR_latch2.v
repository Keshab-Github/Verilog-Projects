//Active High NOR SR latch
module sr_latch2(Q, Qbar, S, R);
    input S,R;
    output Q, Qbar;

    assign Q = ~(R | Qbar);
    assign Qbar = ~(S | Q);
endmodule

//Here, I have used the structural(gate level) description of SR latch (Active High).