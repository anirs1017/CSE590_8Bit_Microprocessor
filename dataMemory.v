`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 08:01:43 PM
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input [7:0] address,
    input [7:0] writeData,
    input memRead,
    input memWrite,
    output reg [7:0] readData
    );
    
    reg [7:0] Mem[0:9];
    
    initial begin
        $readmemb("DataMemory.mem", Mem);
    end
    
    always @(*)
        begin
            if (memRead == 1)
                    readData <= Mem[address];
        
            if (memWrite == 1)
                    Mem[address] = writeData;
        end
endmodule
