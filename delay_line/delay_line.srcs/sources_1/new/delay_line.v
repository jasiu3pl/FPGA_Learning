`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 23:07:31
// Design Name: 
// Module Name: delay_line
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


module delay_line #(
    parameter DELAY = 0,
    parameter N = 8
)(
    input clk,
    input [N-1:0]idata,
    output [N-1:0]odata    
);
    wire [N-1:0] tdata [DELAY:0];
    genvar i;
    generate
        if (DELAY == 0) begin
            assign odata = idata;
        end    
        else if (DELAY > 0) begin
            assign tdata[0] = idata;
            for(i = 0; i < DELAY; i = i + 1)
                begin : creating_delay_line
                register #(.N(N)) single_delay (
                    .clk(clk),
                    .idata(tdata[i]),
                    .odata(tdata[i+1])
                );
            end
            assign odata = tdata[DELAY];
        end        
    endgenerate
endmodule
