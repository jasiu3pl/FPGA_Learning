`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 13:30:46
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
    reg clk = 0;
    reg ce = 1;
    reg signed [16:0] A;
    reg signed [6:0] B;
    reg signed [10:0] C;
    reg signed [6:0] D;
    reg signed [12:0] E;
    reg signed [17:0] F;

    wire signed [34:0] Y;

    always #5 clk = ~clk;

    top_module dsp_top(
        .clk(clk),
        .ce(ce),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .Y(Y)
    );

    initial begin
        A = -25687;
        B = 59;
        C = -630;
        D = 36;
        E = -3200;
        F = 68895;
        #150;
        $finish;
    end

endmodule
