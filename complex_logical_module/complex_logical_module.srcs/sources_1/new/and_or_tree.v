`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2026 13:33:05
// Design Name: 
// Module Name: and_or_tree
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


module and_or_tree(
    input [7:0] x,
    input [7:0] y,
    output z
    );
    wire [13:0] res;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_tree
            assign res[i] = x[i] & y[i];

            if (i % 2 == 0) begin
                assign res[(i/2) + 8] = res[i] | res[i+1]; 
            end
            if (i % 4 == 0) begin
                assign res[(i/4) + 12] = res[(i/2) + 8] & res[(i/2) + 9];
            end
            if (i % 8 == 0) begin
                assign z = res[12] | res[13];
            end 
        end
    endgenerate
endmodule
