`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:09 10/29/2015 
// Design Name: 
// Module Name:    digitTo7Seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module digitTo7Seg(
    input [3:0] digit,
    output [7:0] seg
    );

    wire [3:0] digit;
    reg [7:0] seg;
    
    always @* begin
        case (digit)
            4'd0: seg = 8'b00111111;
            4'd1: seg = 8'b00000110;
            4'd2: seg = 8'b01011011;
            4'd3: seg = 8'b01001111;
            4'd4: seg = 8'b01100110;
            4'd5: seg = 8'b01101101;
            4'd6: seg = 8'b01111101;
            4'd7: seg = 8'b00000111;
            4'd8: seg = 8'b01111111;
            4'd9: seg = 8'b01100111;
            default: seg = 8'b00000000;
        endcase
        seg = ~seg;
    end
endmodule
