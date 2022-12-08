`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 09:53:36 PM
// Design Name: 
// Module Name: stopwatch_top
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


module stopwatch_top(
    input clk_1khz,
    input reset_in,
    input start,
    output [26:0] digit
    );
    
    reg [9:0] ms;
    reg [5:0] sec, min;
    reg [4:0] hr;
    reg mode;
    
    //  Start/Stop register control (SR Latch)
    always @ (*) begin
        if (start)
            mode <= 1;
        else if (~start)
            mode <= 0;
    end
    
    always @ (posedge clk_1khz or negedge reset_in) begin
        if (mode) begin // If mode = 1, stopwatch starts
        if (!reset_in) begin
            ms <= 0;
            sec <= 0;
            min <= 0;
            hr <= 0;
            end
            else if (clk_1khz == 1'b1) begin
                ms <= ms + 1; //Increment ms
                if (ms == 999) begin
                    ms <= 0;
                    sec <= sec + 1; //Increment sec
                    if (sec == 59) begin
                        sec <= 0;
                        min <= min + 1;
                        if (min == 59) begin
                            min <= 0;
                            hr <= hr + 1;
                            if (hr == 23) begin
                            hr <= 0;
                            end
                        end
                    end
                end
            end
        end else if (~mode) begin // If mode = 0, stopwatch is paused
            if (!reset_in) begin
                ms <= 0;
                sec <= 0;
                min <= 0;
                hr <= 0;
            end
            else if (clk_1khz == 1'b1) begin
                ms <= ms;
                sec <= sec;
                min <= min;
                hr <= hr;      
            end 
        end
    end
  
    assign digit = {hr, min, sec, ms};
        
endmodule
