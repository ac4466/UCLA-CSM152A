`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:33 11/19/2015 
// Design Name: 
// Module Name:    bacarrat 
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
module bacarrat(
    input clk,
    input [7:0] sw,
    input btnE,
    input btnR,
    input btnC,
    input btnA,
    input btnV,
	inout [7:0] JA,
    output [7:0] Led,
	output [7:0] seg,
	output [3:0] an
    );
    
    wire fast;
	
	wire [3:0] state;
	wire [6:0] which_module;
	wire [3:0] num_players;
	wire new_game;
	
	wire [3:0] card1;
	wire [3:0] card2;
	wire [3:0] card3;
	wire [3:0] card4;
	wire [3:0] card5;
	wire [3:0] card6;
	
	wire [9:0] tokens1;
	wire [9:0] tokens2;
	wire [9:0] tokens3;
	wire [9:0] tokens4;
	wire [9:0] tokens5;
	wire [9:0] tokens6;
	wire [9:0] tokens7;
	wire [9:0] tokens8;

	wire [9:0] bet1;
	wire [9:0] bet2;
	wire [9:0] bet3;
	wire [9:0] bet4;
	wire [9:0] bet5;
	wire [9:0] bet6;
	wire [9:0] bet7;
	wire [9:0] bet8;
	
	wire [19:0] in;
	wire [19:0] ch;
	wire [19:0] vc;
	wire [19:0] fn;
	wire [19:0] vt;
	wire [19:0] wi;
	wire [19:0] ba;
    
state_controller state_controller_(
    .clk(clk),
    .ENTR(btnE),
    .CHSE(btnC),
    .AMT(btnA),
    .VIEW(btnV),
    .fast(fast),
	.state(state)
    );
    
clock clock_(
    .master(clk),
    .fast(fast)
    );

select_function select_function_(
	.clk(clk),
	.state(state),
	.which_module(which_module)
	);
	
display_controller display_controller_(
	.clk(fast),
	.which_module(which_module),
	.in(in),
    .ch(ch),
    .vc(vc),
    .fn(fn),
    .vt(vt),
	.wi(wi),
	.ba(ba),
	.seg(seg),
	.an(an)
	);
	
initialize initialize_(
	.clk(clk),
	.enable(which_module[0]),
	.ROT(btnR),
	.fast(fast),
	.num_players(num_players),
	.in(in)
	);
	
choose choose_(
    .clk(clk),
    .enable(which_module[1]),
    .sw(sw),
    .num_players(num_players),
    .ch(ch),
    .Led(Led)
    );
    
view_tokens view_tokens_(
	.enable(which_module[2]),
	.sw(sw),
	.num_players(num_players),
	.tokens1(tokens1),
	.tokens2(tokens2),
	.tokens3(tokens3),
	.tokens4(tokens4),
	.tokens5(tokens5),
	.tokens6(tokens6),
	.tokens7(tokens7),
	.tokens8(tokens8),
	.vt(vt)
	);

bet_amount bet_amount_(
	.clk(clk),
	.enable(which_module[3]),
	.fast(fast),
	.ROT(btnR),
	.num_players(num_players),
	.tokens1(tokens1),
	.tokens2(tokens2),
	.tokens3(tokens3),
	.tokens4(tokens4),
	.tokens5(tokens5),
	.tokens6(tokens6),
	.tokens7(tokens7),
	.tokens8(tokens8),
	.sw(sw),
	.new_game(new_game),
	.JA(JA),
	.bet1(bet1),
	.bet2(bet2),
	.bet3(bet3),
	.bet4(bet4),
	.bet5(bet5),
	.bet6(bet6),
	.bet7(bet7),
	.bet8(bet8),
	.ba(ba)
	);
	
view_cards view_cards_(
    .clk(clk),
    .fast(fast),
    .enable(which_module[4]),
    .ROT(btnR),
    .vc(vc),
	.card1(card1),
	.card2(card2),
	.card3(card3),
	.card4(card4),
	.card5(card5),
	.card6(card6)
    );
	
final_scores final_scores_(
	.clk(clk),
	.enable(which_module[5]),
	.new_game(new_game),
	.card1(card1),
	.card2(card2),
	.card3(card3),
	.card4(card4),
	.card5(card5),
	.card6(card6),
	.bet1(bet1),
	.bet2(bet2),
	.bet3(bet3),
	.bet4(bet4),
	.bet5(bet5),
	.bet6(bet6),
	.bet7(bet7),
	.bet8(bet8),
	.Led(Led),
	.fn(fn),
	.tokens1(tokens1),
	.tokens2(tokens2),
	.tokens3(tokens3),
	.tokens4(tokens4),
	.tokens5(tokens5),
	.tokens6(tokens6),
	.tokens7(tokens7),
	.tokens8(tokens8)
	);
	
winner winner_(
	.clk(clk),
	.enable(which_module[6]),
	.num_players(num_players),
	.tokens1(tokens1),
	.tokens2(tokens2),
	.tokens3(tokens3),
	.tokens4(tokens4),
	.tokens5(tokens5),
	.tokens6(tokens6),
	.tokens7(tokens7),
	.tokens8(tokens8),
	.wi(wi),
	.new_game(new_game)
	);

endmodule
