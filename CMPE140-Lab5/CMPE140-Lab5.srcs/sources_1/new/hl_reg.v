`timescale 1ns / 1ps

module hl_reg (
    input wire clk, rst, we,
    input wire [31:0] h_in, l_in,
    output reg [31:0] h_out, l_out
    );
    
    always @ (posedge clk, posedge rst)
    begin
        if (rst) {h_out, l_out} <= 0;
        else if (we) {h_out, l_out} <= {h_in, l_in};
        else {h_out, l_out} <= {h_out, l_out};
    end 
endmodule