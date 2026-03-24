`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 23:18:18
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input rst,
    input send,
    input [7:0]data,
    output reg txd
    );
    localparam STATE_IDLE = 2'd0;
    localparam STATE_START = 2'd1;
    localparam STATE_DATA = 2'd2;
    localparam STATE_STOP = 2'd3;

    reg last_send = 0;
    reg [1:0]state = STATE_IDLE;
    reg [7:0]elems = 8'b0;
    reg [2:0]cnt = 3'b0;

    always @(posedge clk ) begin
        if (rst) begin
            state <= STATE_IDLE;
            last_send <= 0;
            elems <= 8'b0;
            cnt <= 3'b0;
            txd <= 0;
        end
        else begin
           case (state)
            STATE_IDLE:
            begin
                if(last_send == 0 && send == 1) begin
                    elems <= data;
                    state <= STATE_START;
                end
            end
            STATE_START: 
            begin
                txd <= 1'b1;
                state <= STATE_DATA;
                cnt <= 3'b0;
            end
            STATE_DATA:
            begin
                txd <= elems[cnt];
                if (cnt == 3'd7) state <= STATE_STOP;
                else begin
                    cnt <= cnt + 1'b1;
                end
            end
            STATE_STOP:
            begin
                txd <= 1'b0;
                state <= STATE_IDLE;
            end
           endcase
           last_send <= send; 
        end
    end

endmodule
