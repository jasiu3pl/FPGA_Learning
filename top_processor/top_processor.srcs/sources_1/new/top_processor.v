`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 13:00:39
// Design Name: 
// Module Name: top_processor
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


module top_processor(
    input clk,
    input wire [3:0] sw,
    input wire [3:0] btn,
    output wire [3:0] led,
    output wire eth_rst_b
    );

    assign eth_rst_b = ~btn[0];

    wire [31:0] instr;
    wire [7:0] imm    = instr[7:0];
    wire [2:0] d_op   = instr[10:8];
    wire       rd_op  = instr[11];
    wire [2:0] ry_op  = instr[14:12];
    wire       imm_op = instr[15];
    wire [2:0] rx_op  = instr[18:16];
    wire [1:0] alu_op = instr[21:20];
    wire [1:0] pc_op  = instr[25:24];

    wire [7:0] led_out;
    wire [7:0] rx_out;
    wire [7:0] ry_out;
    wire [7:0] imm_mux_out;
    wire [7:0] rd_mux_out;
    wire [7:0] alu_res;
    wire [7:0] next_pc;
    wire [7:0] mem_data;
    wire       cmp_res;
    reg  [7:0] pc = 8'd0;

    assign imm_mux_out = (imm_op == 1'd1) ? imm : ry_out;
    assign rd_mux_out  = (rd_op == 1'd1)  ? mem_data : alu_res;

    always @(posedge clk ) begin
        case (pc_op)
            2'b00: pc <= pc + 1;
            2'b01: pc <= alu_res; 
            2'b10: pc <= (cmp_res == 1'b0) ? alu_res : pc + 8'd1; 
            2'b11: pc <= (cmp_res == 1'b1) ? alu_res : pc + 8'd1; 
            default: pc <= 8'd0;
        endcase
    end

    alu ALU (
        .rx_mux(rx_out),
        .imm_mux(imm_mux_out),
        .alu_op(alu_op),
        .alu_res(alu_res),
        .cmp_res(cmp_res)
    );

    reg_file registers (
        .clk(clk),
        .rx_op(rx_op),
        .ry_op(ry_op),
        .d_op(d_op),
        .alu_res(rd_mux_out),
        .pc_val(pc),
        .rx_out(rx_out),
        .ry_out(ry_out),
        .gpi({4'b0000, sw}),
        .gpo(led_out)
    );

    i_mem instr_memory (
        .address(pc),
        .data(instr)
    );

    d_mem deta_memory (
        .address(alu_res),
        .data(mem_data)
    );

    assign led[3] = clk;
    assign led[2:0] = led_out[2:0];
endmodule
