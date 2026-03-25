`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2026 11:05:09
// Design Name: 
// Module Name: stimulate
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


module stimulate(
    output [7:0]data,
    output send
    );
    reg [7:0] data_reg = 8'b0;
    reg send_reg = 1'b0;
    integer i;
    integer file;

    assign data = data_reg;
    assign send = send_reg;

    initial begin
        file = $fopen("simulate_test.txt","r");
        #30;
        for (i = 0; i < 16 ; i = i + 1) begin
            data_reg = $fgetc(file);
            send_reg = 1'b1;
            #2;
            send_reg = 1'b0;
            #22;
        end
        $fclose(file);
    end


endmodule
