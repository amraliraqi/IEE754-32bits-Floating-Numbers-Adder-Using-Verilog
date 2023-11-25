module ST_Vector(
	input S,
	input [7:0] E,
	input [22:0] M,
	output [31:0] N
	);
       assign N[31] = S;
       assign N[30:23] = E;
       assign N[22:0] = M;
endmodule       

