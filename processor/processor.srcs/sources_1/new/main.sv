`timescale 1ns / 1ps

module main(
    input clk,
    output reg rw, // 1 - read
    output reg [7:0] addr,
    input [15:0] data_in,
    output reg [15:0] data_out,
    output reg mem,
    output reg stop
);

    reg [15:0] memory [255:0]; // Память
    reg [15:0] regs [3:0];     // Регистры: r0, r1, r2, r3
    reg [7:0] state = 0;       // Состояние процессора
    reg [15:0] instruction;    // Текущая инструкция

    initial begin
        rw = 0;
        addr = 0;
        data_out = 0;
        stop = 0;

        // Инициализация памяти из файла
        $readmemb("memory.mem", memory);
        $display("Memory initialized:");
        for (int i = 0; i < 12; i++) begin
            $display("memory[%0d] = %b", i, memory[i]);
        end
    end

    always @(posedge clk) begin
        case (state)
            0: begin
                addr <= 0;
                rw <= 1;
                mem <= 1;
                state <= 1;
            end
            1: begin // Чтение инструкции
                instruction <= memory[addr];
                mem <= 0;
                rw <= 0;
                state <= 2;
            end
            2: begin
                case (instruction[15:12])
                    4'b0000: begin
                        regs[instruction[11:10]] <= instruction[7:0];
                        addr <= addr + 1;
                        state <= 1;
                        $display("LD: r%0d = %0d", instruction[11:10], instruction[7:0]);
                    end
                    4'b0110: begin
                        regs[instruction[9:8]] <= regs[instruction[11:10]] + regs[instruction[9:8]];
                        addr <= addr + 1;
                        state <= 1;
                        $display("ADD: r%0d + r%0d -> r%0d", instruction[11:10], instruction[9:8], instruction[9:8]);
                    end
                    4'b0101: begin
                        regs[instruction[9:8]] <= regs[instruction[11:10]];
                        addr <= addr + 1;
                        state <= 1;
                        $display("MV: r%0d -> r%0d", instruction[11:10], instruction[9:8]);
                    end
                    4'b0011: begin
                        regs[instruction[11:10]] <= regs[instruction[11:10]] - 1;
                        addr <= addr + 1;
                        state <= 1;
                        $display("DEC: r%0d -> %0d", instruction[11:10], regs[instruction[11:10]]);
                    end
                    4'b0100: begin
                        if (regs[instruction[11:10]] != 0) begin
                            addr <= instruction[7:0];
                            $display("GONZ: r%0d != 0, goto %0d", instruction[11:10], instruction[7:0]);
                        end else begin
                            addr <= addr + 1;
                            $display("GONZ: r%0d == 0, continue", instruction[11:10]);
                        end
                        state <= 1;
                    end
                    4'b0001: begin
                        memory[instruction[7:0]] <= regs[instruction[11:10]];
                        addr <= addr + 1;
                        state <= 1;
                        $display("ST: r%0d -> MEM[%0d]", instruction[11:10], instruction[7:0]);
                    end
                    4'b0010: begin
                        stop <= 1;
                        $display("STOP");
                        state <= 0;
                    end
                endcase
            end
        endcase
    end
endmodule
