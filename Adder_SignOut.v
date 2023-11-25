module SignOut(
	 input SA,
     input SB,
     input C,
     input [27:0] MA,
     input [27:0] MB,
     input A_S,
     output reg [27:0] Aa,
     output reg [27:0] Bb,
     output AS,
     output SO
	);
         
         wire SB_aux;
         assign  SB_aux = SB ^ A_S;
         assign SO = SA ;
         assign AS = SA != SB_aux ? 1'b1 : 1'b0 ;
         always @(*) begin
         	if (SA ^ SB_aux == 1'b0) begin
         		Aa <= MA;
         		Bb <= MB;
         	end
         	else if ((SA==1'b1) && (SB_aux==1'b0)) begin
         		Aa <= MB;
         		Bb <= MA;
         	end
         	else if ((SA==1'b0) && (SB_aux==1'b1)) begin
         		Aa <= MA;
         		Bb <= MB;
         	end
         	else begin
         		Aa <= 28'bx;
         		Bb <= 28'bx;
         	end
         end
endmodule