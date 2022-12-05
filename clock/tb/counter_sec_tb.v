`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 12:18:24 PM
// Design Name: 
// Module Name: counter_sec_tb
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


module counter_sec_tb(

    );
    
    reg clk_in;
    reg reset_in;
    wire [7:0] count_out;
    
    counter_sec CS (.clk_in(clk_in), .reset_in(reset_in), .count_out(count_out));
    
    always #10 clk_in = ~clk_in;
    
    initial begin
    clk_in <= 0;
    reset_in <= 0;
 
    
    #100 reset_in <= 1;
    
    #1500 reset_in <= 0;
    
    end
    
endmodule
