//32-bit counter with Asynchronous reset
module sim_counter_2 (clk, rst, count);
    input clk, rst;
    output reg [31:0] count;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            count = 32'b0;
        else
            count = count +1;
    end
endmodule