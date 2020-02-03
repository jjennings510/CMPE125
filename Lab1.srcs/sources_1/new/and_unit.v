module and_unit(
    input [3:0] a,
    input b,
    output reg [3:0] Y
    );
    
    integer i;
    
    always @(*)
        for (i = 0; i < 4; i = i + 1)
            Y[i] = a[i] & b;
endmodule