`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 10:00:02 PM
// Design Name: 
// Module Name: clock_top
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


module clock_top(
    input clk_1khz,
    input reset_in,
    input switch,
    output [26:0] digit
    );
    
    reg [9:0] ms;
    reg [5:0] sec, min;
    reg [4:0] hr;
    
    always @ (posedge clk_1khz or negedge reset_in) begin
        if (switch) begin // 24 Hour Clock if switch = 1
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
        end else if (~switch) begin // 12 Hour Clock if switch = 0
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
                            if (hr == 12) begin
                            hr <= 1;
                            end
                        end
                    end
                end
            end        
        end 
    end
  
    assign digit = {hr, min, sec, ms};
    
endmodule
