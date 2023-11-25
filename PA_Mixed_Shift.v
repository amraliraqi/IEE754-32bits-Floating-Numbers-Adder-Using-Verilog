module shiftLef (
    input wire [27:0] data_in,
    input wire [4:0] shift_amount,
    output wire [27:0] data_out
);

reg [27:0] temp_data;
integer i; 

always @(*) begin
    temp_data = data_in;
    if (shift_amount > 0) begin
        for (i = 0; i < shift_amount; i = i + 1) begin
            temp_data = temp_data << 1;
        end
    end
end

assign data_out = temp_data;

endmodule
