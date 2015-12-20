`timescale 1ns / 1ps
`define NORMAL 2'b00
`define PAUSE 2'b01
`define SELMIN 2'b10
`define SELSEC 2'b11
`define ONEHZ 1'b0
`define TWOHZ 1'b1

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:50 11/03/2015 
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
    input [1:0] state,
    input clock,
    output min_count,
    output sec_count,
    output min_clock_rate,
    output sec_clock_rate,
    output min_blink,
    output sec_blink
    );
    
    reg min_count;
    reg sec_count;
    reg min_clock_rate;
    reg sec_clock_rate;
    reg min_blink;
    reg sec_blink;

    always @ (posedge clock) begin
        case (state)
            `NORMAL: begin
                min_count <= 1;
                sec_count <= 1;
                min_clock_rate <= `ONEHZ;
                sec_clock_rate <= `ONEHZ;
                min_blink <= 0;
                sec_blink <= 0;
				end
            `PAUSE: begin
                min_count <= 0;
                sec_count <= 0;
                min_clock_rate <= `ONEHZ;
                sec_clock_rate <= `ONEHZ;
                min_blink <= 0;
                sec_blink <= 0;
				end
            `SELMIN: begin
                min_count <= 1;
                sec_count <= 0;
                min_clock_rate <= `TWOHZ;
                sec_clock_rate <= `ONEHZ;
                min_blink <= 1;
                sec_blink <= 0;
				end
            `SELSEC: begin
                min_count <= 0;
                sec_count <= 1;
                min_clock_rate <= `ONEHZ;
                sec_clock_rate <= `TWOHZ;
                min_blink <= 0;
                sec_blink <= 1;
				end
            default: $display("Invalid State");
        endcase
    end

endmodule
