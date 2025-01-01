`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 14:17:41
// Design Name: 
// Module Name: main
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


module main(
    input a,
    input b,
    input carry_in,
    output res,
    output carry_out,
    output sub_res,
    output sub_carry
    );
    
   assign res = (a ^ b ^ carry_in);
   assign carry_out = (a & b) | (carry_in & (a ^ b));
   assign sub_res = (a ^ b ^ carry_in);
   assign sub_carry = ((!a) & b) | ((!a) & carry_in) | (b & carry_in); 
endmodule
