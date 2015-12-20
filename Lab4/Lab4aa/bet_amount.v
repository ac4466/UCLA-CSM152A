`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:48 12/01/2015 
// Design Name: 
// Module Name:    bet_amount 
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
module bet_amount(
    input clk,
    input enable,
    input fast,
    input ROT,
    input [3:0] num_players,
    input [9:0] tokens1,
    input [9:0] tokens2,
    input [9:0] tokens3,
    input [9:0] tokens4,
    input [9:0] tokens5,
    input [9:0] tokens6,
    input [9:0] tokens7,
    input [9:0] tokens8,
    input [7:0] sw,
	input new_game,
	inout [7:0] JA,
    output [9:0] bet1,
    output [9:0] bet2,
    output [9:0] bet3,
    output [9:0] bet4,
    output [9:0] bet5,
    output [9:0] bet6,
    output [9:0] bet7,
    output [9:0] bet8,
    output [19:0] ba
    );
    		
    reg [9:0] bet1 = 5;
    reg [9:0] bet2 = 5;
    reg [9:0] bet3 = 5;
    reg [9:0] bet4 = 5;
    reg [9:0] bet5 = 5;
    reg [9:0] bet6 = 5;
    reg [9:0] bet7 = 5;
    reg [9:0] bet8 = 5;
    reg [19:0] ba;

    reg ROT_d;
    reg ROT_dd;
	
	wire [9:0] cur_disp_val;
	wire [3:0] new_digit;
	wire data;
    reg data_d;
	reg new_game_d;
    reg enable_d;
	reg fresh = 1;

	Decoder decoder_(
		.clk(clk),
		.Row(JA[7:4]),
		.Col(JA[3:0]),
		.DecodeOut(new_digit),
		.data(data)
		);

	assign cur_disp_val = (ba[19:15]*1000) + (ba[14:10]*100) + (ba[9:5]*10) + (ba[4:0]);
	
    always @ (posedge clk) begin
		data_d <= data;
		new_game_d <= new_game;
        enable_d <= enable;
	end
    
    always @ (posedge fast) begin
        ROT_dd <= ROT_d;
        ROT_d <= ROT;
	end
	
    always @ (posedge clk) begin
		if (new_game != new_game_d) begin
			bet1 <= 10'd5;
			bet2 <= 10'd5;
			bet3 <= 10'd5;
			bet4 <= 10'd5;
			bet5 <= 10'd5;
			bet6 <= 10'd5;
			bet7 <= 10'd5;
			bet8 <= 10'd5;
		end	
        else if (!enable_d && enable)
            fresh <= 1;
        else if (enable) begin
           	if (sw[0] == 1 && (sw[7:1] == 0)) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet1 / 1000;
                    ba[14:10] <= (bet1 / 100) % 10;
                    ba[9:5] <= (bet1 / 10) % 10;
                    ba[4:0] <= bet1 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens1)
						bet1 <= cur_disp_val;
				end
			end
			else if (sw[1] == 1 && (sw[7:2] == 0 && sw[0] == 0) && num_players >= 2) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet2 / 1000;
                    ba[14:10] <= (bet2 / 100) % 10;
                    ba[9:5] <= (bet2 / 10) % 10;
                    ba[4:0] <= bet2 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens2)
						bet2 <= cur_disp_val;
				end
			end
			else if (sw[2] == 1 && (sw[7:3] == 0 && sw[1:0] == 0) && num_players >= 3) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet3 / 1000;
                    ba[14:10] <= (bet3 / 100) % 10;
                    ba[9:5] <= (bet3 / 10) % 10;
                    ba[4:0] <= bet3 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens3)
						bet3 <= cur_disp_val;
				end
			end
			else if (sw[3] == 1 && (sw[7:4] == 0 && sw[2:0] == 0) && num_players >= 4) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet4 / 1000;
                    ba[14:10] <= (bet4 / 100) % 10;
                    ba[9:5] <= (bet4 / 10) % 10;
                    ba[4:0] <= bet4 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens4)
						bet4 <= cur_disp_val;
				end
			end
			else if (sw[4] == 1 && (sw[7:5] == 0 && sw[3:0] == 0) && num_players >= 5) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet5 / 1000;
                    ba[14:10] <= (bet5 / 100) % 10;
                    ba[9:5] <= (bet5 / 10) % 10;
                    ba[4:0] <= bet5 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens5)
						bet5 <= cur_disp_val;
				end
			end
			else if (sw[5] == 1 && (sw[7:6] == 0 && sw[4:0] == 0) && num_players >= 6) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet6 / 1000;
                    ba[14:10] <= (bet6 / 100) % 10;
                    ba[9:5] <= (bet6 / 10) % 10;
                    ba[4:0] <= bet6 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens6)
						bet6 <= cur_disp_val;
				end
			end
			else if (sw[6] == 1 && (sw[7] == 0 && sw[5:0] == 0) && num_players >= 7) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet7 / 1000;
                    ba[14:10] <= (bet7 / 100) % 10;
                    ba[9:5] <= (bet7 / 10) % 10;
                    ba[4:0] <= bet7 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens7)
						bet7 <= cur_disp_val;
				end
			end
			else if (sw[7] == 1 && (sw[6:0] == 0) && num_players == 8) begin
                if (!data_d && data) begin
					fresh <= 0;
					
                    ba[19:15] <= ba[14:10];
                    ba[14:10] <= ba[9:5];
                    ba[9:5] <= ba[4:0];
                    ba[4:0] <= {0, new_digit};
                end
                else if (fresh) begin
                    ba[19:15] <= bet8 / 1000;
                    ba[14:10] <= (bet8 / 100) % 10;
                    ba[9:5] <= (bet8 / 10) % 10;
                    ba[4:0] <= bet8 % 10;
                end
				
				if (!ROT_dd && ROT_d) begin
					if (cur_disp_val <= tokens8)
						bet8 <= cur_disp_val;
				end
			end
			else begin
				fresh <= 1;
				ba[19:15] <= 5'd15;
				ba[14:10] <= 5'd15;
				ba[9:5] <= 5'd15;
				ba[4:0] <= 5'd15;
			end

        end
    end
    
endmodule
