module mux_ns (
    input [36:0] NorA,
    input [36:0] NorB,
    input [36:0] MixA,
    input [36:0] MixB,
    input [1:0] e_data,
    output reg  [36:0] NA,
    output reg [36:0] NB
);

always @(*) begin
    if (e_data == 2'b01) begin
        NA <= NorA;
        NB <= NorB;    
    end
    else if (e_data == 2'b10) begin
        NA <= MixA;
        NB <= MixB; 
    end
    else begin
        NA <= 37'bxx;
        NB <= 37'bxx;
    end      
end

endmodule