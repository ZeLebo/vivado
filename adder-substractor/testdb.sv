`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 14:18:43
// Design Name: 
// Module Name: testdb
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


module testdb();
logic a, b, carry_in, carry_out, res, sub_res, sub_carry;
main some_name(.a(a),
.b(b), 
.carry_in(carry_in),
.res(res), 
.carry_out(carry_out),
.sub_res(sub_res),
.sub_carry(sub_carry));
    initial begin;
    a = 0; b = 0; carry_in = 0; #10;
    a = 0; b = 0; carry_in = 1; #10;
    a = 0; b = 1; carry_in = 0; #10;
    a = 0; b = 1; carry_in = 1; #10;
    
    a = 1; b = 0; carry_in = 0; #10;
    a = 1; b = 0; carry_in = 1; #10;
    a = 1; b = 1; carry_in = 0; #10;
    a = 1; b = 1; carry_in = 1; #10;
    
    $finish;
    end
endmodule
