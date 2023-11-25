module n_subn ( 
    input [36:0] NumberA,
    input [36:0] NumberB,
    output SA,
    output SB,
    output Comp,
    output [7:0] EO,
    output [27:0] MA,
    output [27:0] MB
);
      wire [27:0] MAa ;
      wire [27:0] MBb ;
      wire C;

      assign SA = NumberA[36];
      assign SB = NumberB[36];
      assign MAa = NumberA[27:0];
      assign MBb = NumberB[27:0];
      assign C= MAa >= MBb ? 1'b1:
                MBb >  MAa ? 1'b0:
                1'bx;
      assign Comp = C ;
      assign EO = NumberA[35:28];
      assign MA= C==1 ? MAa:
                 C==0 ? MBb:
                 1'bx;
      assign MB= C==1 ? MBb:
                 C==0 ? MAa:
                 1'bx; 
endmodule                           
