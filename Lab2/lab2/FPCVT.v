`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:39 10/15/2015 
// Design Name: 
// Module Name:    FPCVT 
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
module FPCVT(
    //Inputs
    D,
    //Outputs
    S, E, F
);

    input [11:0] D;
    output S;
    output [2:0] E;
    output [3:0] F;
    
    wire [11:0] Mag;
    wire [2:0] Exp;
    wire [3:0] Sig;
    wire       FifthBit;

TCtoSM TCtoSM_ (//Inputs
                .D      (D),
                //Outputs
                .S      (S),
                .Mag    (Mag));
                
MagtoEF MagtoEF_ (//Inputs
                  .Mag  (Mag),
                  //Outputs
                  .Exp  (Exp),
                  .Sig  (Sig),
                  .FifthBit (FifthBit));
                  
Rounding Rounding_ (//Inputs
                    .Exp    (Exp), 
                    .Sig    (Sig), 
                    .FifthBit   (FifthBit),
                    //Outputs
                    .E      (E),
                    .F      (F));


endmodule
