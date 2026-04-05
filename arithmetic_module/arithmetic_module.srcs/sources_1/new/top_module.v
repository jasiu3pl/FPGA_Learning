`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 13:04:40
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
    input wire clk,
    input wire ce,

    input wire signed [16:0] A,
    input wire signed [6:0] B,
    input wire signed [10:0] C,
    input wire signed [6:0] D,
    input wire signed [12:0] E,
    input wire signed [17:0] F,

    output wire signed [34:0] Y
    );

    wire signed [11:0] B_aligned = $signed({B, 5'b0});
    wire signed [17:0] X;
    wire signed [28:0] M1_out;
    wire signed [32:0] M2_out;
    wire signed [13:0] A2_out;
    wire signed [18:0] A3_out;
    wire signed [9:0] D_aligned = $signed({D, 3'b0});
    wire signed [16:0] E_aligned = $signed({E, 4'b0});
    wire signed [33:0] M2_out_aligned = $signed({M2_out, 1'b0});

    reg signed [10:0] C_delay_1 = 0;
    reg signed [10:0] C_delay_2 = 0;

    always @(posedge clk ) begin
        if (ce) begin
            C_delay_1 <= C;
            C_delay_2 <= C_delay_1;
        end
    end
    
    c_addsub_0 my_adder_1 (
        .CLK(clk),
        .CE(ce),
        .A(A),
        .B(B_aligned),
        .S(X)
    );
    
    c_addsub_1 my_adder_2 (
        .CLK(clk),
        .CE(ce),
        .A(D_aligned),
        .B(E),
        .S(A2_out)
    );

    c_addsub_2 my_adder_3 (
        .CLK(clk),
        .CE(ce),
        .A(E_aligned),
        .B(F),
        .S(A3_out)
    );

    c_addsub_3 final_adder (
        .CLK(clk),
        .CE(ce),
        .A(M1_out),
        .B(M2_out_aligned),
        .S(Y)
    );

    mult_gen_0 my_mult_1 (
        .CLK(clk),
        .CE(ce),
        .A(X),
        .B(C_delay_2),
        .P(M1_out)
    );

    mult_gen_1 my_mult_2 (
        .CLK(clk),
        .CE(ce),
        .A(A2_out),
        .B(A3_out),
        .P(M2_out)
    );


endmodule
