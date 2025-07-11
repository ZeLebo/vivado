`timescale 1ns / 1ps

module decoder(
    input logic [1:0] in, 
    output logic [3:0] out
);

    always_comb begin
        out = 4'b0000;
        
        case (in)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
        endcase
    end
    
endmodule
