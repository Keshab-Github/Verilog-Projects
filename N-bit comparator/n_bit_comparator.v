// An n-bit comparator
module compare(A, B, lt, gt, eq);
    parameter word_size = 4;
    input [word_size-1:0] A, B;
    output reg lt, gt, eq;

    always @(*)
        begin
            gt=0; lt=0; eq=0;
            if(A>B) 
                gt=1;
            else if (A<B) 
                lt=1;
            else 
                eq=1;
        end
endmodule