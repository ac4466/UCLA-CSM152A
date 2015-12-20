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
// Create Date:    12:06:16 11/19/2015 
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
    input clk,
    input ENTR,
    input CHSE,
    input AMT,
    input VIEW,
    input fast,
    output [3:0] state
    );

    reg [3:0] state = `INITIAL;
    reg [7:0] Led;
    
    reg ENTR_d;
    reg CHSE_d;
    reg AMT_d;
    reg VIEW_d;
    reg ENTR_dd;
    reg CHSE_dd;
    reg AMT_dd;
    reg VIEW_dd;
    integer round = 0;
    
    always @ (posedge fast) begin
        ENTR_dd <= ENTR_d;
        ENTR_d <= ENTR;
        CHSE_dd <= CHSE_d;
        CHSE_d <= CHSE;
        AMT_dd <= AMT_d;
        AMT_d <= AMT;
        VIEW_dd <= VIEW_d;
        VIEW_d <= VIEW;
    end

    always @ (posedge clk) begin
        case (state)
            `INITIAL: begin
                if (ENTR_d && !ENTR_dd && fast == 1)
                    state <= `CHOOSE;
                end
            `CHOOSE: begin
                if (ENTR_d && !ENTR_dd && fast == 1) begin
                    state <= `VIEW_CARD;
                    end
                else if (AMT_d && !AMT_dd && fast == 1)
                    state <= `BET_AMT;
                else if (VIEW_d && !VIEW_dd && fast == 1)
                    state <= `VIEW_TOK;
                end
            `VIEW_TOK: begin
                if (CHSE_d && !CHSE_dd && fast == 1)
                    state <= `CHOOSE;
                else if (AMT_d && !AMT_dd && fast == 1)
                    state <= `BET_AMT;
                end
            `BET_AMT: begin
                if (CHSE_d && !CHSE_dd && fast == 1)
                    state <= `CHOOSE;
                else if (VIEW_d && !VIEW_dd && fast == 1)
                    state <= `VIEW_TOK;
                end
            `VIEW_CARD: begin
                if (ENTR_d && !ENTR_dd && fast == 1)
                    begin
                    state <= `FINAL;
                    round = round + 1;
                    end
                end
            `FINAL: begin
                if (ENTR_d && !ENTR_dd && fast == 1 && round == 6)
                    state <= `WIN;
                else if (ENTR_d && !ENTR_dd && fast == 1)
                    state <= `CHOOSE;
                end
            `WIN: begin
                if (ENTR_d && !ENTR_dd && fast == 1)
                    begin
                    state <= `INITIAL;
                    round = 0;
                    end
                end
        endcase
    end

endmodule
