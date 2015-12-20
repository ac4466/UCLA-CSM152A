`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:20 11/26/2015 
// Design Name: 
// Module Name:    winner 
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
module winner(
	input clk,
    input enable,
	input [3:0] num_players,
    input [9:0] tokens1,
    input [9:0] tokens2,
    input [9:0] tokens3,
    input [9:0] tokens4,
    input [9:0] tokens5,
    input [9:0] tokens6,
    input [9:0] tokens7,
    input [9:0] tokens8,
    output [19:0] wi,
    output new_game
    );

	reg [19:0] wi;
	reg new_game = 0;
	
	reg enable_d;
	integer highest = 0;
	
	reg [9:0] tokens [0:7];
    
    reg [3:0] count = 0;
	
	always @* begin
		tokens[0] = tokens1;
		tokens[1] = tokens2;
		tokens[2] = tokens3;
		tokens[3] = tokens4;
		tokens[4] = tokens5;
		tokens[5] = tokens6;
		tokens[6] = tokens7;
		tokens[7] = tokens8;
	end
	
	always @ (posedge clk) begin
		if (enable && !enable_d) begin
			new_game <= ~new_game;
			highest <= num_players-1;
            count <= 0;
		end
		else begin
            case (count)
                1: begin
                    highest <= count;
                    count <= count + 1;
                end
                2: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                3: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                4: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                5: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                6: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                7: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
                8: begin
                    if (count < num_players && tokens[count]> tokens[highest]) begin
                        highest <= count;
                        count <= count + 1;
                    end
                end
            endcase
		end
	end
	
	always @* begin
		wi[19:15] = 5'd31;
		wi[14:10] = 5'd14;
		wi[9:5] = highest + 1;
		wi[4:0] = 5'd31;
	end
	
endmodule
