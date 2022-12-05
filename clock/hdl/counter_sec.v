`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 12:11:02 PM
// Design Name: 
// Module Name: counter_sec
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


module counter_sec(
    input clk_in,
    input reset_in,
    output reg [7:0] count_out
    );
    
    always @ (posedge clk_in or negedge reset_in) begin
        if(!reset_in) begin
            count_out <= 0;
        end else begin
            if (count_out == 59)
                count_out <= 0;
            else 
                count_out <= count_out + 1;
            end
        end
endmodule
