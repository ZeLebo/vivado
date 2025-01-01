`timescale 1ns / 1ps

module TB_adder_64();

    logic [63:0] a;
    logic [63:0] b;
    logic cin;
    logic [63:0] sum;
    logic cout;

    adder_64 DUT (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin
        a = 64'h0000000000000001; 
        b = 64'h0000000000000001; 
        cin = 1'b0; 
        #10;
        
        a = 64'hFFFFFFFFFFFFFFFF; 
        b = 64'h0000000000000001; 
        cin = 1'b0; 
        #10;
        
        a = 64'hAAAAAAAAAAAAAAAA; 
        b = 64'h5555555555555555; 
        cin = 1'b1; 
        #10;
        
        a = 64'hF0F0F0F0F0F0F0F0; 
        b = 64'h0F0F0F0F0F0F0F0F; 
        cin = 1'b0; 
        #10;
        
        a = 64'h0000000000000000; 
        b = 64'h0000000000000000; 
        cin = 1'b0; 
        #10;
        
        a = 64'hFFFFFFFFFFFFFFFF; 
        b = 64'hFFFFFFFFFFFFFFFF; 
        cin = 1'b1; 
        #10;
        
        a = 64'h123456789ABCDEF0; 
        b = 64'h0FEDCBA987654321; 
        cin = 1'b0; 
        #10;
        
        a = 64'h8765432187654321; 
        b = 64'h1234567812345678; 
        cin = 1'b1; 
        #10;
        
        $finish;
    end
    
endmodule
