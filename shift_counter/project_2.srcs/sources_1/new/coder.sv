`timescale 1ns / 1ps

module counter_0_11(
    input logic clk,
    input logic rst,
    input logic up,
    input logic down,
    output logic [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 4'b0000;
        else if (up && !down) 
            count <= (count == 4'b1011) ? 4'b0000 : count + 1;
        else if (down && !up) 
            count <= (count == 4'b0000) ? 4'b1011 : count - 1;
    end
    
endmodule