`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 13:37:39
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk,
    input wire [2:0] rx_op,
    input wire [2:0] ry_op,
    input wire [2:0] d_op,
    input wire [7:0] alu_res,
    input wire [7:0] pc_val,
    input wire [7:0] gpi,
    output wire [7:0] gpo,
    output reg [7:0] rx_out,
    output reg [7:0] ry_out
    );
    reg [7:0] r [5:0];


    integer i;
    initial begin
        for (i = 0; i < 6; i = i + 1) begin
            r[i] = 8'd0;
        end
    end

    assign gpo = r[4];

    always @(*) begin
        rx_out = r[rx_op];
        ry_out = r[ry_op];
        if (rx_op == 3'd6) begin
            rx_out = 8'd0;
        end else if (rx_op == 3'd7) begin
            rx_out = pc_val;
        end else if (rx_op == 3'd5) begin
            rx_out = gpi;
        end

        if (ry_op == 3'd6) begin
            ry_out = 8'd0;
        end else if (ry_op == 3'd7) begin
            ry_out = pc_val;
        end else if (ry_op == 3'd5) begin
            ry_out = gpi;
        end
    end

    always @(posedge clk ) begin
       if (d_op <= 3'd4) begin
            r[d_op] <= alu_res;
       end 
    end

endmodule
