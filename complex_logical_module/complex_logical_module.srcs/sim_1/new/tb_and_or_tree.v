`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2026 14:35:09
// Design Name: 
// Module Name: tb_and_or_tree
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


module tb_and_or_tree(
    );
    reg [7:0]x;
    reg [7:0]y;
    wire z;

    and_or_tree dut (
        .x(x),
        .y(y),
        .z(z)
    );
    initial begin
        //wejscie x0, y0
        x = 8'b0000_1001;
        y = 8'b0000_1001;

        #10;
        //wejscie x1, y1
        x = 8'b0000_1010;
        y = 8'b0000_1010;

        #10;
        //wejscie x2, y2
        x = 8'b0000_0101;
        y = 8'b0000_0101;

        #10;
        //wejscie x3, y3
        x = 8'b0000_1001;
        y = 8'b0000_1001;
        
        #10;
        //wejscie x4, y4
        x = 8'b1001_0000;
        y = 8'b1001_0000;

        #10;
        //wejscie x5, y5
        x = 8'b1010_0000;
        y = 8'b1010_0000;

        #10;
        //wejscie x6, y6
        x = 8'b0101_0000;
        y = 8'b0101_0000;

        #10;
        //wejscie x7, y7
        x = 8'b1001_0000;
        y = 8'b1001_0000;

        #10;
        //wejscie x0, y0, output 0
        x = 8'b0000_0000;
        y = 8'b0000_0000;

        #10;

        $finish;
    end
endmodule
