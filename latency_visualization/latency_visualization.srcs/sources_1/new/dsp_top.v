`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 16:58:51
// Design Name: 
// Module Name: dsp_top
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


module dsp_top(
    input clk,
    input ce,

    input signed [15:0] A,
    input signed [15:0] B,
    input signed [15:0] C,

    output signed [32:0] Y
    );

    wire signed [16:0] sum_out;

    reg signed [15:0] C_delay_1 = 0; 
    reg signed [15:0] C_delay_2 = 0;

    always @(posedge clk ) begin
        if (ce) begin
            C_delay_1 <= C;
            C_delay_2 <= C_delay_1;
        end
    end

    c_addsub_0 my_adder (
        .A(A),
        .B(B),
        .CLK(clk),
        .CE(ce),
        .S(sum_out)
    ); 

    mult_gen_0 my_multiplier (
        .A(sum_out),
        .B(C_delay_2),
        .CLK(clk),
        .CE(ce),
        .P(Y)
    );

endmodule
