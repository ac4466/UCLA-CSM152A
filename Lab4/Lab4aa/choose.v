`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:55 11/23/2015 
// Design Name: 
// Module Name:    choose 
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
module choose(
    input clk,
    input enable,
    input [7:0] sw,
    input [3:0] num_players,
    output [19:0] ch,
    output [7:0] Led
    );
    
	reg [19:0] ch;
    reg [7:0] Led;
    
	initial begin
		ch[19:15] = 5'd13; // b
		ch[14:10] = 5'd11; // e
		ch[9:5] = 5'd12; // t
        ch[4:0] = 5'd31;
	end

    always @ (posedge clk) begin
        if (enable) begin
            case (num_players)
                4'd1: Led <= {7'b0,sw[0]};
                4'd2: Led <= {6'b0,sw[1:0]};
                4'd3: Led <= {5'b0,sw[2:0]};
                4'd4: Led <= {4'b0,sw[3:0]};
                4'd5: Led <= {3'b0,sw[4:0]};
                4'd6: Led <= {2'b0,sw[5:0]};
                4'd7: Led <= {1'b0,sw[6:0]};
                4'd8: Led <= sw[7:0];
            endcase
        end
    end

    
endmodule
