`timescale 1ns / 1ps
`define INITIAL 4'b0000
`define CHOOSE 4'b0001
`define VIEW_TOK 4'b0010
`define BET_AMT 4'b0011
`define VIEW_CARD 4'b0100
`define FINAL 4'b0101
`define WIN 4'b0110
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:04 11/19/2015 
// Design Name: 
// Module Name:    select_function 
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
module select_function(
	input clk,
    input [3:0] state,
    output [6:0] which_module
    );
	
	reg [6:0] which_module;

    always @ (posedge clk) begin
        case (state)
			`INITIAL: begin
				which_module <= 7'b0000001;
				end
			`CHOOSE: begin
				which_module <= 7'b0000010;
				end
			`VIEW_TOK: begin
				which_module <= 7'b0000100;
				end
			`BET_AMT: begin
				which_module <= 7'b0001000;
				end
			`VIEW_CARD: begin
				which_module <= 7'b0010000;
				end
			`FINAL: begin
				which_module <= 7'b0100000;
				end
			`WIN: begin
				which_module <= 7'b1000000;
				end
		endcase
	end

endmodule
