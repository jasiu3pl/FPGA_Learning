`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 13:26:02
// Design Name: 
// Module Name: alu
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


module alu(
    input wire [7:0] rx_mux,
    input wire [7:0] imm_mux,
    input wire [1:0] alu_op,
    output reg [7:0] alu_res,
    output wire cmp_res
    );

    always @(*) begin
        case (alu_op)
            2'b00: alu_res = rx_mux & imm_mux;
            2'b01: alu_res = rx_mux + imm_mux;
            2'b10: alu_res = (rx_mux == 8'd0) ? 8'd1 : 8'd0;
            2'b11: alu_res = imm_mux;
            default: alu_res = 8'd0;
        endcase
    end

    assign cmp_res = (rx_mux == 8'd0) ? 1'd1 : 1'd0;

endmodule
