module ST_normVector (
	input SS,
	input CO,
	input [7:0] ES,
	input [27:0] MS,
	output [31:0] N
	);
       
       wire [7:0] E_aux;
	   wire [22:0] M_aux;
	   ST_norm ST_norm (
	         CO,
	         ES,
	         MS,
	         M_aux,
	         E_aux
	    );

	   ST_Vector ST_Vector(
	           SS,
	           ES,
	           MS,
	           N
	    );

endmodule
