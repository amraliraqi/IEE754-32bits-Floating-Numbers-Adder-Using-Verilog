module zero (
  input [27:0] T,
  output [4:0] Zcount
);

  reg [27:0] Zero_vector;
  reg [7:0] aux;

  assign Zero_vector = 28'b0000000;

  always @(*) begin
    if (T == Zero_vector)          aux = 8'h1c;
    else if (T[27:1] == Zero_vector) aux = 8'h1b;
    else if (T[27:2] == Zero_vector) aux = 8'h1a;
    else if (T[27:3] == Zero_vector) aux = 8'h19;
    else if (T[27:4] == Zero_vector) aux = 8'h18;
    else if (T[27:5] == Zero_vector) aux = 8'h17;
    else if (T[27:6] == Zero_vector) aux = 8'h16;
    else if (T[27:7] == Zero_vector) aux = 8'h15;
    else if (T[27:8] == Zero_vector) aux = 8'h14;
    else if (T[27:9] == Zero_vector) aux = 8'h13;
    else if (T[27:10] == Zero_vector) aux = 8'h12;
    else if (T[27:11] == Zero_vector) aux = 8'h11;
    else if (T[27:12] == Zero_vector) aux = 8'h10;
    else if (T[27:13] == Zero_vector) aux = 8'h0f;
    else if (T[27:14] == Zero_vector) aux = 8'h0e;
    else if (T[27:15] == Zero_vector) aux = 8'h0d;
    else if (T[27:16] == Zero_vector) aux = 8'h0c;
    else if (T[27:17] == Zero_vector) aux = 8'h0b;
    else if (T[27:18] == Zero_vector) aux = 8'h0a;
    else if (T[27:19] == Zero_vector) aux = 8'h09;
    else if (T[27:20] == Zero_vector) aux = 8'h08;
    else if (T[27:21] == Zero_vector) aux = 8'h07;
    else if (T[27:22] == Zero_vector) aux = 8'h06;
    else if (T[27:23] == Zero_vector) aux = 8'h05;
    else if (T[27:24] == Zero_vector) aux = 8'h04;
    else if (T[27:25] == Zero_vector) aux = 8'h03;
    else if (T[27:26] == Zero_vector) aux = 8'h02;
    else if (T[27:27] == Zero_vector) aux = 8'h01;
    else                             aux = 8'h00;
  end

  assign Zcount = aux[4:0];

endmodule
