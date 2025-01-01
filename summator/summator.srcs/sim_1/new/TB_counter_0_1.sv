`timescale 1ns / 1ps

module TB_multiplier_with_memory();

    logic [3:0] a;
    logic [3:0] b;
    logic [7:0] result;
    logic rst;

    multiplier_with_memory DUT (
        .a(a), 
        .b(b), 
        .result(result)
    );

    initial begin
        rst = 1;
        #10;
        rst = 0;
        
        a = 4'b0000; b = 4'b0000; #10;
        a = 4'b0001; b = 4'b0001; #10;
        a = 4'b0010; b = 4'b0011; #10;
        a = 4'b0100; b = 4'b0101; #10;
        a = 4'b0110; b = 4'b0111; #10;
        a = 4'b1000; b = 4'b1001; #10;
        a = 4'b1010; b = 4'b1011; #10;
        a = 4'b1100; b = 4'b1101; #10;
        a = 4'b1110; b = 4'b1111; #10;
        a = 4'b1111; b = 4'b1111; #10;

        $finish;
    end

endmodule
