`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 15:10:33
// Design Name: 
// Module Name: tb_param_and
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


module tb_param_and;
reg [7:0] test_in;
wire test_out;
integer k;

param_and dut
(
    .x(test_in),
    .y(test_out)
);

initial
begin
    $monitor("Czas: %0t | x = %b | y = %b", $time, test_in, test_out);
    for(k = 0; k < 256; k = k + 1)
    begin : simulation_loop
        #10; test_in = k;
    end
end

endmodule
