`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 04:58:40 PM
// Design Name: 
// Module Name: InstuctionMemory
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


module instructionMemory(
    input [7:0] inst_addr,
    output reg [7:0] instruction
    );
    
    reg [7:0] inst_mem[0:7];
    
    initial begin
//        //inst_mem[0] <= 8'b00010010;
//        inst_mem[1] <= 8'b00010101;
//        inst_mem[2] <= 8'b01010000;
//        inst_mem[0] <= 8'b00010011;    
//        inst_mem[1] <= 8'b01110100;    
//        inst_mem[2] <= 8'b00110110;    
//        inst_mem[3] <= 8'b00001001;    
//        inst_mem[4] <= 8'b10010000;    
//        inst_mem[5] <= 8'b01001000;
//        inst_mem[6] <= 8'b00110000;   
        //mem[6] <= "010100000";   
        //mem[7] <= "001100000";   
        
        $readmemh("Instruction.mem", inst_mem);
    end
    
    always @(inst_addr)
        begin
            instruction <= inst_mem[inst_addr];
        end    

endmodule
