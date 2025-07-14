//32-bit counter with Synchronous reset
module sim_counter (clk, rst, count);
    input clk, rst;
    output reg [31:0] count;
    always @(posedge clk)
    begin
        if(rst)
            count = 32'b0;
        else
            count = count +1;
    end
endmodule