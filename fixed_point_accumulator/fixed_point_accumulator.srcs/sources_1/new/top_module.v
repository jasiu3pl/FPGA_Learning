`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 22:50:58
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


module dsp_acc(
    input wire clk,
    input wire ce,
    input wire rst,

    input wire signed [11:0] A,
    output reg signed [19:0] Y = 20'd0
    );

    wire signed [19:0] next_Y;

    c_addsub_0 adder (
        .A(A),
        .B(Y),
        .S(next_Y)
    );

    always @(posedge clk ) begin
        if (rst) begin
            Y <= 20'd0;
        end else if (ce) begin
            Y <= next_Y;
        end
    end

endmodule
