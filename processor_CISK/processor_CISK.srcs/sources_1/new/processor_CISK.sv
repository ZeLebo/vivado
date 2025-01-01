`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2020 14:22:31
// Design Name: 
// Module Name: processor_CISK
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module processor_CISC(
    input clk,
    input reset
    );

logic   [4:0]   ip;
logic   [7:0]   acc, d_out;
logic   [2:0]   inst_COP;                                    
logic   [4:0]   inst_ADDR;

//------------ Micro Control Unit -----------------                        
enum logic [3:0] {inst_addr = 4'b0000,
                  inst_read = 4'b0001,
                  decode    = 4'b0010,
                  load_read = 4'b0011,
                  load      = 4'b0100,
                  store     = 4'b0101,
                  add_read  = 4'b0110,
                  add       = 4'b0111,
                  decrement = 4'b1000,
                  branch    = 4'b1001,
                  halt      = 4'b1010} state;
                  
parameter ld    = 3'b000;
parameter st    = 3'b001;
parameter ad    = 3'b010;
parameter dc    = 3'b011;
parameter br    = 3'b100;
parameter ht    = 3'b101;

always @(posedge clk or posedge reset)
    if (reset) begin
        state <= inst_addr;
    end
    else
        case (state)
            inst_addr:  state <= inst_read;
            inst_read:  state <= decode;
            decode  :   case (inst_COP)
                            ld: state <= load_read;  
                            st: state <= store;  
                            ad: state <= add_read;  
                            dc: state <= decrement;  
                            br: state <= branch;  
                            ht: state <= halt;  
                        endcase    
            load_read:  state <= load;
            add_read :  state <= add;
            load     :  state <= inst_addr; 
            store    :  state <= inst_addr; 
            add      :  state <= inst_addr; 
            decrement:  state <= inst_addr; 
            branch   :  state <= inst_addr;
            halt     :  state <= halt;
        endcase    

//------------ Instruction Pointer ---------------                        
always @ (posedge clk or posedge reset)
    if (reset) 
        ip <= 5'b00000;
    else if ((state == load) | (state == store) | (state == add) | (state == decrement))
        ip <= ip + 1;
    else if (state == branch)
            if (acc != 0)
                ip <= inst_ADDR;
            else 
                ip <= ip + 1;

//------------ Accumulator + Arithmetic Logic Unit -----------     
always @ (posedge clk or posedge reset) begin
    if (reset) 
        acc <= 5'b00000;
    else if (state == load)
        acc <= d_out;
    else if (state == add)
        acc <= acc + d_out;
    else if (state == decrement)
        acc <= acc - 1;
end 

//-------------- Instruction Register ---------------
always @ (posedge clk or posedge reset)
    if (reset) begin
        inst_ADDR <= 5'b00000;
        inst_COP  <= 3'b000;
    end    
    else if (state == inst_read) begin       
        inst_ADDR <= d_out[4:0];
        inst_COP  <= d_out[7:5];
    end

//-------------- Memory -----------------------------
logic [7:0] ram [31:0];

initial $readmemb("memory.mem", ram, 0, 31);

always @(posedge clk)
    if (state == store)
      ram[inst_ADDR] <= acc;

always @(posedge clk)
      d_out <= ram[(state == inst_addr) ? ip : inst_ADDR];
     
endmodule
