`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:45 11/25/2015 
// Design Name: 
// Module Name:    view_tokens 
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
module view_tokens(
    input enable,
    input [7:0] sw,
	input [3:0] num_players,
	input [9:0] tokens1,
	input [9:0] tokens2,
	input [9:0] tokens3,
	input [9:0] tokens4,
	input [9:0] tokens5,
	input [9:0] tokens6,
	input [9:0] tokens7,
	input [9:0] tokens8,
    output [19:0] vt
    );

	reg [19:0] vt;
	
	always @* begin
//		if (sw&(sw-1) == 0) begin
			if (sw[0] == 1 && (sw[7:1] == 0)) begin
				vt[19:15] = tokens1 / 1000;
				vt[14:10] = (tokens1 / 100) % 10;
				vt[9:5] = (tokens1 / 10) % 10;
				vt[4:0] = tokens1 % 10;
			end
			else if (sw[1] == 1 && (sw[7:2] == 0 && sw[0] == 0) && num_players >= 2) begin
				vt[19:15] = tokens2 / 1000;
				vt[14:10] = (tokens2 / 100) % 10;
				vt[9:5] = (tokens2 / 10) % 10;
				vt[4:0] = tokens2 % 10;
			end
			else if (sw[2] == 1 && (sw[7:3] == 0 && sw[1:0] == 0) && num_players >= 3) begin
				vt[19:15] = tokens3 / 1000;
				vt[14:10] = (tokens3 / 100) % 10;
				vt[9:5] = (tokens3 / 10) % 10;
				vt[4:0] = tokens3 % 10;
			end
			else if (sw[3] == 1 && (sw[7:4] == 0 && sw[2:0] == 0) && num_players >= 4) begin
				vt[19:15] = tokens4 / 1000;
				vt[14:10] = (tokens4 / 100) % 10;
				vt[9:5] = (tokens4 / 10) % 10;
				vt[4:0] = tokens4 % 10;
			end
			else if (sw[4] == 1 && (sw[7:5] == 0 && sw[3:0] == 0) && num_players >= 5) begin
				vt[19:15] = tokens5 / 1000;
				vt[14:10] = (tokens5 / 100) % 10;
				vt[9:5] = (tokens5 / 10) % 10;
				vt[4:0] = tokens5 % 10;
			end
			else if (sw[5] == 1 && (sw[7:6] == 0 && sw[4:0] == 0) && num_players >= 6) begin
				vt[19:15] = tokens6 / 1000;
				vt[14:10] = (tokens6 / 100) % 10;
				vt[9:5] = (tokens6 / 10) % 10;
				vt[4:0] = tokens6 % 10;
			end
			else if (sw[6] == 1 && (sw[7] == 0 && sw[5:0] == 0) && num_players >= 7) begin
				vt[19:15] = tokens7 / 1000;
				vt[14:10] = (tokens7 / 100) % 10;
				vt[9:5] = (tokens7 / 10) % 10;
				vt[4:0] = tokens7 % 10;
			end
			else if (sw[7] == 1 && (sw[6:0] == 0) && num_players == 8) begin
				vt[19:15] = tokens8 / 1000;
				vt[14:10] = (tokens8 / 100) % 10;
				vt[9:5] = (tokens8 / 10) % 10;
				vt[4:0] = tokens8 % 10;
			end
			else begin
				vt[19:15] = 5'd15;
				vt[14:10] = 5'd15;
				vt[9:5] = 5'd15;
				vt[4:0] = 5'd15;
			end
//		end
//		else begin
//			vt[19:15] = 5'd15;
//			vt[14:10] = 5'd15;
//			vt[9:5] = 5'd15;
//			vt[4:0] = 5'd15;
//		end
	end

endmodule
