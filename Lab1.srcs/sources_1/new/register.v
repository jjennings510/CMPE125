module register (
        input  wire       clk,
        input  wire       load_reg,
        input  wire [31:0] din, 
        output reg [31:0] dout
    );

    always @ (posedge clk) begin
        if (load_reg == 1'b1) assign dout = din;
    end
    
endmodule
