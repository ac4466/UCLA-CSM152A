`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:28:49 10/20/2015
// Design Name:   FPCVT
// Module Name:   C:/Users/152/lab2aa/tb.v
// Project Name:  lab2aa
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [3:0] F;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		D = 12'b011111000000;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here
        $display("S: %b\nE: %b\nF: %b", S, E, F);
        $finish;
	end
      
endmodule

