module xor_unit(
    input [3:0] C, P,
    input C0,
    output reg [3:0] sum,
    output reg c_out
    );
    
    always@(*)
    begin
        sum[0] = C0 ^ P[0];
        sum[1] = C[0] ^ P[1];
        sum[2] = C[1] ^ P[2];
        sum[3] = C[2] ^ P[3];
        
        c_out = C[3];
    end
endmodule