`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 07:04:43 PM
// Design Name: 
// Module Name: controlUnit
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


    module controlUnit(
        input [2:0] opcode,
        output reg RegDst,
        output reg Branch,
        output reg RegWrite,
        output reg Jump,
        output reg [1:0] ALUOp,
        output reg MemRead,
        output reg MemWrite,
        output reg MemtoReg,
        output reg ALUSrc
    );
    
    always@(*) begin
        case(opcode)
            3'b000:      //lw
                begin
                    RegDst      <= 0;
                    RegWrite    <= 1;
                    Branch      <= 0;
                    Jump        <= 0;
                    ALUOp       <= 2'b00;
                    MemRead     <= 1;
                    MemWrite    <= 0;
                    MemtoReg    <= 1;
                    ALUSrc      <= 1;
                end
            3'b001:      //sw
                begin
                    RegDst      <= 0;
                    RegWrite    <= 0;
                    Branch      <= 0;
                    Jump        <= 0;
                    ALUOp       <= 2'b00;
                    MemRead     <= 0;
                    MemWrite    <= 1;
                    MemtoReg    <= 0;
                    ALUSrc      <= 1;                
                end
            3'b010:      //add
                begin
                    RegDst      <= 1;
                    RegWrite    <= 1;
                    Branch      <= 0;
                    Jump        <= 0;
                    ALUOp       <= 2'b00;
                    MemRead     <= 0;
                    MemWrite    <= 0;
                    MemtoReg    <= 0;
                    ALUSrc      <= 0;
                end
            3'b011:      //addi
                begin
                    RegDst      <= 0;
                    RegWrite    <= 1;
                    Branch      <= 0;
                    Jump        <= 0;
                    ALUOp       <= 2'b00;
                    MemRead     <= 0;
                    MemWrite    <= 0;
                    MemtoReg    <= 0;
                    ALUSrc      <= 1;
                end
            3'b100:      //sub
                begin
                    RegDst      <= 1;
                    RegWrite    <= 1;
                    Branch      <= 0;
                    Jump        <= 0;
                    ALUOp       <= 2'b10;
                    MemRead     <= 0;
                    MemWrite    <= 0;
                    MemtoReg    <= 0;
                    ALUSrc      <= 0;
                end
            3'b101:    //jmp
                begin
                    RegDst      <= 0;
                    RegWrite    <= 0;
                    Branch      <= 0;
                    Jump        <= 1;
                    ALUOp       <= 2'b11;
                    MemRead     <= 0;
                    MemWrite    <= 0;
                    MemtoReg    <= 0;
                    ALUSrc      <= 0;
                end
            endcase
        end
endmodule
