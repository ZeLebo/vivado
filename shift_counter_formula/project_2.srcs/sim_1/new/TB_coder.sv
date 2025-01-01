`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 13:44:09
// Design Name: 
// Module Name: TB_coder
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


module TB_coder();
logic [3:0] in;
logic [1:0] code;

coder DUT(.in(in), .code(code));

initial begin
    in = 4'b0001;   #10;
    repeat (3) begin
        in = in << 1;   #10;
    end
$finish;
end


endmodule
