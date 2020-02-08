`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 04:08:30 PM
// Design Name: 
// Module Name: MUX
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


module MUX(
    input [7:0] in1,
    input [7:0] in2,
    input sel_mux,
    output reg [7:0] op_mux
    );
    
    always@(*)
        begin
            case(sel_mux)
                0: op_mux <= in1;
                1: op_mux <= in2;
            endcase
        end
endmodule
