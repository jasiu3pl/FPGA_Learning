`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 18:18:38
// Design Name: 
// Module Name: tb_cnt_n
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


module tb_cnt_n 
    (
    );
    localparam N_TB1 = 5;
    localparam N_TB2 = 10;

    reg ce;
    reg clk;
    reg rst;
    wire [$clog2(N_TB1)-1:0]cnt1;
    wire [$clog2(N_TB2)-1:0]cnt2;

    cnt_n #(.N(N_TB1)) dut1 (
        .clk(clk),
        .ce(ce),
        .rst(rst),
        .cnt(cnt1)
    );

    cnt_n #(.N(N_TB2)) dut2 (
        .clk(clk),
        .ce(ce),
        .rst(rst),
        .cnt(cnt2)
    );
    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        ce = 0;
        rst = 1;

        #20;

        rst = 0;
        ce = 1;

        #250;

        $finish;
    end
    
endmodule
