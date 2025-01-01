`timescale 1ns / 1ps

module TB_serial_comparator8();

    logic [7:0] x;
    logic [7:0] y;
    logic x_greater_y8;
    logic x_less_y8;

    serial_comparator8 DUT (
        .x(x), 
        .y(y), 
        .x_greater_y8(x_greater_y8), 
        .x_less_y8(x_less_y8)
    );

    initial begin
        x = 8'b00001000; 
        y = 8'b00000100; 
        #10;
        
        x = 8'b00000100; 
        y = 8'b00001000; 
        #10;
        
        x = 8'b00001111; 
        y = 8'b00001111; 
        #10;
        
        x = 8'b11111111; 
        y = 8'b00000000; 
        #10;
        
        x = 8'b00000000; 
        y = 8'b11111111; 
        #10;
        
        x = 8'b10000000; 
        y = 8'b10000000; 
        #10;
        
        x = 8'b10101010; 
        y = 8'b10011010; 
        #10;
        
        x = 8'b01111000; 
        y = 8'b10011000; 
        #10;
        
        x = 8'b11110000; 
        y = 8'b11110000; 
        #10;
        
        x = 8'b00000001; 
        y = 8'b00000000; 
        #10;
        
        x = 8'b00000000; 
        y = 8'b00000001; 
        #10;
        
        $finish;
    end
    
endmodule
