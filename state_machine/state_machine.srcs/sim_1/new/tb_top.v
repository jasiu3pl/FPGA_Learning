`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2026 11:31:20
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


module tb_top();

    reg clk = 0;
    reg rst = 1;
    wire [7:0] w_data;
    wire w_send;
    wire w_txd;

    always #1 clk = ~clk;
    
    initial begin
        #5;
        rst = 0;
    end

    stimulate st_i (
        .data(w_data),
        .send(w_send)
    );

    fsm dut (
        .clk(clk),
        .rst(rst),
        .send(w_send),
        .data(w_data),
        .txd(w_txd)
    );

    verify v_i (
        .txd(w_txd)
    );

endmodule
