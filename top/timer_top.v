`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 11:48:18 AM
// Design Name: 
// Module Name: timer_top
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


module timer_top(
    input clk_1khz,
    input reset_in,
    input start, //start/pause mode switch
    input hr_inc,
    input min_inc,
    input sec_inc,
    output [26:0] digit,
    output reg led
    );

    reg [9:0] ms = 0;
    reg [5:0] sec = 0;
    reg [5:0] min = 0;
    reg [4:0] hr = 0;
    reg mode;
    
    //  Start/Stop register control (SR Latch)
    always @ (*) begin
        if (start)
            mode <= 1;
        else if (~start)
            mode <= 0;
    end
    
    always @ (posedge clk_1khz or negedge reset_in) begin
        if (!reset_in) begin //Clear the time inputs if reset is pressed
             hr <= 0;
             min <= 0;
             sec <= 0;
             ms <= 0;
         end 
         else begin if (hr_inc && hr < 23) // If hr_inc is pushed and hr is below the max of 23 hours, increment the hour.
            hr <= hr + 1;
            if (min_inc && min < 59) //If min_inc is pushed and min is below the max of 59 minutes, increment the minute.
            min <= min + 1;
                if (sec_inc && sec < 59) //If sec_inc is pushed and sec is below the max of 59 minutes, increment the second.
                sec <= sec + 1;
                    if (clk_1khz && ms < 999) //At every clock cycle, ms will increment, stopping at 999
                     ms <= ms + 1;
         end
         if (mode) begin //Mode is high, timer begins decrementing
            if (!reset_in) begin //Clear the time inputs if reset is pressed
             hr <= 0;
             min <= 0;
             sec <= 0;
             ms <= 0;  
             end      
            if (min == 0 && hr > 0) begin // Decrement the hour once the minutes reach 0. Reset the min to 59
                hr <= hr - 1;
                min <= 59;
                sec <= 59;
                ms <= 999;
            end
            if (sec == 0 && min > 0) begin // Decrement the minute once the seconds reach 0. Reset the sec to 59
                min <= min - 1;
                sec <= 59;
                ms <= 999;
            end
            if (ms == 0 && sec > 0) begin //Decrement the second once the ms reach 0. Reset the ms to 999
                sec <= sec - 1;
                ms <= 999;
            end
            if (ms < 999 && ms > 0) begin // Decrement the ms while it is in between the values 999 and 0
                ms <= ms - 1;
            end
            if (ms == 0 && sec == 0 && min == 0 && hr == 0) begin //LED turns on when the countdown has finished
                led <= 1;
           end
      end
      else if (~mode) begin //If mode = 0, pause the timer
        if (!reset_in) begin //If reset is pushed, the time values are cleared to 0.
            ms <= 0;
            sec <= 0;
            min <= 0;
            hr <= 0;
        end
        else if (clk_1khz == 1'b1) begin //Pause count by holding onto the value stored in each time unit
            ms <= ms;
            sec <= sec;
            min <= 0;
            hr <= 0;
        end
      end
    end
    
    assign digit = {hr, min, sec, ms};
            
endmodule
