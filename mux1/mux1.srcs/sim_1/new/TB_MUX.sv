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
        for(j = 0; j < 8; j++) begin
            in = 0;
            if (j == i) begin
                in = 1 << j; #10;
                in = 8'b11111111 ^ in; #10;
                in = 0; #10;
//                in = 1 << j; #10;
            end
        end
    end
    
$finish;
end

endmodule
