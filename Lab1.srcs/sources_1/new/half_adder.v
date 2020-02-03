module half_adder(
    input [3:0] a, b,
    output reg [3:0] s, c
    );
    
    always@(*)
    begin
        s[0] = a[0] ^ b[0];
        c[0] = a[0] & b[0];
        
        s[1] = a[1] ^ b[1];
        c[1] = a[1] & b[1];
        
        s[2] = a[2] ^ b[2];
        c[2] = a[2] & b[2];
        
        s[3] = a[3] ^ b[3];
        c[3] = a[3] & b[3];
    end
endmodule