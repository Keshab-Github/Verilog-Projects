// Gated SR latch (made using Active Low NAND latch)
module gated_sr_latch(Q, Qbar, S, R, En);
    input S, R, En;
    output Q, Qbar;
    wire X, Y;

    assign Q = ~(X & Qbar);
    assign Qbar = ~(Y & Q);
    assign X = ~(S & En);
    assign Y = ~(R & En);

endmodule 