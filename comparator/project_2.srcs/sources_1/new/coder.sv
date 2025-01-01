`timescale 1ns / 1ps

module two_bit_comparator(
    input logic [1:0] x,
    input logic [1:0] y,
    output logic x_greater_y,
    output logic x_less_y
);
    always_comb begin
        x_greater_y = (x[1] & ~y[1]) | (~x[1] & ~y[1] & x[0] & ~y[0]) | (x[1] & y[1] & x[0] & ~y[0]);
        x_less_y = (~x[1] & y[1]) | (~x[1] & ~y[1] & ~x[0] & y[0]) | (x[1] & y[1] & ~x[0] & y[0]);
    end
endmodule

module serial_comparator8(
    input logic [7:0] x,
    input logic [7:0] y,
    output logic x_greater_y8,
    output logic x_less_y8
);
    logic [7:0] less_signals, greater_signals;

    two_bit_comparator initial_compare (
        .x(x[1:0]), 
        .y(y[1:0]), 
        .x_less_y(less_signals[0]), 
        .x_greater_y(greater_signals[0])
    );

    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : comparison_chain
            two_bit_comparator stage_compare (
                .x({x[i+2], greater_signals[i]}), 
                .y({y[i+2], less_signals[i]}), 
                .x_less_y(less_signals[i+1]), 
                .x_greater_y(greater_signals[i+1])
            );
        end
    endgenerate

    assign x_less_y8 = less_signals[6];
    assign x_greater_y8 = greater_signals[6];
endmodule
