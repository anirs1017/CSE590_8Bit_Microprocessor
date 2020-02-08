`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2019 12:25:06 PM
// Design Name: 
// Module Name: fourbit_adder
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


module adder(
    input [7:0] a,
    //input [7:0] b,
    output [7:0] sum
    //input [3:0] carry
    );
    
    assign sum = a+1;

endmodule
