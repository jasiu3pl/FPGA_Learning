`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 22:55:56
// Design Name: 
// Module Name: register
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


module register #(
    parameter N = 8
)(
    input clk,
    input [N-1:0]idata,
    output [N-1:0]odata
);
    reg [N-1:0]val = 0;
    always @(posedge clk)
    begin
        val <= idata;
    end
    assign odata = val;
    
endmodule
