module mux_adder (
  
  input SubSA,
  input SubSB,
  input CompS,
  input [7:0] SubE,
  input [27:0] SubMA,
  input [27:0] SubMB,

  input NorSA,
  input NorSB,
  input CompN,
  input [7:0] NorE,
  input [27:0] NorMA,
  input [27:0] NorMB,
  
  input [1:0] e_data,
  output SA,
  output SB,
  output C,
  output [7:0] E,
  output [27:0] A,
  output [27:0] B
);

   assign A = (e_data== 2'b01 || e_data == 2'b10 ) ? NorMA :
              e_data== 2'b00                       ? SubMA :
              28'bxx;

   assign B = (e_data== 2'b01 || e_data == 2'b10 ) ? NorMB :
              e_data== 2'b00                       ? SubMB :
              28'bxx; 

   assign C = (e_data== 2'b01 || e_data == 2'b10) ? CompN:
              e_data== 2'b00                       ? CompS :
              1'bx; 

   assign SA= (e_data== 2'b01 || e_data == 2'b10 ) ? NorSA:
              e_data== 2'b00                       ? SubSA :
              1'bx; 

   assign SB= (e_data== 2'b01 || e_data == 2'b10 ) ? NorSB:
              e_data== 2'b00                       ? SubSB :
              1'bx;            

    assign E= (e_data== 2'b01 || e_data == 2'b10) ? NorE:
              e_data== 2'b00                       ? SubE :
              8'bx;                    



endmodule              