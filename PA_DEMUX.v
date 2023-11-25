module demux (
    input [36:0] NumberA,
    input [36:0] NumberB,
    input [1:0] e_data,
    output reg [36:0] NAO,
    output reg [36:0] NBO,
    output reg [36:0] NA1,
    output reg [36:0] NB1,
    output reg [36:0] NA2,
    output reg [36:0] NB2
);

always @(*)
begin
    case (e_data)
        2'b00: begin
            NAO <= NumberA;
            NBO <= NumberB;
            NA1 <= 37'bxx;
            NB1 <= 37'bxx;
            NA2 <= 37'bxx;
            NB2 <= 37'bxx;
        end

        2'b01: begin
            NAO <= 37'bxx;
            NBO <= 37'bxx;
            NA1 <= NumberA;
            NB1 <= NumberB;
            NA2 <= 37'bxx;
            NB2 <= 37'bxx;
        end

        2'b10: begin
            NAO <= 37'bxx;
            NBO <= 37'bxx;
            NA1 <= 37'bxx;
            NB1 <= 37'bxx;
            NA2 <= NumberA;
            NB2 <= NumberB;
        end

        default: begin
            NAO <= 37'bxx;
            NBO <= 37'bxx;
            NA1 <= 37'bxx;
            NB1 <= 37'bxx;
            NA2 <= 37'bxx;
            NB2 <= 37'bxx;
        end
    endcase
end

endmodule
