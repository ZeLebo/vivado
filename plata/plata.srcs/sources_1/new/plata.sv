`timescale 1ns / 1ps


module plata(
    input [7:0] buttons,
    output logic [7:0] segments
    );


// 1 - bc - 00000110
// 2 - abdeg
// 3 - abcdg
// 4 - bcfg
// 5 - acdfg
// 6 - acdefg
// 7 - abc
// 8 - abcdefg

always_comb
    case(buttons)
        8'b11111111: segments = 8'b00000000; //NULL
        8'b11111110: segments = 8'b00000110; //1
        8'b11111101: segments = 8'b01011011; //2
        8'b11111011: segments = 8'b01001111; //3
        8'b11110111: segments = 8'b01100110; //4
        8'b11101111: segments = 8'b01101101; //5
        8'b11011111: segments = 8'b01111101; //6
        8'b10111111: segments = 8'b00000111; //7
        8'b01111111: segments = 8'b01111111; //8
    endcase;

//assign segments = 8'b0000000 |  
//    ((buttons[1] == 1'b0) ? 8'b00001111 : 8'b00000000)
//);
//assign segments = (buttons[1] == 1'b0) ? 8'b11111111 : 8'b00000000;

endmodule
