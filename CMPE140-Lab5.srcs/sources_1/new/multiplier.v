`timescale 1ns / 1ps

module multiplier(
    input wire [31:0] a, b,
    output reg [63:0] out
    );
    
    always @ (a, b) begin
        out <= a * b;
    end
endmodule