`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/03/22 20:20:44
// Design Name:
// Module Name: display
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


module display(
    input clk,
    input [3:0] a3,a2,a1,a0,
    input [3:0] b3,b2,b1,b0,
    output [7:0] aseg,bseg,
    output [3:0] adis,bdis
  );
  reg clk1k;
  reg [19:0] cnt=0;
  reg [1:0] cnt1=0;
  reg [3:0] dataa,datab;
  reg [7:0] aseg_r,bseg_r;
  reg [3:0] adis_r,bdis_r;

  assign aseg=aseg_r;
  assign bseg=bseg_r;
  assign adis=adis_r;
  assign bdis=bdis_r;

  always @(posedge clk)
  begin
    if (cnt==99999)
    begin
      clk1k=~clk1k;
      cnt=0;
    end
    else
      cnt=cnt+1;
  end

  always @(posedge clk1k)
  begin
    cnt1<=cnt1+1;
    case(cnt1)
      2'b00:
      begin
        dataa=a0;
        datab=b0;
        adis_r=4'b0001;
        bdis_r=4'b0001;
      end
      2'b01:
      begin
        dataa=a1;
        datab=b1;
        adis_r=4'b0010;
        bdis_r=4'b0010;
      end
      2'b10:
      begin
        dataa=a2;
        datab=b2;
        adis_r=4'b0100;
        bdis_r=4'b0100;
      end
      default:
      begin
        dataa=a3;
        datab=b3;
        adis_r=4'b1000;
        bdis_r=4'b1000;
      end
    endcase
  end

  always @(dataa)
  begin
    case (dataa)
      4'h0:
        aseg_r<=8'hfc;//0
      4'h1:
        aseg_r<=8'h60;//1
      4'h2:
        aseg_r<=8'hda;//
      4'h3:
        aseg_r<=8'hf2;
      4'h4:
        aseg_r<=8'h66;
      4'h5:     
        aseg_r<=8'hb6;
      4'h6:
        aseg_r<=8'hbe;
      4'h7:
        aseg_r<=8'he0;
      4'h8:
        aseg_r<=8'hfe;
      4'h9:
        aseg_r<=8'hf6;
      4'ha:
        aseg_r<=8'h0e;//  +
      4'hb:
        aseg_r<=8'h02;//  -
      4'hc:
        aseg_r<=8'h6e;//  乘
      4'hd:
        aseg_r<=8'h92;//  除
      4'he:     //对应键盘  *
        aseg_r<=8'h01;
      default:
        aseg_r<=8'h12;
    endcase
  end

  always @(datab)
  begin
    case (datab)
      4'h0:
        bseg_r<=8'hfc;
      4'h1:
        bseg_r<=8'h60;
      4'h2:
        bseg_r<=8'hda;
      4'h3:
        bseg_r<=8'hf2;
      4'h4:
        bseg_r<=8'h66;
      4'h5:
        bseg_r<=8'hb6;
      4'h6:
        bseg_r<=8'hbe;
      4'h7:
        bseg_r<=8'he0;
      4'h8:
        bseg_r<=8'hfe;
      4'h9:
        bseg_r<=8'hf6;
      4'ha:
        bseg_r<=8'h0e;//  +
      4'hb:
        bseg_r<=8'h02;//  -
      4'hc:
        bseg_r<=8'h6e;// 乘
      4'hd:
        bseg_r<=8'h92;// 除
      4'he://对应键盘上的 *
        bseg_r<=8'h01;
      default:
        bseg_r<=8'h12;
    endcase
  end
endmodule
