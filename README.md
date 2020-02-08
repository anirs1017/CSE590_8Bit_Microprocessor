# CSE590_8Bit_Microprocessor
In this design we have used a program counter, adders and multiplexers, a control unit, an ALU and registers. 
<br>We have the Instruction memory and data memory which is used for storage. 
<br>We give the imput (PCin) in the program counter which is fed in the instruction memory. 
<br>The output data is fed in the register. In the register, Read reg1 is defined by the sourse register, Read Reg 2 is defined by the destination register. 
<br>While input for the Write data is given by the output of the multiplier. 
<br>This multiplexer is triggered if the Instruction set consists of an instruction which requires data to be loaded in the register from memory (Example: Load Instruction). Also, the PC out is used as input to the adder which increments its value by 1 bye which gives the address of the next instruction. 
<br>It gives a 8 bit output. The first 3 bits are used as input for another adder along with the last 5 bits (from the instruction memory). 
<br>This adder gives the concatenated output which is fet to a multiplexer which is enabled by jump control signal. 
<br>The first three bits of the input array, is used by the control unit to decode the opcode. 
<br>Accordingly, it gives the output which is used to trigger the multiplexers, registers, data memory and ALU Control. 
<br>From the register, the data is sent to the ALU Result, where the arithmatic operation is performed. 
<br>Later the computed data is sent to the Data Memory and the output is given accordingly.

Block Diagram - 
![](block-diagram.jpg)
