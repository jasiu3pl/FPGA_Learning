`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 17:46:28
// Design Name: 
// Module Name: cnt
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


module cnt_n #(
    parameter N = 10
    )
    (
        input clk,
        input ce,
        input rst,
        output [$clog2(N)-1:0]cnt
    );
    reg [$clog2(N)-1:0]val = 0;
    always @(posedge clk) begin
        if (rst) val <= 0;
        else begin
            if (ce) begin
                if (val == N-1) begin
                    val <= 0;
                end
                else begin
                    val <= val + 1;
                end
            end
            else val <= val;
        end
    end
    assign cnt = val;
endmodule
