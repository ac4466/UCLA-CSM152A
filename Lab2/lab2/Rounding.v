`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:38 10/20/2015 
// Design Name: 
// Module Name:    Rounding 
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
module Rounding(
	//Inputs
	Exp, Sig, FifthBit,
	//Outputs
	E, F
);

    input [2:0] Exp;
    input [3:0] Sig;
    input FifthBit;
    output [2:0] E;
    output [3:0] F;
	
	reg [4:0] sum;
    reg [2:0] E1;

	always @* begin
        if (Sig == 4'hF && Exp == 3'b111 && FifthBit == 1)
            begin
                sum = 5'b01111;
                E1 = 3'b111;
            end
        else
            begin
            sum = FifthBit ? Sig + 1 : Sig;
            
            if (sum[4])
                begin
                    sum = sum >> 1;
                    E1 = Exp + 1;
                end
            else
                E1 = Exp;	
            end
	end
    
	assign F = sum[3:0];
    assign E = E1;
	
endmodule
