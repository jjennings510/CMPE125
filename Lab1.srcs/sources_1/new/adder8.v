 module adder8(
   input [7:0] A,B,
   input c_in,
   output  [7:0] sum,
   output  c_out
   );
   //use 2 CLA adders to make the 8 bit adder
   
   //use this to use carry out of the bottom
   //as the carry in for the top 
   wire carry_bottom;
   
   cla_adder bottom(
       .a  (A[3:0]),
       .b  (B[3:0]),
       .C0 (c_in),
       .sum    (sum[3:0]),
       .c_out  (carry_bottom)
       
   );
   cla_adder top(
       .a  (A[7:4]),
       .b  (B[7:4]),
       .C0 (carry_bottom),
       .sum    (sum[7:4]),
       .c_out  (c_cout)
   
);
endmodule
