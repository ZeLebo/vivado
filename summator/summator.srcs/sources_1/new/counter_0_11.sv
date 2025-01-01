`timescale 1ns / 1ps

module multiplier_with_memory(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [7:0] result
);

    logic [7:0] memory [0:255];
    logic [7:0] address;

    // Инициализация памяти (таблицы произведений)
    initial begin
        integer i, j;
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                memory[i * 16 + j] = i * j; // Используем i * 16 + j для индексации
            end
        end
    end

    assign address = {a, b}; // Формирование адреса из a и b
    assign result = memory[address]; // Доступ к памяти

endmodule
