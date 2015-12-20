`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:39 11/25/2015 
// Design Name: 
// Module Name:    final_scores 
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
module final_scores(
    input clk,
    input enable,
	input new_game,
    input [3:0] card1,
    input [3:0] card2,
    input [3:0] card3,
    input [3:0] card4,
    input [3:0] card5,
    input [3:0] card6,
	input [9:0] bet1,
	input [9:0] bet2,
	input [9:0] bet3,
	input [9:0] bet4,
	input [9:0] bet5,
	input [9:0] bet6,
	input [9:0] bet7,
	input [9:0] bet8,
	input [7:0] Led,
    output [19:0] fn,
	output [9:0] tokens1,
	output [9:0] tokens2,
	output [9:0] tokens3,
	output [9:0] tokens4,
	output [9:0] tokens5,
	output [9:0] tokens6,
	output [9:0] tokens7,
	output [9:0] tokens8
    );
	

	reg [19:0] fn;

	reg [9:0] tokens1 = 10'd100;
	reg [9:0] tokens2 = 10'd100;
	reg [9:0] tokens3 = 10'd100;
	reg [9:0] tokens4 = 10'd100;
	reg [9:0] tokens5 = 10'd100;
	reg [9:0] tokens6 = 10'd100;
	reg [9:0] tokens7 = 10'd100;
	reg [9:0] tokens8 = 10'd100;
	
	reg enable_d;
	reg new_game_d;

	wire [5:0] p_sum;
	wire [5:0] b_sum;
	
	assign p_sum = (card1 + card2 + card3) % 10;
	assign b_sum = (card4 + card5 + card6) % 10;
	
    always @ (posedge clk) begin
        enable_d <= enable;
		new_game_d <= new_game;
    end

	always @ (posedge clk) begin
		if (new_game != new_game_d) begin
			tokens1 <= 10'd100;
			tokens2 <= 10'd100;
			tokens3 <= 10'd100;
			tokens4 <= 10'd100;
			tokens5 <= 10'd100;
			tokens6 <= 10'd100;
			tokens7 <= 10'd100;
			tokens8 <= 10'd100;
		end
		else if (enable && !enable_d) begin
			tokens1 <= ((Led[0] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[0] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens1 + bet1 : tokens1 - bet1;
			tokens2 <= ((Led[1] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[1] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens2 + bet2 : tokens2 - bet2;
			tokens3 <= ((Led[2] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[2] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens3 + bet3 : tokens3 - bet3;
			tokens4 <= ((Led[3] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[3] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens4 + bet4 : tokens4 - bet4;
			tokens5 <= ((Led[4] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[4] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens5 + bet5 : tokens5 - bet5;
			tokens6 <= ((Led[5] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[5] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens6 + bet6 : tokens6 - bet6;
			tokens7 <= ((Led[6] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[6] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens7 + bet7 : tokens7 - bet7;
			tokens8 <= ((Led[7] == 1 && b_sum[3:0] > p_sum[3:0]) || (Led[7] == 0 && p_sum[3:0] >= b_sum[3:0])) ? tokens8 + bet8 : tokens8 - bet8;
		end
	end
	
	always @* begin
		fn[19:15] = p_sum[4:0];
		fn[14:10] = 5'd31;
		fn[9:5] = 5'd31;
		fn[4:0] = b_sum[4:0];
	end

endmodule
