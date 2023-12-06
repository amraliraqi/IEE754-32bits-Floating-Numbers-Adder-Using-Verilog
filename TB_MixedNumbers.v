`timescale 1ns/1ps
module TB_MixedNumbers();

parameter DELAY=10;
reg [31:0] NumberA;
reg [31:0] NumberB;
reg A_S;  // zero for add, one for subb
wire [31:0] Result;

Final Final(NumberA,NumberB,A_S,Result);
initial
    begin
     
    // Mixed Case 1: 
    NumberA = 32'b0_00000100_1010_1010_1010_1010_1010_001;
    NumberB = 32'b0_00000000_1010_1010_1010_1010_1010_101;
    A_S = 1'b0;
    #DELAY;

    if(Result == 32'b0_00000100_1011_0101_0101_0101_0100_110 )
            $display("Mixed Case 1 passed     ,result is  %b",Result);
    else
            $display("Mixed Case 1 failed     ,result is %b",32'b0_00000000_1010_1010_1010_1010_1010_101);
             
    /*********************************************************************************************************/
    #DELAY;

    // Mixed Case 2:  
    NumberA = 32'b1_00001000_1010_1010_1010_1010_1010_101;
    NumberB = 32'b0_00000000_1010_1010_1010_1010_1010_101;
    A_S = 1'b1;
    #DELAY;

    if(Result == 32'b1_00001000_1010_1011_0101_0101_0101_010 )
            $display("Mixed Case 2 passed     ,result is %b",Result);
    else
            $display("Mixed Case 2 failed     ,result is %b",32'b1_00001000_1010_1011_0101_0101_0101_010);
             
    /*********************************************************************************************************/
    #DELAY;

    // Mixed Case 3: 
     NumberA = 32'b0_00001010_0101_0100_1010_1011_0101_010;
     NumberB = 32'b1_00000000_1111_1111_1111_1111_1111_111;
     A_S = 1'b1;
    #DELAY;

    if(Result == 32'b0_00001010_0101_0100_1110_1011_0101_010  )
            $display("Mixed Case 3 passed     ,result is  %b",Result);
    else
            $display("Mixed Case 3 failed     ,result is  %b",32'b0_00001010_0101_0100_1110_1011_0101_010);

    /*********************************************************************************************************/
    #DELAY;

    // Mixed Case 4: 
     NumberA = 32'b1_00000000_1010_1010_1010_1010_1010_101;
     NumberB = 32'b1_00000101_0011_1011_1011_1011_1011_101;
     A_S = 1'b1;
    #DELAY;

    if(Result == 32'b1_00000101_0011_0110_0110_0110_0110_010 )
            $display("Mixed Case 4 passed     ,result is  =%b",Result);
    else
            $display("Mixed Case 4 failed     ,result is %b",32'b1_00000101_0011_0110_0110_0110_0110_010);  

    /*********************************************************************************************************/
    #DELAY;
          

    $stop;
    end

endmodule



