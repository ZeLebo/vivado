`timescale 1ns / 1ps

module TB_coder();
    logic [15:0] in;
    logic [3:0] code;
    coder DUT (
        .in(in),
        .code(code)
    );

    initial begin
        in = 16'b0000_0000_0000_0001; #10;
        in = 16'b0000_0000_0000_0010; #10;
        in = 16'b0000_0000_0001_0000; #10;
        in = 16'b1000_0000_0000_0000; #10;
       
        in = 16'b0000_0000_0000_0000; #10;
        in = 16'b0000_0000_0011_0000; #10;
        in = 16'b1100_0000_0000_0000; #10;
        
    $finish;
    end
endmodule
