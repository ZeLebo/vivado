`timescale 1ns / 1ps

module TD_decoder();

    logic [1:0] in; 
    logic [3:0] out;

    decoder DUT (
        .in(in),
        .out(out)
    );

    initial begin
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        $finish;
    end
    
endmodule
