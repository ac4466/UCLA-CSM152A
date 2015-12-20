`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:49 10/29/2015 
// Design Name: 
// Module Name:    modNcounter 
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
module modNcounter #(parameter [31:0] N = 32'd10)(
    input clock,
    input reset,
    input count,
    output [31:0] out,
    output tc
    );

    reg [31:0] out = 0;
    reg tc = 0;
    
    always @(posedge clock or posedge reset) begin
        if (reset)
            out <= 32'b0;
        else if (count == 1) begin
            if (out == N - 2)
                tc <= 1;
            else
                tc <= 0;
            if (out == N - 1)
                out <= 32'b0;
            else
                out <= out + 1;
        end
    end
    
endmodule
