`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 17:25:15
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
    reg signed clk = 0;
    reg signed ce = 1;
    reg signed [15:0] A;
    reg signed [15:0] B;
    reg signed [15:0] C;

    wire signed [32:0] Y;

    always #5 clk = ~clk;

    dsp_top dsp(
        .clk(clk),
        .ce(ce),
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

    initial begin
        A = 5299;
        B = -12901;
        C = 9262;
        #100;
        $finish;
    end


endmodule
