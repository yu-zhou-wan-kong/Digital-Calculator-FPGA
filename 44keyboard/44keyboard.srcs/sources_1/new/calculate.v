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
// Description: ͨ��������������ݣ��������Ӧ�Ľ������ʵ���������ļӼ��˳���1000���ڣ�
// ���룺�����϶�Ӧ����λ��������
// �����������ÿһλ��Ӧ�Ķ�������
// ���������������̶�Ӧ�Ķ���������ϳɵ�BCD�룬ת��Ϊ��Ӧ�Ķ�������������С����ת����
//          �ö����������м�����ٽ�������ת��ΪBCD��
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
//�����ʱ�����������BCD�룬��ת��Ϊ�����������������⣬�԰��������ź���Ϊʱ��
//  �����BCD����ʱ��������ͬʱ���������Ը�ֵʱ���Ǹ�ֵΪ��һʱ�̵��������³�������
//  ��ⲻ����������һ�����֣����ͨ�����ա�shift4��ģ����д������ʵ�ֽ������BCD��
//  ��Ӧ����ʮ��ǧλ�ϣ�Ȼ��ת���ɶ������룬���ں����ļ���
//�����ʱ����ʱ���ϳ��������⣬����������һ�����ڲż�⵽������������ڸ�ֵ��ʽ���µ�
//  ���ǣ�ͨ�����ա�shift4��ģ�飬�������һ����

//������С���ļ��㹦�ܲ�û��

module calculate(
    input [3:0] binary_in,//���̱���
    input keypressed,     //���̰��µ��ź�

    output reg [35:0] result_buffer=0,       //������
    output alert          //������Ϣ��ʾ
  );
  reg alert_n=0;
  assign alert=alert_n;

  reg       cnt_num=0;       //����������ָ������м���
  reg       cnt_equal=0;    //������ĵȺŸ������м���
  /////////////////////////////////////////////////////////
  //��һ����
  wire [3:0] a_ones;             //��λ
  wire [3:0] a_tens;             //ʮλ
  wire [3:0] a_hundreds;         //��λ
  wire [3:0] a_thousands;        //ǧλ

  reg [3:0] y_a_ones=0;             //��λ
  reg [3:0] y_a_tens=0;             //ʮλ
  reg [3:0] y_a_hundreds=0;         //��λ
  reg [3:0] y_a_thousands=0;        //ǧλ

  assign a_ones=y_a_ones;
  assign a_tens=y_a_tens;
  assign a_hundreds=y_a_hundreds;
  assign a_thousands=y_a_thousands;
  ///////////////////////////////////////////////////////
  //�ڶ�����
  wire [3:0] b_ones;             //��λ
  wire [3:0] b_tens;             //ʮλ
  wire [3:0] b_hundreds;         //��λ
  wire [3:0] b_thousands;        //ǧλ

  reg [3:0] y_b_ones=0;             //��λ
  reg [3:0] y_b_tens=0;             //ʮλ
  reg [3:0] y_b_hundreds=0;         //��λ
  reg [3:0] y_b_thousands=0;        //ǧλ

  assign b_ones=y_b_ones;
  assign b_tens=y_b_tens;
  assign b_hundreds=y_b_hundreds;
  assign b_thousands=y_b_thousands;
  ///////////////////////////////////////////////////////////
  reg [3:0] symbol=0;           //�����������ݵ�������
  reg [3:0] yunsuanfu=0;        //��������������

  reg [3:0] suibian;          //���ȱ�������ʵ������

  wire [23:0] a_number;

  wire [23:0] b_number;


  always @(negedge keypressed)
  begin
    if(binary_in>=10 && binary_in<=13)//�Ӽ��˳�
    begin
      yunsuanfu<=binary_in;//���������������
      cnt_num<=cnt_num+1;//ʹ���������½��յڶ�����
    end

    else if(binary_in==15)//�Ⱥ�
    begin
      cnt_num=cnt_num+1;//ʹ���������½�����һ����
      case (yunsuanfu)
        4'b1010: //�Ӻ�
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
        4'b1011: //����
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
        4'b1100: //�˺�
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
        4'b1101: //����
        begin
          if(b_number==0)//����Ϊ0ʱ��������
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
          else//������Ϊ0ʱ��������
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

    else//�����������ݵ�
    begin
      alert_n<=0;
      if(!cnt_num)//�����һ����ʱ
      begin
        y_a_ones<=binary_in;
        y_a_tens<=a_ones;
        y_a_hundreds<=a_tens;
        y_a_thousands<=a_hundreds;
      end
      else//����ڶ�����ʱ
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
