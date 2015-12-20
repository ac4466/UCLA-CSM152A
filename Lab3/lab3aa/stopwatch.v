`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:11 11/04/2015 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(
    input clk,
    input [1:0] sw,
    input btnP,
    input btnR,
	output [7:0] seg,
	output [3:0] an
    );

    wire [7:0] seg;
	wire [3:0] an;
	
    wire onehz;
    wire twohz;
    wire fourhz;
    wire fast;
    
    wire [31:0] min1;
    wire [31:0] min0;
    wire [31:0] sec1;
    wire [31:0] sec0;
    
    
    wire min_count;
    wire sec_count;
    wire min_clock_rate;
    wire sec_clock_rate;
    wire min_blink;
    wire sec_blink;

    wire [1:0] state;
 
	clock clock_(
		.master(clk),
		.one(onehz),
		.two(twohz),
		.four(fourhz),
		.fast(fast)
    );
   
	display_controller d_control(
		.clock(fast),
		.blink_clock(fourhz),
		.min_blink(min_blink),
		.sec_blink(sec_blink),
		.min1(min1),
		.min0(min0),
		.sec1(sec1),
		.sec0(sec0),
		.seg(seg),
		.an(an)
    );
    
	counter_controller c_control(
		.clock(clk),
		.reset(btnR),
		.min_count(min_count),
		.sec_count(sec_count),
		.min_clock_rate(min_clock_rate),
		.sec_clock_rate(sec_clock_rate),
		.onehz_clock(onehz),
		.twohz_clock(twohz),
		.min1(min1),
		.min0(min0),
		.sec1(sec1),
		.sec0(sec0)
    );
    
	select_function s_function(
		.state(state),
		.clock(clk),
		.min_count(min_count),
		.sec_count(sec_count),
		.min_clock_rate(min_clock_rate),
		.sec_clock_rate(sec_clock_rate),
		.min_blink(min_blink),
		.sec_blink(sec_blink)
    );

	state_controller s_control(
		.clock(clk),
		.fast(fast),
		.SEL(sw[1]),
		.ADJ(sw[0]),
		.pause(btnP),
		.next_state(state)
    );
    
endmodule
