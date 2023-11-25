module TOP_MUX(
	input [31:0] N1, N2,
	input Select,
	output [31:0] Result
	);

      assign Result = Select ? N2 : N1;
endmodule      
