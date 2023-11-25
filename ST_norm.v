module ST_norm (
	input CO,
	input [7:0] ES,
	input [27:0] MS,
	output [22:0] M,
	output reg [7:0] E
	);
      wire [4:0] Zcount_aux; 
      reg [4:0] Shift;
      wire [27:0] Number;

      zero  zero(MS,Zcount_aux); 
      shiftLef shiftLef(MS, Shift,Number);
      ST_round ST_round(Number,M);
      always @(*) begin
      	if (ES > Zcount_aux) begin
      		Shift <= Zcount_aux;
      		E <= ES-Shift+CO;
      	end	
      	else if (ES < Zcount_aux) begin
      		Shift <= ES[4:0];
      		E <= 2'h00;
      	end
      	else if (ES == Zcount_aux) begin
      		Shift <= Zcount_aux;
      		E <= 2'h01;
      	end
      	else  begin
      		Shift <= 5'bxxxxx;
      		E <= 2'hxx;
      	end
      end
endmodule