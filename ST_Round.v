module ST_round(
	input  [27:0] Min,
	output [22:0] Mout
	);

       reg [22:0] M_aux;
       always @(Min) begin
       	if (Min[3:0] >= 4'b1000) 
       		M_aux <= Min[26:4] + 1'b1;
       	else
       		M_aux <= Min[26:4];
       end

       assign Mout = M_aux;
endmodule
       