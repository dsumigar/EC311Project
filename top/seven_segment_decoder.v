`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 11:25:08 AM
// Design Name: 
// Module Name: seven_segment_decoder
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


module seven_segment_decoder(
    input [26:0] binary,
    output reg [6:0] segment
    );
    
 always @ (*) begin
        case(binary)
        0: segment <= 7'b1000000;
        1: segment <= 7'b1111001;
        2: segment <= 7'b0100100;
        3: segment <= 7'b0110000;
        4: segment <= 7'b0011001;
        5: segment <= 7'b0010010;
        6: segment <= 7'b0000010;
        7: segment <= 7'b1111000;
        8: segment <= 7'b0000000;
        9: segment <= 7'b0010000;
        default: segment <= 7'b0001110;
        endcase
    end   
endmodule
