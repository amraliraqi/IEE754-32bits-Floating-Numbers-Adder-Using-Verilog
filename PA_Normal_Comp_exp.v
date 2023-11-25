module comp_exp ( 
    input [36:0] NumberA,
    input [36:0] NumberB,
    output Comp,
    output SA,
    output SB,
    output [7:0] Emax,
    output [27:0] Mmax,
    output [27:0] Mshift,
    output reg [4:0] Dexp

);
      wire [27:0] MA ;
      wire [27:0] MB ;
      wire [7:0] EA, EB, diff;
      reg C;

      assign SA = NumberA[36];
      assign SB = NumberB[36];
      assign MA = NumberA[27:0];
      assign MB = NumberB[27:0];
      assign EA = NumberA[35:28];
      assign EB = NumberB[35:28];

      always @(*) begin
          if ((EA>EB) || MB[0] == 1'b1)
              C = 1'b1;
          else if (EA<EB)
              C = 1'b0;
          else if (MA >= MB)
              C = 1'b1;    
          else if (MA < MB)
              C = 1'b0;
          else
              C = 1'bx;        
      end

      assign Comp = C;
      assign Emax = C==1'b1 ? EA:
                    C==1'b0 ? EB:
                    8'bxx;

      assign diff = ( C==1'b1 && MB[0] == 1'b0) ? EA-EB :
                    C==1'b0                    ? EB-EA :
                    ( C==1'b1 && MB[0] == 1'b1) ? EA+EB :
                    8'bxx;

      always @(diff) begin
      	if (diff <= 8'h1B)
      		Dexp <= diff[4:0];
      	else if (diff > 8'h1B)
      		Dexp <= 5'b11100;
      	else
      		Dexp <= 5'bxxxxx;
      end

      assign Mshift= C==1'b1 ? MB :
                     C==1'b0 ? MA :
                     28'bxx;

      assign Mmax =  C==1'b1 ? MA :
                     C==1'b0 ? MB :
                     28'bxx;
endmodule                                    