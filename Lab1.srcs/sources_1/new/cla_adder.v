module cla_adder(
    input [3:0] a, b,
    input C0,
    output [3:0] sum,
    output c_out 
    );
    
    wire [3:0] P, G, C;
    
    half_adder HA (
        .a(a),
        .b(b),
        .s(P),
        .c(G)
        );
        
    cla_generator CLA (
        .P(P),
        .G(G),
        .C0(C0),
        .C(C)
        );
        
    xor_unit X (
        .C(C),
        .P(P),
        .C0(C0),
        .sum(sum),
        .c_out(c_out)
        );
endmodule
