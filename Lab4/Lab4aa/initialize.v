`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:30 11/23/2015 
// Design Name: 
// Module Name:    initialize
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
module initialize(
	input clk,
	input enable,
	input ROT,
	input fast,
	output [3:0] num_players,
	output [19:0] in
    );
	
	reg ROT_d;
	reg ROT_dd;
	reg [2:0] num = 3'b0;
	reg [3:0] num_players;
	reg [19:0] in;
	
	initial begin
		in[19:15] = 5'd10; // s
		in[14:10] = 5'd11; // e
		in[9:5] = 5'd12; // t
	end
	
	always @ (posedge fast) begin
        ROT_dd <= ROT_d;
        ROT_d <= ROT;
    end

    always @ (posedge clk) begin
		if (enable) begin
			if (ROT_d && !ROT_dd && fast == 1) begin
				num <= num + 1;
			end	
		end
	end
	
	always @* begin
		num_players = num + 1;
		in[4:0] = {0,num_players};
	end
	
endmodule
