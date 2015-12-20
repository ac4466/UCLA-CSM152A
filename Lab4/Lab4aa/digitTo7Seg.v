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
    input [4:0] digit,
    output [7:0] seg
    );

    wire [4:0] digit;
    reg [7:0] seg;
    
    always @* begin
        case (digit)
            5'd0: seg = 8'b00111111;
            5'd1: seg = 8'b00000110;
            5'd2: seg = 8'b01011011;
            5'd3: seg = 8'b01001111;
            5'd4: seg = 8'b01100110;
            5'd5: seg = 8'b01101101;
            5'd6: seg = 8'b01111101;
            5'd7: seg = 8'b00000111;
            5'd8: seg = 8'b01111111;
            5'd9: seg = 8'b01100111;
			5'd10: seg = 8'b01101101; // s
			5'd11: seg = 8'b01111001; // e
			5'd12: seg = 8'b01111000; // t
            5'd13: seg = 8'b01111100; // b
            5'd14: seg = 8'b01110011; // p
			5'd15: seg = 8'b01000000; // -
            default: seg = 8'b00000000;
        endcase
        seg = ~seg;
    end
endmodule
