module Adder (
  input [27:0] A,
  input [27:0] B,
  input subtract,
  output [27:0] S,
  output C_out
);

  wire [27:0] B_neg;
  wire [27:0] B_sub;
  wire [28:0] sum_temp;



  // Two's complement of B when subtract is 1
  assign B_neg = (subtract) ? ~B + 1'b1 : B;

  // Select input based on subtract
  assign B_sub = (subtract) ? B_neg : B;

  // 28-bit adder
  assign sum_temp = A + B_sub;
  

  // Output sum and carry out
  assign S = (A>B) && subtract ? sum_temp[27:0] :
             (A<B) && subtract ? ~sum_temp[27:0]+ 1'b1 :
             sum_temp[27:0];
  assign C_out =  sum_temp[28];
                


endmodule
