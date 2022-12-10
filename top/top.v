`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 12:21:32 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk_100Mhz,
    input reset_in,
    input [1:0] mode_select,
    input start,
    input switch,
    input hr_inc,
    input min_inc,
    input sec_inc,
    output [6:0] segment,
    output [7:0] digit_select
    );
    
    wire clk_1khz, sec, min, hr, led, inc;
    wire [26:0] digit_clock, digit_stopwatch, digit_timer, binary;
    wire [7:0] digit_select;
    wire [1:0] mode;
    
    clock_divider_1khz CD (.clk_in(clk_100Mhz), .reset_in(reset_in), .clk_out(clk_1khz));
    debouncer DBSEC (.button_in(sec_inc), .clk_in(clk_100Mhz), .reset_in(reset_in), .button_out(sec));
    debouncer DEBMIN (.button_in(min_inc), .clk_in(clk_100Mhz), .reset_in(reset_in), .button_out(min));
    debouncer DEBHR (.button_in(hr_inc), .clk_in(clk_100Mhz), .reset_in(reset_in), .button_out(hr));
    debouncer DEBMODE (.button_in(mode_select), .clk_in(clk_100Mhz), .reset_in(reset_in), .button_out(inc));
    clock_top CLOCK (.clk_1khz(clk_1khz), .reset_in(reset_in), .switch(switch), .digit(digit_clock));
    stopwatch_top SW (.clk_1khz(clk_1khz), .reset_in(reset_in), .start(start), .digit(digit_stopwatch));
    timer_top TIMER (.clk_1khz(clk_1khz), .reset_in(reset_in), .start(start), .hr_inc(hr), .min_inc(min), .sec_inc(sec), .digit(digit_timer), .led(led));
    count_mode COUNT (.clk_100Mhz(clk_100Mhz), .reset_in(reset_in), .inc(inc), .mode_select(mode));
    display_control DSC (.clk_100Mhz(clk_100Mhz), .mode_select(mode), .time_in_clock(digit_clock), .time_in_stopwatch(digit_stopwatch), .time_in_timer(digit_timer), .reset_in(reset_in), .digit_select(digit_select), .binary(binary));
    seven_segment_decoder SD (.binary(binary), .segment(segment));
    
endmodule
