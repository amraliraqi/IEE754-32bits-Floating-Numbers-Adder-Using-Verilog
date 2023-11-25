module Final (
	input [31:0] NumberA,
	input [31:0] NumberB,
	input A_S,  // zero for add, one for subb
	output [31:0] Result
	);

      wire [31:0] S_ncase;
      wire enable ;
      wire SA_PAA,SB_PAA,C_PAA;
      wire [7:0] Eout_PAA;
      wire [27:0] MAout_PAA;
      wire [27:0] MBout_PAA;
      wire [27:0] S_AST;
      wire CO_AST;
      wire SO_AST;
      wire [22:0] M_ST;
	  wire [7:0] E_ST;
	  wire [31:0] N;

      TOP_ncase TOP_ncase(NumberA, NumberB, enable, S_ncase);
      preadder preadder(NumberA,NumberB,enable,SA_PAA,SB_PAA,C_PAA,Eout_PAA,MAout_PAA,MBout_PAA);
      AdderBlock AdderBlock(SA_PAA, SB_PAA, C_PAA, MAout_PAA, MBout_PAA, A_S, S_AST, CO_AST, SO_AST);
      ST_norm ST_norm(CO_AST, Eout_PAA, S_AST, M_ST, E_ST);
      ST_Vector ST_Vector(S_AST, E_ST, M_ST, N);
      TOP_MUX TOP_MUX(S_ncase,N,enable,Result);

endmodule