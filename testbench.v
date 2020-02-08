//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2019 12:05:48 PM
// Design Name: 
// Module Name: testbench
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


module testbench(
    input clock, reset, 
    output wire [7:0] PCin, PCout, sum, inst, concatenate, ReadData1, ReadData2, Extend8, ALU_B, ALUOut, ReadData, WriteData_Reg,
    output wire RegDst, Branch, RegWrite, Jump, ALUSrc, MemtoReg, MemRead, MemWrite,
    output wire [1:0] ALUOp, ALUCtrl
);
    
    processor simulate_tb(
        .clock(clock),
        .reset(reset),
        .PCin(PCin),
        .PCout(PCout),
        .sum(sum),
        .inst(inst),
        .concatenate(concatenate),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .Extend8(Extend8),
        .ALU_B(ALU_B),
        .ALUOut(ALUOut),
        .ReadData(ReadData),
        .WriteData_Reg(WriteData_Reg),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .RegDst(RegDst), 
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ALUOp(ALUOp),
        .ALUCtrl(ALUCtrl)
    );
endmodule
