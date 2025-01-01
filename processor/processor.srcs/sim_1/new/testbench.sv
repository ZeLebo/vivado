`timescale 1ns / 1ps

module processor_test();

    logic clk, stop;

    // Экземпляр процессора
    main my_cpu(
        .clk(clk),
        .rw(),
        .addr(),
        .data_in(),
        .data_out(),
        .mem(),
        .stop(stop)
    );

    parameter PERIOD = 20;

    // Генерация тактовых импульсов
    always begin
        clk = 1'b0; #(PERIOD/2);
        clk = 1'b1; #(PERIOD/2);
    end

    initial begin
        $display("Starting simulation...");

        // Дожидаемся завершения работы процессора
        while (!stop) begin
            #PERIOD;
        end

        // Вывод состояния при завершении
        $display("Simulation finished. Processor stopped.");
        $finish;
    end
endmodule
