`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/02/08 16:52:50
// Design Name:
// Module Name: calculate
// Project Name:
// Target Devices:
// Tool Versions:
// Description: 通过键盘输入的数据，计算出对应的结果，先实现两个数的加减乘除（1000以内）
// 输入：键盘上对应的四位二进制数
// 输出：运算结果每一位对应的二进制数
// 功能描述：将键盘对应的二进制数组合成的BCD码，转换为对应的二进制数（包含小数的转换）
//          用二进制数进行计算后，再将运算结果转换为BCD码
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
//在设计时，接收输入的BCD码，并转化为二进制数出现了问题，以按键输入信号作为时钟
//  输入的BCD码与时钟上升沿同时到来，所以赋值时总是赋值为上一时刻的数，导致出现问题
//  检测不上输入的最后一个数字，最后通过仿照“shift4”模块来写，最终实现将输入的BCD码
//  对应到各十百千位上，然后转换成二进制码，便于后续的计算
//在设计时，在时序上出现了问题，数据总是晚一个周期才检测到，大概率是由于赋值方式导致的
//  还是，通过仿照“shift4”模块，解决了这一问题

//负数、小数的计算功能并没有

module calculate(
    input [3:0] binary_in,//键盘编码
    input keypressed,     //键盘按下的信号

    output reg [35:0] result_buffer=0,       //运算结果
    output alert          //错误信息提示
  );
  reg alert_n=0;
  assign alert=alert_n;

  reg       cnt_num=0;       //对输入的数字个数进行计数
  reg       cnt_equal=0;    //对输入的等号个数进行计数
  /////////////////////////////////////////////////////////
  //第一个数
  wire [3:0] a_ones;             //个位
  wire [3:0] a_tens;             //十位
  wire [3:0] a_hundreds;         //百位
  wire [3:0] a_thousands;        //千位

  reg [3:0] y_a_ones=0;             //个位
  reg [3:0] y_a_tens=0;             //十位
  reg [3:0] y_a_hundreds=0;         //百位
  reg [3:0] y_a_thousands=0;        //千位

  assign a_ones=y_a_ones;
  assign a_tens=y_a_tens;
  assign a_hundreds=y_a_hundreds;
  assign a_thousands=y_a_thousands;
  ///////////////////////////////////////////////////////
  //第二个数
  wire [3:0] b_ones;             //个位
  wire [3:0] b_tens;             //十位
  wire [3:0] b_hundreds;         //百位
  wire [3:0] b_thousands;        //千位

  reg [3:0] y_b_ones=0;             //个位
  reg [3:0] y_b_tens=0;             //十位
  reg [3:0] y_b_hundreds=0;         //百位
  reg [3:0] y_b_thousands=0;        //千位

  assign b_ones=y_b_ones;
  assign b_tens=y_b_tens;
  assign b_hundreds=y_b_hundreds;
  assign b_thousands=y_b_thousands;
  ///////////////////////////////////////////////////////////
  reg [3:0] symbol=0;           //储存输入数据的正负号
  reg [3:0] yunsuanfu=0;        //储存输入的运算符

  reg [3:0] suibian;          //过度变量，无实际意义

  wire [23:0] a_number;

  wire [23:0] b_number;


  always @(negedge keypressed)
  begin
    if(binary_in>=10 && binary_in<=13)//加减乘除
    begin
      yunsuanfu<=binary_in;//将运算符保存下来
      cnt_num<=cnt_num+1;//使计算器等下接收第二个数
    end

    else if(binary_in==15)//等号
    begin
      cnt_num=cnt_num+1;//使计算器等下接收下一个数
      case (yunsuanfu)
        4'b1010: //加号
        begin
          result_buffer<=a_number+b_number;
          y_a_ones=0;     
          y_a_tens=0;     
          y_a_hundreds=0; 
          y_a_thousands=0;
          y_b_ones=0;     
          y_b_tens=0;     
          y_b_hundreds=0; 
          y_b_thousands=0;
        end
        4'b1011: //减号
        begin
          result_buffer<=a_number-b_number;
          y_a_ones=0;     
          y_a_tens=0;     
          y_a_hundreds=0; 
          y_a_thousands=0;
          y_b_ones=0;     
          y_b_tens=0;     
          y_b_hundreds=0; 
          y_b_thousands=0;
        end
        4'b1100: //乘号
        begin
          result_buffer<=(a_number*b_number)/100;
          y_a_ones=0;     
          y_a_tens=0;     
          y_a_hundreds=0; 
          y_a_thousands=0;
          y_b_ones=0;     
          y_b_tens=0;     
          y_b_hundreds=0; 
          y_b_thousands=0;
        end
        4'b1101: //除号
        begin
          if(b_number==0)//除数为0时发出警告
          begin
            alert_n<=1;
            y_a_ones=0;     
            y_a_tens=0;     
            y_a_hundreds=0; 
            y_a_thousands=0;
            y_b_ones=0;     
            y_b_tens=0;     
            y_b_hundreds=0; 
            y_b_thousands=0;
          end
          else//除数不为0时正常计算
          begin
            result_buffer<=(a_number*100)/b_number;
            y_a_ones=0;     
            y_a_tens=0;     
            y_a_hundreds=0; 
            y_a_thousands=0;
            y_b_ones=0;     
            y_b_tens=0;     
            y_b_hundreds=0; 
            y_b_thousands=0;
          end
        end
        default:
        begin
          alert_n<=1;
        end
      endcase
    end

    else//用来接收数据的
    begin
      alert_n<=0;
      if(!cnt_num)//输入第一个数时
      begin
        y_a_ones<=binary_in;
        y_a_tens<=a_ones;
        y_a_hundreds<=a_tens;
        y_a_thousands<=a_hundreds;
      end
      else//输入第二个数时
      begin
        y_b_ones<=binary_in;
        y_b_tens<=b_ones;
        y_b_hundreds<=b_tens;
        y_b_thousands<=b_hundreds;
      end
    end
  end
  assign a_number=a_ones*100+a_tens*1000+a_hundreds*10000+a_thousands*100000;
  assign b_number=b_ones*100+b_tens*1000+b_hundreds*10000+b_thousands*100000;
endmodule
