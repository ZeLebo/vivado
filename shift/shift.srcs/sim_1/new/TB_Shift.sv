`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 14:15:13
// Design Name: 
// Module Name: TB_Shift
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


module TB_Shift();
logic [3:0] in;
logic [1:0] shift;
logic [3:0] q;

shift DUT(.in(in), .shift(shift), .q(q));

initial begin 
    integer i;
    integer j;
    
    for (i = 0; i < 4; i++) begin
        shift = i;
        for(j = 0; j < 16; j++) begin
            in = j; #10; 
        end
    end
$finish;
end

endmodule
