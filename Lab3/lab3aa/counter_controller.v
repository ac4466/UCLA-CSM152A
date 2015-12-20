`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:28 11/03/2015 
// Design Name: 
// Module Name:    counter_controller 
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
module counter_controller(
    input clock,
    input reset,
    input min_count,
    input sec_count,
    input min_clock_rate,
    input sec_clock_rate,
    input onehz_clock,
    input twohz_clock,
    output [31:0] min1,
    output [31:0] min0,
    output [31:0] sec1,
    output [31:0] sec0
    );

    wire [31:0] min1;
    wire [31:0] min0;
    wire [31:0] sec1;
    wire [31:0] sec0;
    
    wire min0_tc;
    wire sec1_tc;
    wire sec0_tc;
    
    wire min_clock;
    wire sec_clock;
    
    modNcounter #(32'd6) min1_counter(
        .clock(min_clock),
        .reset(reset),
        .count((min_count && min0_tc && sec1_tc && sec0_tc) || (min_count && min0_tc && !sec_count)),
        .out(min1),
        .tc()
    );
	
    modNcounter #(32'd10) min0_counter(
        .clock(min_clock),
        .reset(reset),
        .count((min_count && sec1_tc && sec0_tc) || (min_count && !sec_count)),
        .out(min0),
        .tc(min0_tc)
    );
	
    modNcounter #(32'd6) sec1_counter(
        .clock(sec_clock),
        .reset(reset),
        .count(sec_count && sec0_tc),
        .out(sec1),
        .tc(sec1_tc)
    );
	
    modNcounter #(32'd10) sec0_counter(
        .clock(sec_clock),
        .reset(reset),
        .count(sec_count),
        .out(sec0),
        .tc(sec0_tc)
    );

    assign min_clock = min_clock_rate ? twohz_clock : onehz_clock;
    assign sec_clock = sec_clock_rate ? twohz_clock : onehz_clock;

endmodule
