`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 00:05:11
// Design Name: 
// Module Name: tb_stimulus
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


module tb_stimulus(
    output reg clk,
    output reg [3:0] idata_case1, //dla N=4
    output reg [7:0] idata_case2, //dla N=8
    output reg [15:0] idata_case3 //dla N=16
);
always #5 clk = ~clk;
initial 
begin
    clk = 0;
    idata_case1 = 4'd0;
    idata_case2 = 8'd0;
    idata_case3 = 16'd0;
    
    #20;
    
    idata_case1 = 4'd4;
    idata_case2 = 8'd12;
    idata_case3 = 16'd20;
    
    #100;
    
    $finish;
end
endmodule
