`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 07:13:59 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input button_in,
    input clk_in,
    input reset_in,
    output reg button_out
    );
    
    reg deb_count_e;
    reg [19:0]count;
    
    always @ (posedge clk_in or negedge reset_in) begin
        if(!reset_in) begin
            count <= 0;
            deb_count_e <=0;
            button_out <= 0;
        end else begin
            if(button_in == 1) begin          
               if (deb_count_e == 0) begin
                   count <= count + 1;
                        if(count == 100000) begin //count reaching specified maximum value
                            button_out <= 1;
                            deb_count_e <= 1;
                            count <= 0;
                        end
                end else begin
                button_out <= 0;
                end
            end else begin
            button_out <=0;
            count <=0;
            deb_count_e <=0;
        end   
        end
    end
endmodule
