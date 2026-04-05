`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 23:08:58
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


module tb_dsp_acc(
    );
    reg clk = 0;
    reg ce = 1;
    reg rst = 0;
    reg signed [11:0] A = 12'd0;
    wire signed [19:0] Y;

    dsp_acc dut (
        .clk(clk),
        .ce(ce),
        .rst(rst),
        .A(A),
        .Y(Y)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #15;
        rst = 0;

        @(negedge clk) A = 20;
        @(negedge clk) A = -40;
        @(negedge clk) A = 60;
        @(negedge clk) A = -64;
        @(negedge clk) A = 88;
        @(negedge clk) A = -100;
        @(negedge clk) A = 112;
        @(negedge clk) A = -136;
        @(negedge clk) A = 148;
        @(negedge clk) A = -160;

        @(negedge clk);
        ce = 0;
        A = 500;
        #30;
        
        ce = 1;
        rst = 1;
        #20;

        $finish;
    end

endmodule
