module multiplier(
    input [31:0] A, b,
    output reg [31:0] p
    );
    always @ (A or b)
        begin
            p <= A * b;
        end
endmodule
