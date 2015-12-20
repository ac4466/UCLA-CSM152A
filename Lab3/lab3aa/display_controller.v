`timescale 1ns / 1ps
`define MIN1 2'b00
`define MIN0 2'b01
`define SEC1 2'b10
`define SEC0 2'b11
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:20 11/03/2015 
// Design Name: 
// Module Name:    display_controller 
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
module display_controller(
	input clock,
    input blink_clock,
    input min_blink,
    input sec_blink,
    input [31:0] min1,
    input [31:0] min0,
    input [31:0] sec1,
    input [31:0] sec0,
	output [7:0] seg,
	output [3:0] an
    );
	
	wire [7:0] min1_display;
	wire [7:0] min0_display;
	wire [7:0] sec1_display;
	wire [7:0] sec0_display;
	
	reg [1:0] cur_display = `SEC0;
	reg [7:0] seg;
	reg [3:0] an;

	digitTo7Seg min1_seg(
		.digit(min1[3:0]),
		.seg(min1_display)
	);
	
	digitTo7Seg min0_seg(
		.digit(min0[3:0]),
		.seg(min0_display)
	);
	
	digitTo7Seg sec1_seg(
		.digit(sec1[3:0]),
		.seg(sec1_display)
	);
	
	digitTo7Seg sec0_seg(
		.digit(sec0[3:0]),
		.seg(sec0_display)
	);
	
	always @ (posedge clock) begin
		case (cur_display)
			`MIN1: begin
				if (min_blink && blink_clock)
					an <= 4'b1111;
				else
					an <= 4'b0111;
				seg <= min1_display;
				cur_display <= `MIN0;
                end
			`MIN0: begin
				if (min_blink && blink_clock)
					an <= 4'b1111;
				else
					an <= 4'b1011;
				seg <= min0_display;
				cur_display <= `SEC1;
				end
			`SEC1: begin
				if (sec_blink && blink_clock)
					an <= 4'b1111;
				else
					an <= 4'b1101;
				seg <= sec1_display;
				cur_display <= `SEC0;
				end
			`SEC0: begin
				if (sec_blink && blink_clock)
					an <= 4'b1111;
				else
					an <= 4'b1110;
				seg <= sec0_display;
				cur_display <= `MIN1;
                end
		endcase
	end

endmodule
