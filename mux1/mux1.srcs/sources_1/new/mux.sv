`timescale 1ns / 1ps


module mux(
    input [7:0] in,
    input [2:0] sel,
    output logic q
    );
    
always_comb
case(sel)
    3'b000: q = in[0];
    3'b001: q = in[1];
    3'b010: q = in[2];
    3'b011: q = in[3];
    3'b100: q = in[4];
    3'b101: q = in[5];
    3'b110: q = in[6];
    3'b111: q = in[7];
endcase

endmodule