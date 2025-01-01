`timescale 1ns / 1ps

module TB_adder_16bit();

    logic [15:0] a;
    logic [15:0] b;
    logic cin;
    logic [15:0] sum;
    logic cout;

    adder_16bit DUT (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin
        a = 16'h0001; 
        b = 16'h0001; 
        cin = 1'b0; 
        #10;
        
        a = 16'hFFFF; 
        b = 16'h0001; 
        cin = 1'b0; 
        #10;
        
        a = 16'hAAAA; 
        b = 16'h5555; 
        cin = 1'b1; 
        #10;
        
        a = 16'hF0F0; 
        b = 16'h0F0F; 
        cin = 1'b0; 
        #10;
        
        a = 16'h0000; 
        b = 16'h0000; 
        cin = 1'b0; 
        #10;
        
        a = 16'hFFFF; 
        b = 16'hFFFF; 
        cin = 1'b1; 
        #10;
        
        a = 16'h1234; 
        b = 16'h5678; 
        cin = 1'b0; 
        #10;
        
        a = 16'h8765; 
        b = 16'h4321; 
        cin = 1'b1; 
        #10;
        
        $finish;
    end
    
endmodule