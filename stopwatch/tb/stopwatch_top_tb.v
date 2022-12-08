`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 10:23:54 PM
// Design Name: 
// Module Name: stopwatch_top_tb
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


module stopwatch_top_tb(

    );
    reg clk_1khz;
    reg reset_in;
    reg start;
    wire [26:0] digit;
    
    stopwatch_top ST (.clk_1khz(clk_1khz), .reset_in(reset_in), .start(start), .digit(digit));
    
    always #10 clk_1khz = ~clk_1khz;
    
    initial begin
    clk_1khz <= 0;
    reset_in <= 0;
    start <= 0;
    
    #20 reset_in <= 1;
    
    #2000 start <= 1;
    
    #1000 start <= 0;
    
    end
endmodule
