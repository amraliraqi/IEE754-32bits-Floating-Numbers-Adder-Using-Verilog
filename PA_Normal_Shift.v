module shift (
  input wire [27:0] data_in,
  input wire [4:0] shift_amount,
  output reg [27:0] data_out
);
integer i;
always @(*) begin
  // Initialize the output data to all zeros
  data_out = 0;

  // Check if the shift amount is greater than or equal to the input data width
  if (shift_amount >= 28) begin
    // Set all output bits to zeros since the entire input data has been shifted out
    data_out = 0;
  end else begin
    // Perform the right shift operation with zero padding
    for (i = 0; i < 28; i = i + 1) begin
      if (i < 28 - shift_amount) begin
        // Pad the remaining bits with zeros from the rightmost side
        data_out[i] = data_in[i + shift_amount];
      end else begin
        // Fill the remaining bits with zeros
        data_out[i] = 0;
      end
    end
  end
end

endmodule
