`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 01:30:17 PM
// Design Name: 
// Module Name: factorial_top_tb
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

// Run for 20us to get a good view.
module factoral_top_tb;
    reg go_tb, clk_tb;
    reg [3:0] n_tb;
    wire Done_tb, Error_tb;
    wire [31:0] out_tb;
    wire [2:0] cs_tb;
    reg [31:0] out_exp;
    
    factorial_top DUT (
        .N (n_tb),
        .GO (go_tb), 
        .CLK (clk_tb),
        .Done (Done_tb), 
        .Error (Error_tb), 
        .Output (out_tb),
        .CS (cs_tb)
    );
    
    integer i, error_count, expected_tb;
    
    task tick;
    begin
        clk_tb <= 1'b0;
        #50;
        clk_tb <= 1'b1;
        #50;
    end
    endtask
    
    initial begin
        clk_tb = 0;
        n_tb = 0;
        tick;
        error_count = 0;
        
        for (i = 0; i < 14; i = i + 1)
        begin
            n_tb = i;
            go_tb = 1;
            clk_tb = 0;
            tick;
            
            //Cycle until Done or Error flag is set
            while(!(Done_tb || Error_tb))
            begin
                tick;
            end
            
            expected_tb = i;
            out_exp = 1;
            while(expected_tb > 1)
            begin
                out_exp = out_exp * expected_tb;
                expected_tb = expected_tb - 1;
            end
            
            if(Done_tb)
            begin
                if(out_tb != out_exp) error_count = error_count + 1;
            end
        end
        
        // after cycling to 13, check if error flag clears when input goes back to valid
        n_tb = 3;
        go_tb = 1;
        clk_tb = 0;
        tick;
        
        // tick until we're done or error
        while(!(Done_tb || Error_tb))
        begin
            tick;
        end
        
        expected_tb = 3;
        out_exp = 1;
        while(expected_tb > 1)
        begin
            out_exp = out_exp * expected_tb;
            expected_tb = expected_tb - 1;
        end
        
        if(Done_tb)
        begin
            if(out_tb != out_exp) error_count = error_count + 1;
        end
    end
endmodule