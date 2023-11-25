module preadder (
	 input [31:0] NumberA,
     input [31:0] NumberB,
     input enable,
     output SA,
     output SB,
     output C,
     output [7:0] Eout,
     output [27:0] MAout,
     output [27:0] MBout
	);
     
     wire [36:0] A_selector, B_selector;
     wire [1:0] e_data;
     selector selector(NumberA,NumberB,enable,e_data,A_selector,B_selector );

     wire [36:0] A_sub, B_sub, A_nor, B_nor, A_mix, B_mix;
     demux    demux   (A_selector, B_selector,e_data,A_sub, B_sub, A_nor, B_nor, A_mix, B_mix);

     wire SubSA;
     wire SubSB;
     wire CompS;
     wire [7:0] SubE;
     wire [27:0] SubMA;
     wire [27:0] SubMB;
     n_subn n_subn (A_sub,B_sub,SubSA,SubSB,CompS,SubE,SubMA,SubMB);



     wire [36:0] A_mix_aux, B_mix_aux, A_mux, B_mux;
     mux_ns mux_ns(A_nor, B_nor,A_mix_aux, B_mix_aux,e_data,A_mux,B_mux);

     wire NorSA;
     wire NorSB;
     wire CompN;
     wire [7:0] NorE;
     wire [27:0] NorMA;
     wire [27:0] NorMB;

     n_normal n_normal(A_mux, B_mux,NorSA,NorSB,CompN,NorE,NorMA,NorMB);

     Mix_norm Mix_norm(A_mix, B_mix, A_mix_aux, B_mix_aux);

     mux_adder mux_adder(SubSA,SubSB,CompS,SubE,SubMA,SubMB,NorSA,NorSB,CompN,NorE,NorMA,NorMB,e_data,SA,SB,C,Eout,MAout,MBout);


endmodule     



