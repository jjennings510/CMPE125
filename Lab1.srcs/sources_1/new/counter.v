module counter (
    input wire [3:0] din,
    input wire load_cnt, en, clk,
    output reg [3:0] dout
    );
    
    always @(posedge clk)
    begin
        if (load_cnt) assign dout = din;
        if (en) assign dout = dout - 4'b0001;
    end
        
endmodule