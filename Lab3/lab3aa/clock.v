`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:20 10/27/2015 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input master,
    output one,
    output two,
    output four,
    output fast
    );
    
    reg one = 0;
    reg two = 0;
    reg four = 0;
    wire fast = 0;
        
    wire tc1;
    wire tc2;
    wire tc4;
    wire tcf;
    
    modNcounter #(32'd50_000_000) clock1(
        .clock(master),
        .reset(0),
        .count(1),
        .out(),
        .tc (tc1)
    );
    modNcounter #(32'd25_000_000) clock2(
        .clock(master),
        .reset(0),
        .count(1),
        .out(),
        .tc (tc2)
    );
    modNcounter #(32'd12_500_000) clock4(
        .clock(master),
        .reset(0),
        .count(1),
        .out(),
        .tc (tc4)
    );
    modNcounter #(32'd140_000) clockFast(
        .clock(master),
        .reset(0),
        .count(1),
        .out(),
        .tc (fast)
    );
        
//    modNcounter #(32'd50000) clock1(
//        .clock(master),
//        .reset(0),
//        .count(1),
//        .out(),
//        .tc (tc1)
//    );
//    modNcounter #(32'd25000) clock2(
//        .clock(master),
//        .reset(0),
//        .count(1),
//        .out(),
//        .tc (tc2)
//    );
//    modNcounter #(32'h1E848) clock4(
//        .clock(master),
//        .reset(0),
//        .count(1),
//        .out(),
//        .tc (tc4)
//    );
//    modNcounter #(32'd250) clockFast(
//        .clock(master),
//        .reset(0),
//        .count(1),
//        .out(),
//        .tc (tcf)
//    );

    always @(posedge master)
    begin
        if (tc1 == 1)
            one <= ~one;
        if (tc2 == 1)
            two <= ~two;
        if (tc4 == 1)
            four <= ~four;
//        if (tcf == 1)
//            fast <= ~fast;
    end
endmodule

