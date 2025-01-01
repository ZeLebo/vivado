`timescale 1ns / 1ps

module coder_test();
    logic [3:0] in;
    logic [1:0] code;
    
    coder DUT(.in(in), .code(code));
    
    initial begin
    in = 4'b0001; #10
    repeat (3) begin
        in = in << 1; #10;
    end
    $finish;
    end
endmodule
