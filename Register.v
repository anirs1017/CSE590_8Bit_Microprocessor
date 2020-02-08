`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 05:56:29 PM
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input rst,
    input readReg1,
    input readReg2,
    input regWrite,
    input writeReg,
    input [7:0] writeData,
    output [7:0] readData1,
    output [7:0] readData2
    );
    
    reg [7:0] regfile [0:1];
    
    assign readData1 = regfile[readReg1];
    assign readData2 = regfile[readReg2];

    always @(posedge clk)
        begin
            if (regWrite == 1)
                regfile[readReg1] <= writeData;
            else if (rst == 1)
                begin
                    regfile[0] <= 8'b00000000;
                    regfile[1] <= 8'b00000000;
                end
        end

endmodule
