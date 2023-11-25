module n_normal (
	input [36:0] NumberA,
    input [36:0] NumberB,
    output SA,
    output SB,
    output Comp,
    output [7:0] EO,
    output [27:0] MA,
    output [27:0] MB
    );

       wire [27:0] Mshft_aux;
       wire [4:0] Dexp_aux;
       comp_exp comp_exp(NumberA,NumberB,Comp,SA,SB,EO,MA,Mshft_aux,Dexp_aux);
       shift    shift (Mshft_aux,Dexp_aux, MB);
       endmodule