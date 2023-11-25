module comp(
	input [36:0] NumberA,
    input [36:0] NumberB,
    output reg [36:0] NA,
    output reg [36:0] NB
	);


      wire [7:0] EA, EB;
      assign EA =NumberA[35:28] ;
      assign EB =NumberB[35:28] ;
      always @(*) begin
      	if (EA==8'b00) begin
      		NA <= NumberB;
      		NB <= NumberA;
      	end
      	else if (EB==8'b00) begin
      		NA <= NumberA;
      		NB <= NumberB;
      	end
      	else begin
      		NA <= 37'hxx;
      		NB <= 37'hxx;
      	end
      end

endmodule      
