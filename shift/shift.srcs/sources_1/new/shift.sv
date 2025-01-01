`timescale 1ns / 1ps

module shift(
    input [3:0] in,
    input [1:0] shift,
    output logic [3:0] q
    );

//assign q = (in << shift) | (in >> (4-shift));

//2'b01: q = in[3] | in[0]<<1 | in[1]<<2 | in[2]<<3;
//2'b10: q = in[2] | in[3]<<1 | in[0]<<2 | in[1]<<3;
//2'b11: q = in[1] | in[2]<<1 | in[3]<<2 | in[0]<<3;

always_comb
    case(shift)
        2'b00: q = in;      
        2'b01: q = {in[2], in[1], in[0], in[3]};
        2'b10: q = {in[1], in[0], in[3], in[2]};
        2'b11: q = {in[0], in[3], in[2], in[1]};
    endcase;

endmodule
    