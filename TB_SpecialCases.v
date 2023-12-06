`timescale 1ns/1ps
module TB_Specialcases();

parameter DELAY=10;
reg [31:0] NumberA;
reg [31:0] NumberB;
reg A_S;  // zero for add, one for subb
wire [31:0] Result;

Final Final(NumberA,NumberB,A_S,Result);
initial
    begin
     
    // Special Case 1:  (0) + (1.417843*10^38) = 1.417843*10^38
    NumberA = 32'b0_00000000_00000000000000000000000;
    NumberB = 32'b0_11111101_10101010101010101010101;
    #DELAY;

    if(Result == 32'b0_11111101_10101010101010101010101 )
            $display("Special Case 1 passed     ,result is 1.417843*10^38 = %b",Result);
    else
            $display("Special Case 1 failed     ,result is 1.417843*10^38 = %b",32'b0_11111101_10101010101010101010101);
             
    /*********************************************************************************************************/
    #DELAY;

    // Special Case 2:  (1.417843*10^38) + (-infinty) = -infinty
    NumberA = 32'b0_11111101_10101010101010101010101;
    NumberB = 32'b1_11111111_00000000000000000000000;
    #DELAY;

    if(Result == 32'b1_11111111_00000000000000000000000 )
            $display("Special Case 2 passed     ,result is -infinty = %b",Result);
    else
            $display("Special Case 2 failed     ,result is -infinty = %b",32'b1_11111111_00000000000000000000000);
             
    /*********************************************************************************************************/
    #DELAY;

    // Special Case 3:  (-infinty) + (-infinty) = -infinty
    NumberA = 32'b1_11111111_00000000000000000000000;
    NumberB = 32'b1_11111111_00000000000000000000000;
    #DELAY;

    if(Result == 32'b1_11111111_00000000000000000000000 )
            $display("Special Case 3 passed     ,result is -infinty = %b",Result);
    else
            $display("Special Case 3 failed     ,result is -infinty = %b",32'b1_11111111_00000000000000000000000);

    /*********************************************************************************************************/
    #DELAY;

    // Special Case 4:  (-infinty) + (+infinty) = NAN
    NumberA = 32'b1_11111111_00000000000000000000000;
    NumberB = 32'b0_11111111_00000000000000000000000;
    #DELAY;

    if(Result == 32'b1_11111111_00000000000000000000001 )
            $display("Special Case 4 passed     ,result is NAN =%b",Result);
    else
            $display("Special Case 4 failed     ,result is NAN =%b",32'b1_11111111_00000000000000000000001);  

    /*********************************************************************************************************/
    #DELAY;

    // Special Case 5:  (-infinty) + (NAN) = NAN
    NumberA = 32'b1_11111111_00000000000000000000000;
    NumberB = 32'b0_11111111_00000000000000000000000;
    #DELAY;

    if(Result == 32'b1_11111111_00000000000000000000001 )
            $display("Special Case 5 passed     ,result is NAN =%b",Result);
    else
            $display("Special Case 5 failed     ,result is NAN =%b",32'b1_11111111_00000000000000000000001);      


    #DELAY;          
              

    $stop;
    end

endmodule
