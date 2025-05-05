`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/02/15 22:34:52
// Design Name:
// Module Name: translation
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// 将计算结果翻译为BCD码
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module translation(
    input [35:0] result_buffer,     //calculate模块的计算结果
    input alert,

    output reg  [3:0] a3=0,
    output reg  [3:0] a2=0,
    output reg  [3:0] a1=0,
    output reg  [3:0] a0=0,
    output reg  [3:0] b3=0,
    output reg  [3:0] b2=0,
    output reg  [3:0] b1=0,
    output reg  [3:0] b0=0
  );

  reg [3:0] int_ones;//个位
  reg [3:0] int_twos;//十位
  reg [3:0] int_threes;//百位
  reg [3:0] int_fours;//千位
  reg [3:0] int_fives;//万位
  reg [3:0] int_sixs;//十万位
  reg [3:0] int_sevens;//百万位
  reg [3:0] int_eights;//千万位

  reg [3:0] point_ones;//十分位
  reg [3:0] point_twos;//百分位
  integer i;

  always @(result_buffer or alert)
  begin
    int_ones=0;
    int_twos=0;
    int_threes=0;
    int_fours=0;
    int_fives=0;
    int_sixs=0;
    int_sevens=0;
    int_eights=0;
    point_ones=0;
    point_twos=0;

    for(i = 35; i >= 0; i = i - 1)
    begin
      if (point_twos >= 4'd5)
        point_twos = point_twos + 4'd3;
      if (point_ones >= 4'd5)
        point_ones = point_ones + 4'd3;
      if (int_ones >= 4'd5)
        int_ones = int_ones + 4'd3;
      if (int_twos >= 4'd5)
        int_twos = int_twos + 4'd3;
      if (int_threes >= 4'd5)
        int_threes = int_threes + 4'd3;
      if (int_fours >= 4'd5)
        int_fours = int_fours + 4'd3;
      if (int_fives >= 4'd5)
        int_fives = int_fives + 4'd3;
      if (int_sixs >= 4'd5)
        int_sixs = int_sixs + 4'd3;
      if (int_sevens >= 4'd5)
        int_sevens = int_sevens + 4'd3;
      if (int_eights >= 4'd5)
        int_eights = int_eights + 4'd3;
      int_eights   = {int_eights[1:0],int_sevens[3]};
      int_sevens   = {int_sevens[2:0],int_sixs[3]};
      int_sixs	 = {int_sixs[2:0],int_fives[3]};
      int_fives	 = {int_fives[2:0],int_fours[3]};
      int_fours	 = {int_fours[2:0],int_threes[3]};
      int_threes	 = {int_threes[2:0],int_twos[3]};
      int_twos	 = {int_twos[2:0],int_ones[3]};
      int_ones	 = {int_ones[2:0],point_ones[3]};
      point_ones	 = {point_ones[2:0],point_twos[3]};
      point_twos	 = {point_twos[2:0],result_buffer[i]};
    end
    if(alert)
    begin
        b0<=4'b1101;
        b1<=4'b1111;
        b2<=4'b1101;
        b3<=4'b1111;
        a0<=4'b1101;
        a1<=4'b1111;
        a2<=4'b1101;
        a3<=4'b1111;
    end
    else//正常输出计算结果
    begin
      if(point_ones==0 && point_twos==0)
      begin
        b0<=int_eights;
        b1<=int_sevens;
        b2<=int_sixs;
        b3<=int_fives;
        a0<=int_fours;
        a1<=int_threes;
        a2<=int_twos;
        a3<=int_ones;
      end
      else
      begin
        b0<=int_fives;
        b1<=int_fours;
        b2<=int_threes;
        b3<=int_twos;
        a0<=int_ones;
        a1<=4'b1110;
        a2<=point_ones;
        a3<=point_twos;
      end
    end
  end

endmodule
