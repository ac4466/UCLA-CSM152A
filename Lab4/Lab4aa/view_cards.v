`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:42 11/24/2015 
// Design Name: 
// Module Name:    view_cards 
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
module view_cards(
    input clk,
    input fast,
    input enable,
    input ROT,
    output [19:0] vc,
	output [3:0] card1,
	output [3:0] card2,
	output [3:0] card3,
	output [3:0] card4,
	output [3:0] card5,
	output [3:0] card6
    );

	reg [19:0] vc;
	
    reg enable_d;
    reg ROT_d;
    reg ROT_dd;
    
    reg [3:0] card1;
    reg [3:0] card2;
    reg [3:0] card3;
    reg [3:0] card4;
    reg [3:0] card5;
    reg [3:0] card6;
	
	wire [4:0] card_sum_1_2;
	wire [4:0] card_sum_4_5;
	
    reg [2:0] which_card = 3'b001;
    integer count = 0;
    wire [31:0] stream;
    
    modNcounter #(32'd13) num_stream(
        .clock(clk),
        .reset(0),
        .count(1),
        .out(stream)
    );
	
	assign card_sum_1_2 = card1 + card2;
	assign card_sum_4_5 = card4 + card5;
    
    always @ (posedge clk) begin
        enable_d <= enable;
    end
    
    always @ (posedge fast) begin
        ROT_dd <= ROT_d;
        ROT_d <= ROT;
	end
	
    always @ (posedge clk) begin
		if (enable) begin
            if (!enable_d)
                which_card <= 3'b001;
			else if (ROT_d && !ROT_dd && fast == 1) begin
                if (which_card == 3'b110)
                    which_card <= 3'b001;
                else
                    which_card <= which_card + 1;
			end
		end
	end
    
    always @ (posedge clk) begin
        if (enable) begin
            if (!enable_d)
                count <= 0;
            case (which_card)
                3'b001: begin
                    vc[19:15] <= 5'd14; // p
                    vc[14:10] <= 5'd1; 
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card1}; 
                    if (count == 0) begin                      
                        count <= count + 1;
                        if (stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
                            card1 <= 4'd0;
                        else
                            card1 <= stream[3:0] + 1;                          
                        end
                    end
                3'b010: begin
                    vc[19:15] <= 5'd14; // p
                    vc[14:10] <= 5'd2; 
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card2}; 
                    if (count == 1) begin                      
                        count <= count + 1;
                        if (stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
                            card2 <= 4'd0;
                        else
                            card2 <= stream[3:0] + 1;                          
                        end
                    end
                3'b011: begin
                    vc[19:15] <= 5'd14; // p
                    vc[14:10] <= 5'd3;
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card3};
                    if (count == 2) begin
                        count <= count + 1;
                        if ((card_sum_1_2 % 10) > 5 || stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
                            card3 <= 4'd0;
                        else
                            card3 <= stream[3:0] + 1;
                        end
                    end
                3'b100: begin
                    vc[19:15] <= 5'd13; // b
                    vc[14:10] <= 5'd1; 
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card4};
                    if (count == 3) begin                      
                        count <= count + 1;
                        if (stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
                            card4 <= 4'd0;
                        else
                            card4 <= stream[3:0] + 1;                          
                        end
                    end
                3'b101: begin
                    vc[19:15] <= 5'd13; // b
                    vc[14:10] <= 5'd2; 
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card5};
                    if (count == 4) begin                      
                        count <= count + 1;
                        if (stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
                            card5 <= 4'd0;
                        else
                            card5 <= stream[3:0] + 1;                          
                        end
                    end
                3'b110: begin
                    vc[19:15] <= 5'd13; // b
                    vc[14:10] <= 5'd3; 
                    vc[9:5] <= 5'd31;
                    vc[4:0] <= {0,card6};
                    if (count == 5) begin                      
                        count <= count + 1;
						if (card_sum_4_5 % 10 <=2 ||
							(card_sum_4_5 % 10 == 3 && card3 != 4'd8) ||
							(card_sum_4_5 % 10 == 4 && (card3==2 || card3==3 || card3==4 || card3==5 || card3==6 || card3==7)) ||
							(card_sum_4_5 % 10 == 5 && (card3==4 || card3==5 || card3==6 || card3==7)) ||
							(card_sum_4_5 % 10 == 6 && (card3==6 || card3==7))) begin
							
							if (stream == 32'd10 || stream == 32'd11 || stream == 32'd12 || stream == 32'd9)
								card6 <= 4'd0;
							else
								card6 <= stream[3:0] + 1;
								
							end
						else
							card6 <= 4'd0;
                        end
                    end
            endcase
        end
    end


endmodule
