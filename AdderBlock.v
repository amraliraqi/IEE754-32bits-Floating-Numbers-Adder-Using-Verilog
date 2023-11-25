module AdderBlock(
	 input SA,
     input SB,
     input C,
     input [27:0] MA,
     input [27:0] MB,
     input A_S,
     output [27:0] S,
     output CO,
     output SO
	);
        wire [27:0] Aa_aux,Bb_aux,S_aux;
        wire AS_aux,SO_aux,CO_aux;
        SignOut SignOut(SA,SB,C,MA,MB,A_S,Aa_aux,Bb_aux,AS_aux,SO_aux);
        Adder Adder(Aa_aux,Bb_aux,AS_aux,S_aux,CO_aux);

        //assign S = AS_aux & SO_aux == 1'b1 ? (S_aux ^ 7'hFFFFFFF) + 1'b1 : S_aux ;
        assign CO = SB ^ A_S != SA ? 1'b0 : CO_aux;
        assign SO = SO_aux;
        assign S=S_aux;

endmodule        
