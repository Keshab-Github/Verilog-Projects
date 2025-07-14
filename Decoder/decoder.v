module generate_decoder(out, in, select);
    input in;
    input [1:0] select;
    output [3:0] out;
    
    assign out[select] = in;
    
endmodule