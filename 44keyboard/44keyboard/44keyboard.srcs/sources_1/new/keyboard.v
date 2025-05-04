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
    input [3:0] row,  //������̵� �У�ʵ����Ŀ������
    output [3:0] col, //������̵� ��
    output keypressed,//��ⰴ�����µ��ź�
    output [3:0] encoder//���°�����λ��
  );

  reg clk50hz=0,clk5hz=0,unkeypressed=1,keypressed_r;
  reg [3:0] col_r=0,count=0,encoder_r=0;
  reg [20:0] cnt=0;
  reg [3:0] cntt=0;

  assign col=col_r;
  assign encoder=encoder_r;
  assign keypressed=keypressed_r;

  //��Ƶ�����ֳ�50Hz���ź�
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
        unkeypressed=row[0];  //������̰���������ʱ����0�����Զ���unkeypressed����unkeypressed=1��ζ��û�а�������
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
    
    //���� ��ɨ�裬
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

  //�ֳ�5Hz���ź�
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

  //����Ƿ��а�������
  always @ (posedge clk5hz)
  begin
    keypressed_r<=!unkeypressed;
  end
endmodule
