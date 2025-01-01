`timescale 1ns / 1ps

module TB_MUX();
logic [7:0] in;
logic [2:0] sel;
logic q; 

mux DUT(.in(in), .sel(sel), .q(q));

initial begin

    integer i;
    integer j;
    for(i = 0; i < 7; i++) begin
        sel = i;
        for(j = 0; j < 256; j++) begin
            in = j; #10;
        end
    end
    
$finish;
end

endmodule
