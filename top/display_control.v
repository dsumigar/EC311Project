`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 11:02:37 AM
// Design Name: 
// Module Name: display_control
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


module display_control(
    input clk_100Mhz,
    input [1:0] mode_select,
    input [26:0] time_in_clock,
    input [26:0] time_in_stopwatch,
    input [26:0] time_in_timer,
    input reset_in,
    output reg [7:0] digit_select,
    output reg [26:0] binary
    );
      
    reg [2:0] count_out;
    wire [2:0] sel;
    
    always @ (posedge clk_100Mhz) begin
        if (!reset_in)
            count_out <= 0;
        else count_out <= count_out + 1;
        end
    
    assign sel = count_out;
    
    always @ (*) begin
        case (sel)
            3'b000: digit_select <= 8'b11111110;
            3'b001: digit_select <= 8'b11111101;
            3'b010: digit_select <= 8'b11111011;
            3'b011: digit_select <= 8'b11110111;
            3'b100: digit_select <= 8'b11101111;
            3'b101: digit_select <= 8'b11011111;
            3'b110: digit_select <= 8'b10111111;
            3'b111: digit_select <= 8'b01111111;
        endcase
    end
    
    always @ (*) begin
        case (mode_select)
            2'b001: binary <= time_in_clock;
            2'b010: binary <= time_in_stopwatch;
            2'b011: binary <= time_in_timer;
        endcase
    end
    
endmodule
