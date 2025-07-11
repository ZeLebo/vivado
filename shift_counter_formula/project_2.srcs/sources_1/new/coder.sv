`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 13:40:11
// Design Name: 
// Module Name: coder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module coder(
    input [3:0] in,
    output logic [1:0] code
    );

//assign code[0] = in[3] | in[1];
//assign code[1] = in[3] | in[2];      

always_comb
    case(in)
        4'b0001: code = 2'b00;
        4'b0010: code = 2'b01;
        4'b0100: code = 2'b10;
        4'b1000: code = 2'b11;
    endcase;

endmodule
