module selector (
    input [31:0] NumberA,
    input [31:0] NumberB,
    input enable,
    output [1:0] e_data,
    output reg [36:0] NA,
    output reg [36:0]  NB
);

wire [7:0] EA, EB;
wire [22:0] MA, MB;
wire SA, SB;


    assign SA = NumberA[31];
    assign SB = NumberB[31];
    assign EA = NumberA[30:23];
    assign EB = NumberB[30:23];
    assign MA = NumberA[22:0];
    assign MB = NumberB[22:0];


always @(*) begin
   
    if (enable) begin
        NA[36] = SA;
        NA[35:28] = EA;
        NB[36] = SB;
        NB[35:28] = EB;

        if (EA > 8'h00) begin
            NA[27] = 1;
            NA[26:4] = MA;
            NA[3:0] = 4'h0;
        end else if (EA == 8'h00) begin
            NA[27] = 0;
            NA[26:4] = MA;
            NA[3:0] = 4'h0;
        end else begin
            NA = 37'hxx;
        end

        if (EB > 8'h00) begin
            NB[27] = 1;
            NB[26:4] = MB;
            NB[3:0] = 4'h0;
        end else if (EB == 8'h00) begin
            NB[27] = 0;
            NB[26:4] = MB;
            NB[3:0] = 4'h0;
        end else begin
            NB = 37'hxx;
        end
    end else begin
        NA = 37'hxx;
        NB = 37'hxx;
    end
end

assign e_data = (EA == 8'h00 && EB == 8'h00 && enable) ? 2'b00 :
                (EA > 8'h00 && EB > 8'h00 && enable) ? 2'b01 :
                ((EA == 8'h00 || EB == 8'h00) && enable) ? 2'b10 :
               2'bxx;

endmodule
