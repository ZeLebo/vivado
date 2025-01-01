`timescale 1ns / 1ps


module mux42(
    input [3:0] in,
    input [1:0] sel,
    output logic q
    );
    
always_comb
case(sel)
    2'b00: q = in[0];
    2'b01: q = in[1];
    2'b10: q = in[2];
    2'b11: q = in[3];
endcase

endmodule


