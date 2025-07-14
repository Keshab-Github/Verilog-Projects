//Active Low NAND SR latch
module sr_latch(Q, Qbar, S, R);
    input S,R;
    output Q, Qbar;

    assign Q = ~(S & Qbar);
    assign Qbar = ~(R & Q);
    
endmodule

//Here, I have used the structural(gate level) description of SR latch (Active Low).