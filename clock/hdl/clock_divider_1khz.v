`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 07:33:34 PM
// Design Name: 
// Module Name: clock_divider_1khz
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


module clock_divider_1khz(
    input clk_in,
    input reset_in,
    output reg clk_out
    );
    
    reg [25:0] counter;
    
    always @ (posedge clk_in) begin
        if(!reset_in) begin
            clk_out <= 0;
            counter <= 49999;
        end else begin
            counter <= counter - 1;
            if(counter == 0) begin
                counter <= 49999;
                clk_out <= ~clk_out;
            end
        end
    end
   
endmodule
