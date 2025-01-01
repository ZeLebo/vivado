`timescale 1ns / 1ps

module TD_decoder();
    logic [3:0] in;  
    logic [15:0] out;
    
    decoder DUT (
        .in(in),
        .out(out)
    );

    initial begin
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b1001; #10;
        in = 4'b1111; #10;

        $finish;
    end
    
endmodule
