`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 13:43:14
// Design Name: 
// Module Name: param_and
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


module param_and
# (
    parameter INPUT_NR=8
    )
 (
 //input ports
 input [INPUT_NR-1:0]x,
 //output ports
 output y
 );
 //module content
 wire [INPUT_NR-2:0] temp;
 genvar i;
 generate
    assign temp[0] = x[0] & x[1];
    for(i=1;i<INPUT_NR-1;i=i+1)
    begin : gate_loop
        assign temp[i] = temp[i-1] & x[i+1];
    end
 endgenerate 
 assign y = temp[INPUT_NR-2];
endmodule
