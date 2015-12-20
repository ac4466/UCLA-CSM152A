`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:54 10/15/2015 
// Design Name: 
// Module Name:    TCtoSM 
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
module TCtoSM(
    //Inputs
    D,
    //Outputs
    S, Mag
);    

    input [11:0] D;
    output S;
    output [11:0] Mag;
    
    reg [11:0] Mag1;
        
    always @* begin
    if (D[11])
            Mag1 = ~D + 12'b1;
    else
            Mag1 = D;
    end
    
    assign S = D[11];
    assign Mag = Mag1;
    
endmodule
