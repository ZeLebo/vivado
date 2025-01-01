`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2020 16:03:50
// Design Name: 
// Module Name: tb_processor
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


module tb_processor();
logic   clk, reset;

processor_CISC DUT(.clk(clk), .reset(reset));

parameter PERIOD = 10;

always begin
    clk = 1'b0; #(PERIOD/2); 
    clk = 1'b1; #(PERIOD/2);
end
	
initial begin
    reset = 1; #10;
    reset = 0; #1000;
$finish;
end;			

endmodule
