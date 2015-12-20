`timescale 1ns / 1ps
`define DISP0 2'b00
`define DISP1 2'b01
`define DISP2 2'b10
`define DISP3 2'b11
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
	input clk,
	input [6:0] which_module,
    input [19:0] in,
    input [19:0] ch,
    input [19:0] vc,
    input [19:0] fn,
    input [19:0] vt,
    input [19:0] wi,
	input [19:0] ba,
	output [7:0] seg,
	output [3:0] an
    );
	
	wire [7:0] disp0_seg;
	wire [7:0] disp1_seg;
	wire [7:0] disp2_seg;
	wire [7:0] disp3_seg;
	
	reg [4:0] disp0_dig;
	reg [4:0] disp1_dig;
	reg [4:0] disp2_dig;
	reg [4:0] disp3_dig;
	
	reg [1:0] cur_display = `DISP0;
	reg [7:0] seg;
	reg [3:0] an;

	digitTo7Seg disp0(
		.digit(disp0_dig),
		.seg(disp0_seg)
	);
	
	digitTo7Seg disp1(
		.digit(disp1_dig),
		.seg(disp1_seg)
	);
	
	digitTo7Seg disp2(
		.digit(disp2_dig),
		.seg(disp2_seg)
	);
	
	digitTo7Seg disp3(
		.digit(disp3_dig),
		.seg(disp3_seg)
	);
	
	always @ (posedge clk) begin
		case (cur_display)
			`DISP3: begin
//				if (min_blink && blink_clock)
//					an <= 4'b1111;
//				else
					an <= 4'b0111;
				seg <= disp3_seg;
				cur_display <= `DISP2;
                end
			`DISP2: begin
//				if (min_blink && blink_clock)
//					an <= 4'b1111;
//				else
					an <= 4'b1011;
				seg <= disp2_seg;
				cur_display <= `DISP1;
				end
			`DISP1: begin
//				if (sec_blink && blink_clock)
//					an <= 4'b1111;
//				else
					an <= 4'b1101;
				seg <= disp1_seg;
				cur_display <= `DISP0;
				end
			`DISP0: begin
//				if (sec_blink && blink_clock)
//					an <= 4'b1111;
//				else
					an <= 4'b1110;
				seg <= disp0_seg;
				cur_display <= `DISP3;
                end
		endcase
	end
	
	always @* begin
		case (which_module)
			7'b0000001: begin // initial module
				disp0_dig = in[4:0];
				disp1_dig = in[9:5];
				disp2_dig = in[14:10];
				disp3_dig = in[19:15];
				end
			7'b0000010: begin // choose module
				disp0_dig = ch[4:0];
				disp1_dig = ch[9:5];
				disp2_dig = ch[14:10];
				disp3_dig = ch[19:15];
				end
			7'b0000100: begin // view tokens module
				disp0_dig = vt[4:0];
				disp1_dig = vt[9:5];
				disp2_dig = vt[14:10];
				disp3_dig = vt[19:15];
				end
			7'b0001000: begin // bet amount module
				disp0_dig = ba[4:0];
				disp1_dig = ba[9:5];
				disp2_dig = ba[14:10];
				disp3_dig = ba[19:15];
				end
			7'b0010000: begin // view cards module
				disp0_dig = vc[4:0];
				disp1_dig = vc[9:5];
				disp2_dig = vc[14:10];
				disp3_dig = vc[19:15];
				end
			7'b0100000: begin // final scores module
				disp0_dig = fn[4:0];
				disp1_dig = fn[9:5];
				disp2_dig = fn[14:10];
				disp3_dig = fn[19:15];
				end
			7'b1000000: begin // winner module
				disp0_dig = wi[4:0];
				disp1_dig = wi[9:5];
				disp2_dig = wi[14:10];
				disp3_dig = wi[19:15];
				end
			default: begin
				disp0_dig = 5'd31; // blank
				disp1_dig = 5'd31;
				disp2_dig = 5'd31;
				disp3_dig = 5'd31;
				end
		endcase
	end

endmodule
