`timescale 1ns / 1ps

module adder_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic cin,
    output logic [3:0] sum,
    output logic cout
);
    logic [3:0] p, g;
    logic [3:0] c;
    
    assign p = a ^ b;
    assign g = a & b;
    
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign cout = g[3] | (p[3] & c[3]);
    
    assign sum = p ^ c;
endmodule

module adder_16bit(
    input logic [15:0] a,
    input logic [15:0] b,
    input logic cin,
    output logic [15:0] sum,
    output logic cout
);
    logic [3:0] carry;
    
    adder_4bit U0 (
        .a(a[3:0]), 
        .b(b[3:0]), 
        .cin(cin), 
        .sum(sum[3:0]), 
        .cout(carry[0])
    );
    
    adder_4bit U1 (
        .a(a[7:4]), 
        .b(b[7:4]), 
        .cin(carry[0]), 
        .sum(sum[7:4]), 
        .cout(carry[1])
    );
    
    adder_4bit U2 (
        .a(a[11:8]), 
        .b(b[11:8]), 
        .cin(carry[1]), 
        .sum(sum[11:8]), 
        .cout(carry[2])
    );
    
    adder_4bit U3 (
        .a(a[15:12]), 
        .b(b[15:12]), 
        .cin(carry[2]), 
        .sum(sum[15:12]), 
        .cout(cout)
    );
endmodule