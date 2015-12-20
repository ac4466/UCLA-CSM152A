`timescale 1ns / 1ps
`define NORMAL 2'b00
`define PAUSE 2'b01
`define SELMIN 2'b10
`define SELSEC 2'b11
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:00 11/03/2015 
// Design Name: 
// Module Name:    state_controller 
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
module state_controller(
    input clock,
    input fast,
    input SEL,
    input ADJ,
    input pause,
    output [1:0] next_state
    );

    reg pause_d;
    reg pause_dd;
    reg [1:0] cur_state = `NORMAL;
    wire [1:0] next_state;
    
//       wire [17:0] clk_dv_inc;
//   reg [16:0]  clk_dv;
//   reg         clk_en;
//   reg         clk_en_d;
//
//    
//     assign clk_dv_inc = clk_dv + 1;

    always @ (posedge fast) begin
        pause_dd <= pause_d;
        pause_d <= pause;
    end
    
    always @ (posedge clock) begin
//          clk_dv   <= clk_dv_inc[16:0];
//          clk_en   <= clk_dv_inc[17];
//          clk_en_d <= clk_en;

        case (cur_state)
            `NORMAL: begin
                if (pause_d && !pause_dd && fast == 1)
                    cur_state <= `PAUSE;
                else if (ADJ == 1 && SEL == 0)
                    cur_state <= `SELMIN;
                else if (ADJ == 1 && SEL == 1)
                    cur_state <= `SELSEC;
                else
                    cur_state <= `NORMAL;
                end
            `PAUSE: begin
                if ((pause_d && !pause_dd && fast == 1) && ADJ == 0)
                    cur_state <= `NORMAL;
                else if ((pause_d && !pause_dd && fast == 1) && ADJ == 1 && SEL == 0)
                    cur_state <= `SELMIN;
                else if ((pause_d && !pause_dd && fast == 1) && ADJ == 1 && SEL == 1)
                    cur_state <= `SELSEC;
                else
                    cur_state <= `PAUSE;
                end
            `SELMIN: begin
                if (pause_d && !pause_dd && fast == 1)
                    cur_state <= `PAUSE;
                else if (ADJ == 0)
                    cur_state <= `NORMAL;
                else if (SEL == 1)
                    cur_state <= `SELSEC;
                else
                    cur_state <= `SELMIN;
                end
            `SELSEC: begin
                if (pause_d && !pause_dd && fast == 1)
                    cur_state <= `PAUSE;
                else if (ADJ == 0)
                    cur_state <= `NORMAL;
                else if (SEL == 0)
                    cur_state <= `SELMIN;
                else
                    cur_state <= `SELSEC;
                end
            default: $display("REACHED DEFAULT");
        endcase
    end
	
    assign next_state = cur_state;
	
endmodule
