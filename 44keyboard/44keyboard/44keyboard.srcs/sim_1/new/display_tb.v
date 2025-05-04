`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/17 21:49:25
// Design Name: 
// Module Name: display_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_tb;

// Parameters

//Ports
reg  clk;
reg [3:0] binary_in;
wire [3:0] a3;
wire  a2;
wire  a1;
wire  a0;
wire [3:0] b3;
wire  b2;
wire  b1;
wire  b0;
wire [3:0] ra3;
wire  ra2;
wire  ra1;
wire  ra0;
wire [3:0] rb3;
wire  rb2;
wire  rb1;
wire  rb0;
wire [7:0] aseg;
wire  bseg;
wire [3:0] adis;
wire  bdis;

display  display_inst (
  .clk(clk),
  .binary_in(binary_in),
  .a3(a3),
  .a2(a2),
  .a1(a1),
  .a0(a0),
  .b3(b3),
  .b2(b2),
  .b1(b1),
  .b0(b0),
  .ra3(ra3),
  .ra2(ra2),
  .ra1(ra1),
  .ra0(ra0),
  .rb3(rb3),
  .rb2(rb2),
  .rb1(rb1),
  .rb0(rb0),
  .aseg(aseg),
  .bseg(bseg),
  .adis(adis),
  .bdis(bdis)
);

//always #5  clk = ! clk ;

endmodule
