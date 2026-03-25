`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2026 11:27:34
// Design Name: 
// Module Name: verify
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


module verify(
    input txd
    );
    integer i;
    integer file;

    initial begin
        file = $fopen("state_machine.txt", "w");
        #30;
        for (i = 0; i < 192; i = i + 1) begin
            #2;
            $fwrite(file, "%b", txd);
        end
        $fclose(file);
    end
endmodule
