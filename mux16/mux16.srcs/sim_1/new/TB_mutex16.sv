`timescale 1ns / 1ps

module TB_mutex16();

    logic [15:0] in;
    logic [3:0] sel;
    logic q;
    
    mutex16 DUT(.in(in), .sel(sel), .q(q));
    
    initial begin
        integer i;
        integer j;
        for(i = 0; i < 16; i++) begin
            sel = i;
            
            for(j = 0; j < 16; j++) begin
                in = 16'b1111_1111_1111_1111;
                in[j] = 0; #10;
                
                in = 0;
                in[j] = 1; #10;
            end
        end
        $finish;
    end
endmodule
