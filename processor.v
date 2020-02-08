`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ANIRUDDHA SINHA
// 
// Create Date: 04/13/2019 09:12:16 PM
// Design Name: 
// Module Name: processor
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


module processor(
    clock, reset,
    sum, 
    PCin, PCout, 
    inst, concatenate,
    Jump,
    RegDst, Branch,
    RegWrite, ALUSrc, 
    MemtoReg, MemRead, 
    MemWrite, 
    ALUOp, ALUCtrl,
    ReadData1, ReadData2, 
    Extend8, ALU_B, 
    ALUOut,
    ReadData, WriteData_Reg
    );
    
    input clock, reset;
    
    // Connection of Program Counter
    output wire [7:0] PCin, PCout;
    output wire [7:0] WriteData_Reg;
   
    
    PC pc_0(
        //define inputs
        .rst(reset),
        .clk(clock),
        .PCin(PCin),
        
        //define outputs
        .PCout(PCout)
    );

    
    //Connection of adder and PC
    output wire [7:0] sum;
    
    adder add_0(
        
        //define inputs
        .a(PCout),
        //.b(8'd1),
        
        //Define outputs
        .sum(sum)
        
        
    );

    //Connection of Instruction Memory
    output wire [7:0] inst;
    
    instructionMemory instMem_0(
        //define inputs
        .inst_addr(PCout),
        
        //define outputs
        .instruction(inst)
    );
    
    //Connection of Control Unit
    output wire RegWrite, Jump, ALUSrc, MemtoReg, MemRead, MemWrite, RegDst, Branch;
    output wire [1:0] ALUOp;
    
    controlUnit CU_0(
    
        //define inputs
        .opcode(inst[7:5]),
        
        //define outputs
        .RegDst(RegDst),
        .Branch(Branch),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ALUOp(ALUOp),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc)
    );
    
    //Concatenate the 3-MSB of PC output and 5-LSB of Instruction Memory
    output wire [7:0] concatenate;
    
    concat conc_0(
        //define inputs
        .fromPC(sum[7:5]),
        .instructionMSB(inst[4:0]),
        
        //define outputs
        .concatAddr(concatenate)
    );
    
    //Connection of adder and MUX
    MUX mux_0(
        //define inputs
        .in1(sum),
        .in2(concatenate),
        .sel_mux(Jump),
        
        //define outputs
        .op_mux(PCin)
    );
    
    //Connection of Instruction Memory and Register File
    output wire [7:0] ReadData1, ReadData2;
    
    Register regfile_0(
        //define inputs
        .clk(clock),
        .rst(reset),
        
        //input registers
        .readReg1(inst[3]),
        .readReg2(inst[4]),
        .regWrite(RegWrite),
        .writeReg(inst[4]),
        .writeData(WriteData_Reg),
        
        //define outputs
        .readData1(ReadData1),
        .readData2(ReadData2)
    );
    
    //Connection of sign extend
    output wire [7:0] Extend8;
    
    SignExtend sign_extend_0(
        //define inputs
        .unext(inst[2:0]),
        
        //define outputs
        .extend(Extend8)
    );
    
    //Connection of MUX and ALU
    output wire [7:0] ALU_B;
    
    MUX mux_1(
        //define inputs
        .in1(ReadData2),
        .in2(Extend8),
        .sel_mux(ALUSrc),
        
        //define outputs
        .op_mux(ALU_B)
    );
   
   //Connection of ALU Control
   output wire [1:0] ALUCtrl;
   
   ALUControl alu_control_0(
        //define inputs
        .ALUOp(ALUOp),
        
        //define outputs
        .ALUCtrl(ALUCtrl)
   );
    
   
   //Connection of ALU
   output wire [7:0] ALUOut;
   
   ALU8BIT alu_0(
        //define inputs
        .a(ReadData1),
        .b(ALU_B),
        .ALUCtrl(ALUCtrl),
        
        //define outputs
        .ALUOut(ALUOut) 
   );
   
   //Connection of Data Memory
   output wire [7:0] ReadData;
   
   dataMemory data_memory_0(
        // define inputs
        .address(ALUOut),
        .writeData(ReadData2),
        .memRead(MemRead),
        .memWrite(MemWrite),
        
        
        //define outputs
        .readData(ReadData)
   );
   
   // Connection of Data Memory and MUX
   MUX mux_2(
        // define inputs
        .in1(ALUOut),
        .in2(ReadData),
        .sel_mux(MemtoReg),
        
        //define outputs
        .op_mux(WriteData_Reg)
   );
   
    
endmodule
