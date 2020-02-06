`timescale 1ns / 1ps
module factorial_cu(
    input GO, CLK,  // From outside
    input ERR, GT,  // From DP
    output reg [4:0] ctrl_sig, // To DP
    output reg Done, Error, // To outside
    output reg [2:0] state
    );
    
parameter
    // States
    S0    = 3'b000,
    S1    = 3'b001,
    S2    = 3'b010,
    S3    = 3'b011,
    S4    = 3'b100,
    ERROR = 3'b101,
    
    // DP inputs
    IDLE = 5'b00000,
    LOAD = 5'b11010,
    WAIT = 5'b00100,
    OUT  = 5'b00001,
    MULT = 5'b10100;
    
    reg [2:0] CS = S0;
    reg [2:0] NS;
    
    // State changing
    always@(posedge CLK)
    begin
        CS <= NS;
    end
    
    // Next state logic
    always@(*)
    begin
        case(CS)
            S0: begin
                    if (!GO || ERR) NS = S0;
                    else NS = S1;
                end
            S1: NS = S2;
            S2: begin
                    if (GT) NS = S4;
                    else NS = S3;
                end
            S3: NS = S0;
            S4: NS = S2;
            ERROR: NS = S0;
        endcase
    end
    
    // Output logic
    always@(*)
    begin
        Done = 1'b0;
        Error = 1'b0;
        case(CS)
            S0:    begin ctrl_sig = IDLE; state = CS; end
            S1:    begin ctrl_sig = LOAD; state = CS; end
            S2:    begin ctrl_sig = WAIT; state = CS; end
            S3:    begin ctrl_sig = OUT; Done = 1; state = CS; end
            S4:    begin ctrl_sig = MULT; state = CS; end
            ERROR: begin ctrl_sig = ERR; Error = 1; state = CS; end
        endcase
    end
endmodule
