module TOP_ncase(
	input [31:0] NumberA, NumberB,
	output enable,
	output [31:0] S
	);

       wire SA, SB;
       wire [7:0] EA, EB;
       wire [22:0] MA, MB;

       assign SA = NumberA[31];
       assign SB = NumberB[31];
       assign EA = NumberA[30:23];
       assign EB = NumberB[30:23];
       assign MA = NumberA[22:0];
       assign MB = NumberB[22:0];

       reg [2:0] OutA, OutB;

       always @(*) begin
       	if (EA == 8'b0 && MA == 23'b0) 
       		OutA <= 3'b000;

       	else if (EA == 8'b0 && MA > 23'b0)
       		OutA <= 3'b001;

       	else if ( (EA > 8'b0 && EA < 8'b11111111) && MA > 23'b0)
       		OutA <= 3'b011;	

       	else if (EA == 8'b11111111 && MA == 23'b0)
       		OutA <= 3'b100;

       	else if (EA == 8'b11111111 && MA > 23'b0)
       		OutA <= 3'b110;					

       end

       always @(*) begin
       	if (EB == 8'b0 && MB == 23'b0) 
       		OutB <= 3'b000;

       	else if (EB == 8'b0 && MB > 23'b0)
       		OutB <= 3'b001;

       	else if ( (EB > 8'b0 && EB < 8'b11111111) && MB > 23'b0)
       		OutB <= 3'b011;	

       	else if (EB == 8'b11111111 && MB == 23'b0)
       		OutB <= 3'b100;

       	else if (EB == 8'b11111111 && MB > 23'b0)
       		OutB <= 3'b110;					

       end

       assign enable = OutA[0] & OutB[0] == 1'b1 ? 1'b1 : 1'b0;

       reg SS;
       reg [7:0] ES;
       reg [22:0] MS;

       always @(*) begin
       	if (OutA == 3'b000) begin
       		SS <= SB;
       		ES <= EB;
       		MS <= MB;   		
       	end
       	else if (OutB == 3'b000) begin
       		SS <= SA;
       		ES <= EA;
       		MS <= MA;   
       	end

       	if (OutA[0] == 1'b0 && OutB == 3'b100) begin
       		SS <= SB;
       		ES <= EB;
       		MS <= MB;   		
       	end
       	else if (OutB[0] == 1'b0 && OutA == 3'b100) begin
       		SS <= SA;
       		ES <= EA;
       		MS <= MA;   
       	end

       	if ( (OutA == 3'b100 && OutB == 3'b100) && SA == SB ) begin
       		SS <= SB;
       		ES <= EB;
       		MS <= MB;   		
       	end
       	else if ((OutA == 3'b100 && OutB == 3'b100) && SA != SB) begin
       		SS <= 1'b1;
       		ES <= 8'b11111111;
       		MS <= 23'b00000000000000000000001;   
       	end

       	if (OutA == 3'b110 || OutB == 3'b110) begin
       		SS <= 1'b1;
       		ES <= 8'b11111111;
       		MS <= 23'b00000000000000000000001;  		
       	end

       	if (OutA[0] == 1'b1 && OutB[0] == 1'b1) begin
       		SS <= 1'bx;
       		ES <= 8'bx;
       		MS <= 23'bx;  		
       	end
       end

       assign S[31] = SS;
       assign S[30:23] = ES;
       assign S[22:0] = MS;



endmodule       