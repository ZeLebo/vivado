`timescale 1ns / 1ps

module mutex4(
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

module mutex16(
    input [15:0] in,
    input [3:0] sel,
    output logic q
);
logic [3:0] mux;

mutex4 MUX0(.in(in[3:0]), .sel(sel[1:0]), .q(mux[0]));
mutex4 MUX1(.in(in[7:4]), .sel(sel[1:0]), .q(mux[1]));
mutex4 MUX2(.in(in[11:8]), .sel(sel[1:0]), .q(mux[2]));
mutex4 MUX3(.in(in[15:12]), .sel(sel[1:0]), .q(mux[3]));

mutex4 MUX4(.in(mux), .sel(sel[3:2]), .q(q));

endmodule
