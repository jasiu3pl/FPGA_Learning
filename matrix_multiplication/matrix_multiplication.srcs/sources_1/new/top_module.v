`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 13:25:20
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire signed [11:0] A, 
    input wire signed [11:0] B,
    output wire signed [24:0] Y, 
    output wire signed [24:0] Z
    );

    localparam C_11 = -2;
    localparam C_12 = 37;
    localparam C_21 = 50;
    localparam C_22 = -180;

    assign Y = (C_11 * A) + (C_12 * B);
    assign Z = (C_21 * A) + (C_22 * B);

endmodule
