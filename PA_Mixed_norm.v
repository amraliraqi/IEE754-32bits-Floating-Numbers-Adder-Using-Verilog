module Mix_norm(
	input [36:0] NumberA,
    input [36:0] NumberB,
    output  [36:0] MA,
    output reg [36:0] MB
	);
       wire [4:0] Zcount_aux;
       reg [7:0] EB;
       wire [36:0] NumberB_aux;
       wire [27:0] MB_aux;

       comp comp(NumberA,NumberB,MA,NumberB_aux);
       zero zero(NumberB_aux[27:0],Zcount_aux);
       shiftLef shiftLef(NumberB_aux[27:0],Zcount_aux,MB_aux);

       always @(*) begin
       	if (Zcount_aux != 5'b00000) begin
       		EB <= {3'b000,Zcount_aux};
       		MB[27:0] <= {MB_aux[27:1],1'b1};		
       	end
       	else begin
       		EB <= NumberB_aux[35:28];
       		MB[27:0] <= MB_aux;
       	end
       	MB[35:28] <= EB;
       	MB[36]  <= NumberB_aux[36];
       end

       endmodule