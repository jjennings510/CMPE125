`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 01:14:48 PM
// Design Name: 
// Module Name: factorial_top
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


module factorial_top(
        input GO, CLK,
        input [3:0] N,
        output Done, Error,
        output [31:0] Output,
        output [2:0] CS
    );
    
    wire [4:0] ctrl_sig;
    wire ERR, GT;
    
    factorial_dp DP (
        .n(N),
        .clk(CLK),
        .ctrl_sig(ctrl_sig),
        .out(Output),
        .ERR(ERR),
        .GT(GT)
    );
    
    factorial_cu CU (
        .GO(GO),
        .CLK(CLK),
        .ERR(ERR),
        .GT(GT),
        .ctrl_sig(ctrl_sig),
        .Done(Done),
        .Error(Error),
        .state(CS)
    );
    
    
endmodule
