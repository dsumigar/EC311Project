`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 06:04:21 PM
// Design Name: 
// Module Name: clock_top_tb
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


module clock_top_tb(

    );
    reg clk_1khz;
    reg reset_in;
    reg switch;
    wire [26:0] digit;

    clock_top C1 (.clk_1khz(clk_1khz), .reset_in(reset_in), .switch(switch), .digit(digit));
    
    always #10 clk_1khz = ~clk_1khz;
    
    initial begin
    clk_1khz <= 0;
    reset_in <= 0;
    switch <= 0;
    
    #20 reset_in <= 1;
    
    end

endmodule
