`timescale 1ns / 1ps

module TB_counter_0_11();

    logic clk;
    logic rst;
    logic up;
    logic down;
    logic [3:0] count;

    counter_0_11 DUT (
        .clk(clk), 
        .rst(rst), 
        .up(up), 
        .down(down), 
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Генерация тактового сигнала с периодом 10 нс
    end

    initial begin
        rst = 1;
        #10;
        rst = 0;

        // Увеличение от 0 до 11
        up = 1; down = 0;
        #120;

        // Уменьшение от 11 до 0
        up = 0; down = 1;
        #120;

        // Одновременное нажатие up и down (count не изменяется)
        up = 1; down = 1;
        #40;

        // Сброс во время работы
        up = 1; down = 0;
        #40;
        rst = 1;
        #10;
        rst = 0;
        
        // Работа после сброса
        up = 1; down = 0;
        #60;

        $finish;
    end
    
endmodule
