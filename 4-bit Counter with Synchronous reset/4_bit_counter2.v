//4-bit counter with synchronous reset
module counter2(clk, rst, count);
    input clk,rst;
    output reg [3:0] count;
    always @(posedge clk)
    begin
        if(rst)
            count<=0;
        else
            count<= count+1;
    end
endmodule