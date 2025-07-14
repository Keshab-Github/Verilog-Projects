// Up-down counter (synchronous clear)
module counter (mode, clr, ld, d_in, clk, count);
    input mode, clr, ld, clk;
    input [7:0] d_in;
    output reg [7:0] count;

    always @(posedge clk)
        begin
        if (ld) count<=d_in;
        else if(clr) count<=0;
        else if(mode) count<= count+1;
        else count<= count-1;
        end
endmodule

// mode =1, Up counter
// mode =0, Down counter