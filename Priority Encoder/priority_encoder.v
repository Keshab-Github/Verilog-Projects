module priority_encoder(in, code);
    input [7:0] in;
    output reg[2:0] code;
    always @(in)
        begin
            if(in[0]) code = 3'b000; //in[0] i.e. LSB has the highest priority
        else if(in[1]) code = 3'b001;
        else if(in[2]) code = 3'b010;
        else if(in[3]) code = 3'b011;
        else if(in[4]) code = 3'b100;
        else if(in[5]) code = 3'b101;
        else if(in[6]) code = 3'b110;
        else if(in[7]) code = 3'b111;
        else code = 3'bxxx;
        end
endmodule