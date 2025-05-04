`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/20 17:15:52
// Design Name:
// Module Name: keyboard
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


module keyboard(
    input clk,
    input [3:0] row,  //矩阵键盘的 行，实际项目中上拉
    output [3:0] col, //矩阵键盘的 列
    output keypressed,//检测按键按下的信号
    output [3:0] encoder//按下按键的位置
  );

  reg clk50hz=0,clk5hz=0,unkeypressed=1,keypressed_r;
  reg [3:0] col_r=0,count=0,encoder_r=0;
  reg [20:0] cnt=0;
  reg [3:0] cntt=0;

  assign col=col_r;
  assign encoder=encoder_r;
  assign keypressed=keypressed_r;

  //分频器，分出50Hz的信号
  always @(posedge clk)
  begin
    cnt<=cnt+1;
    if (cnt==999999)
    begin
      cnt<=0;
      clk50hz<=~clk50hz;
    end
  end

  always @(posedge clk50hz)
  begin
    case(count[3:2])
      2'b00:
        unkeypressed=row[0];  //矩阵键盘按键被按下时返回0，所以定义unkeypressed，即unkeypressed=1意味着没有按键按下
      2'b01:
        unkeypressed=row[1];
      2'b10:
        unkeypressed=row[2];
      default:
        unkeypressed=row[3];
    endcase
    if (unkeypressed)
      count=count+1;
    else
      encoder_r=count;//
    
    //键盘 列扫描，
    case(count[1:0])
      2'b00:
        col_r=4'b1110;
      2'b01:
        col_r=4'b1101;
      2'b10:
        col_r=4'b1011;
      default:
        col_r=4'b0111;
    endcase
  end

  //分出5Hz的信号
  always @(posedge clk50hz)
  begin
    if(cntt==5)
    begin
      clk5hz=~clk5hz;
      cntt=0;
    end
    else
      cntt<=cntt+1;
  end

  //检测是否有按键按下
  always @ (posedge clk5hz)
  begin
    keypressed_r<=!unkeypressed;
  end
endmodule
