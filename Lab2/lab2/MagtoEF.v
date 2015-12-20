`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:26 10/15/2015 
// Design Name: 
// Module Name:    MagtoEF 
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
module MagtoEF(
    //Inputs
	Mag,
	//Outputs
	Exp, Sig, FifthBit
);

    input [11:0] Mag;
    output [2:0] Exp;
    output [3:0] Sig;
    output FifthBit;
	
	integer temp;
    reg [3:0] Sig1;
    reg FifthBit1;
    
    always @* begin
		if (Mag[11])
			temp = 8;
		else if (Mag[10])
			temp = 7;
		else if (Mag[9])
			temp = 6;
		else if (Mag[8])
			temp = 5;
		else if (Mag[7])
			temp = 4;
		else if (Mag[6])
			temp = 3;
		else if (Mag[5])
			temp = 2;
		else if (Mag[4])
			temp = 1;
		else
			temp = 0;
		
		case (temp)
           7: begin
                Sig1 = Mag[10:7];
                FifthBit1 = Mag[6]; 
           end
           6: begin
                Sig1 = Mag[9:6];
                FifthBit1 = Mag[5]; 
           end
           5: begin
                Sig1 = Mag[8:5];
                FifthBit1 = Mag[4]; 
           end
           4: begin
                Sig1 = Mag[7:4];
                FifthBit1 = Mag[3]; 
           end
           3: begin
                Sig1 = Mag[6:3];
                FifthBit1 = Mag[2]; 
           end
           2: begin
                Sig1 = Mag[5:2];
                FifthBit1 = Mag[1]; 
           end
           1: begin
                Sig1 = Mag[4:1];
                FifthBit1 = Mag[0]; 
           end
           default: begin
                Sig1 = Mag[3:0];
                FifthBit1 = 0; 
           end
		endcase
        
        if (temp == 8)
            begin
            temp = 7;
            Sig1 = 4'hF;
            FifthBit1 = 0;
            end
    end

	assign Sig = Sig1;
	assign Exp = temp;
	assign FifthBit = FifthBit1;

endmodule
