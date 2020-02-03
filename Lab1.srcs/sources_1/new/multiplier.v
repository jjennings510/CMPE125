module multiplier(
    input [3:0] A, b,
    output [7:0] p
    );
    
    wire [3:0] PP0, PP1, PP2, PP3;
    wire [7:0] PP4, PP5;
    wire c_out;
    
    and_unit AND0 (
        .a(A),
        .b(b[0]),
        .Y(PP0)
        );
    and_unit AND1 (
        .a(A),
        .b(b[1]),
        .Y(PP1)
        );
    and_unit AND2 (
        .a(A),
        .b(b[2]),
        .Y(PP2)
        );
    and_unit AND3 (
        .a(A),
        .b(b[3]),
        .Y(PP3)
        );
    
    adder8 ADD0 (
        .A ({4'b0000, PP0}),
        .B ({3'b000, PP1, 1'b0}),
        .c_in (1'b0),
        .sum (PP4),
        .c_out (c_out)
        );
    adder8 ADD1 (
        .A ({2'b00, PP2, 2'b00}),
        .B ({1'b0, PP3, 3'b000}),
        .c_in (1'b0),
        .sum (PP5),
        .c_out (c_out)
        );
    adder8 ADD2 (
        .A (PP4),
        .B (PP5),
        .c_in (1'b0),
        .sum (p),
        .c_out (c_out)
        );
        
endmodule
