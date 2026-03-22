`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 00:18:35
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

wire clk;
wire [3:0] in_1;
wire [7:0] in_2;
wire [15:0] in_3;
wire [3:0] out_1;
wire [7:0] out_2;
wire [15:0] out_3;

tb_stimulus st_i(
    .clk(clk),
    .idata_case1(in_1),
    .idata_case2(in_2),
    .idata_case3(in_3)
);
//test for DELAY=0 and N=4
delay_line #(.DELAY(0), .N(4)) dut1(
    .clk(clk),
    .idata(in_1),
    .odata(out_1)
);
//test for even DELAY and N=8
delay_line #(.DELAY(2), .N(8)) dut2(
    .clk(clk),
    .idata(in_2),
    .odata(out_2)
);
//test for odd DELAY and N=16
delay_line #(.DELAY(3), .N(16)) dut3(
    .clk(clk),
    .idata(in_3),
    .odata(out_3)
);

endmodule
