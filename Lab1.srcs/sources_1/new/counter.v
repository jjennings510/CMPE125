module counter (
    input wire [3:0] din,
    input wire load_cnt, en, clk,
    output reg [3:0] dout
    );
    
    always @(posedge clk)
    begin
        if(en)
        begin
            if(load_cnt) dout <= din;
            else dout <= dout - 1'b1;
        end
    end
        
endmodule