`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2019 12:53:40 AM
// Design Name: 
// Module Name: concat
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


module concat(
    input [2:0] fromPC,
    input [4:0] instructionMSB,
    output reg [7:0] concatAddr
    );
    
    always@(fromPC, instructionMSB)
        begin
            concatAddr <= {fromPC, instructionMSB};
        end
endmodule
