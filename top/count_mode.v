`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 07:47:31 PM
// Design Name: 
// Module Name: count_mode
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


module count_mode(
    input clk_100Mhz,
    input reset_in,
    input inc,
    output reg [1:0] mode_select
    );

    always @ (posedge clk_100Mhz or negedge reset_in) begin
        if(!reset_in)
            mode_select <= 0;
        else if(inc)
            mode_select <= mode_select + 1;
    end
endmodule
