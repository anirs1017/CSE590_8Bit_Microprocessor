`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 11:39:38 AM
// Design Name: 
// Module Name: ALU8BIT
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


module ALU8BIT(
    input [7:0] a,
    input [7:0] b,
    input [1:0] ALUCtrl,
    output reg [7:0] ALUOut
    );
    
    always @(ALUCtrl, a, b)
        begin
            case(ALUCtrl)
                2'b00:   ALUOut <= a + b;
                2'b01:   ALUOut <= a & b;
                2'b10:   ALUOut <= a - b;
                default:;
            endcase
        end 
endmodule
