`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/02/16 14:55:05
// Design Name:
// Module Name: select_tb
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


module select_tb;

  // Parameters

  //Ports
  reg [3:0] binary_in;
  reg [3:0] shift_ya;
  reg [3:0] shift_yb;
  reg [3:0] shift_yc;
  reg [3:0] shift_yd;
  reg [3:0] shift_yya;
  reg [3:0] shift_yyb;
  reg [3:0] shift_yyc;
  reg [3:0] shift_yyd;
  reg [3:0] trans_a3;
  reg [3:0] trans_a2;
  reg [3:0] trans_a1;
  reg [3:0] trans_a0;
  reg [3:0] trans_b3;
  reg [3:0] trans_b2;
  reg [3:0] trans_b1;
  reg [3:0] trans_b0;
  wire [3:0] a3;
  wire [3:0] a2;
  wire [3:0] a1;
  wire [3:0] a0;
  wire [3:0] b3;
  wire [3:0] b2;
  wire [3:0] b1;
  wire [3:0] b0;

  select  select_inst (
            .binary_in(binary_in),
            .shift_ya(shift_ya),
            .shift_yb(shift_yb),
            .shift_yc(shift_yc),
            .shift_yd(shift_yd),
            .shift_yya(shift_yya),
            .shift_yyb(shift_yyb),
            .shift_yyc(shift_yyc),
            .shift_yyd(shift_yyd),
            .trans_a3(trans_a3),
            .trans_a2(trans_a2),
            .trans_a1(trans_a1),
            .trans_a0(trans_a0),
            .trans_b3(trans_b3),
            .trans_b2(trans_b2),
            .trans_b1(trans_b1),
            .trans_b0(trans_b0),
            .a3(a3),
            .a2(a2),
            .a1(a1),
            .a0(a0),
            .b3(b3),
            .b2(b2),
            .b1(b1),
            .b0(b0)
          );

  initial
  begin
    binary_in<=0;
    shift_ya<=0;
    shift_yb<=0;
    shift_yc<=0;
    shift_yd<=0;
    shift_yya<=0;
    shift_yyb<=0;
    shift_yyc<=0;
    shift_yyd<=0;
    trans_a3<=1;
    trans_a2<=1;
    trans_a1<=1;
    trans_a0<=1;
    trans_b3<=1;
    trans_b2<=1;
    trans_b1<=1;
    trans_b0<=1;
    #20
    binary_in<=4'b1111;
    shift_ya<=0;
    shift_yb<=0;
    shift_yc<=0;
    shift_yd<=0;
    shift_yya<=0;
    shift_yyb<=0;
    shift_yyc<=0;
    shift_yyd<=0;
    trans_a3<=1;
    trans_a2<=1;
    trans_a1<=1;
    trans_a0<=1;
    trans_b3<=1;
    trans_b2<=1;
    trans_b1<=1;
    trans_b0<=1;
  end
  //always #5  clk = ! clk ;

endmodule
