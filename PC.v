`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aniruddha Sinha
// 
// Create Date: 04/13/2019 03:56:13 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input rst,
    input clk,
    input [7:0] PCin,
    output reg [7:0] PCout
);
    
    always@(posedge clk)
        begin
            if(rst == 1)
                PCout <= 8'd0;
            else
                PCout <= PCin;
        end
            
endmodule


