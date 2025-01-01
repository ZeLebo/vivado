`timescale 1ns / 1ps

module coder(
    input [3:0] in,
    output logic [1:0] code
    );

    always_comb
    case (in)
    4'b0001: code = 2'b00;
    4'b0010: code = 2'b01;
    4'b0100: code = 2'b10;
    4'b1000: code = 2'b11;
    endcase;
    
endmodule
