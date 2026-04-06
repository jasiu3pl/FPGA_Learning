`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 13:30:15
// Design Name: 
// Module Name: tb_top
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


module tb_top(
    );
    reg signed [11:0] A; 
    reg signed [11:0] B;
    wire signed [24:0] Y; 
    wire signed [24:0] Z;

    top_module dut (
        .A(A),
        .B(B),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        A = 24;
        B = 8;
        #10;
        A = -32;
        B = 52;
        #10;
        A = 164;
        B = -80;
        #10;
        A = -248;
        B = 320;
        #10;
        A = 0;
        B = 0;
        #10;
        A = 2047;
        B = -2048;
        #10;
        A = -2048;
        B = 2047;
        #10;
        A = 800;
        B = -800;
        #10;
        $finish;
    end


endmodule
