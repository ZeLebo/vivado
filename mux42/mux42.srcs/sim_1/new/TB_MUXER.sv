`timescale 1ns / 1ps

module TB_MUXER();
logic [3:0] in;
logic [1:0] sel;
logic q; 

mux42 DUT(.in(in), .sel(sel), .q(q));

initial begin
    integer i;
    integer j;
    for(i = 0; i < 4; i++) begin
        sel = i;
        for(j = 0; j < 4; j++) begin
            in = 0;
            if (j == i) begin
                in = 1 << j; #10;
                in = 4'b1111 ^ in; #10;
            end
        end
    end
    
$finish;
end

endmodule
