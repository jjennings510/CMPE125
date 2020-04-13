`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 12:25:04 PM
// Design Name: 
// Module Name: factorial_dp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module factorial_dp(
    input [3:0] n,
    input clk,
    input [4:0] ctrl_sig,
    output [31:0] out,
    output ERR, GT
    );
        
    wire [3:0]   cnt_out;
    wire [31:0]  mux_out;
    wire [31:0]  reg_out;
    wire [31:0]  mul_out;
    
    counter CNTR (.din(n), .dout(cnt_out), .load_cnt(ctrl_sig[3]), .en(ctrl_sig[2]), .clk(clk));
    
    comparator CMP_GT (.a(cnt_out), .b(4'b1), .gt(GT));
    comparator CMP_ERR (.a(n), .b(4'b1100), .gt(ERR)); // > 12 ? ERR
    
    multiplier MUL (.A({28'b0, cnt_out}), .b(reg_out), .p(mul_out));
    
    mux2 #(32) MUX (.sel(ctrl_sig[1]), .in0(mul_out), .in1(32'b1), .out(mux_out));
    mux2 #(32) OUT_BUFF (.sel(ctrl_sig[0]), .in0(32'b0), .in1(reg_out), .out(out));

    register REG (.clk(clk), .load_reg(ctrl_sig[4]), .din(mux_out), .dout(reg_out));
endmodule
