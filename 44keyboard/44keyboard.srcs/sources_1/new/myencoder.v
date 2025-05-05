`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/03/22 17:49:00
// Design Name:
// Module Name: myencoder
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


module myencoder(
    input [3:0] encoder,
    output [3:0] binaryout
  );

  reg [3:0] binaryout_r=0;
  assign binaryout=binaryout_r;
  always @(*)begin
  case (encoder)
    4'b0000:
      binaryout_r=4'b0001;
    4'b0001:
      binaryout_r=4'b0010;
    4'b0010:
      binaryout_r=4'b0011;
    4'b0011:
      binaryout_r=4'b1010;//A,   
    4'b0100:
      binaryout_r=4'b0100;
    4'b0101:
      binaryout_r=4'b0101;
    4'b0110:
      binaryout_r=4'b0110;
    4'b0111:
      binaryout_r=4'b1011;//B,
    4'b1000:
      binaryout_r=4'b0111;
    4'b1001:
      binaryout_r=4'b1000;
    4'b1010:
      binaryout_r=4'b1001;
    4'b1011:
      binaryout_r=4'b1100;//C,后面定义为×
    4'b1100:
      binaryout_r=4'b1110;//*,定义为小数点
    4'b1101:
      binaryout_r=4'b0000;
    4'b1110:
      binaryout_r=4'b1111;//#,定义为    =
    4'b1111:
      binaryout_r=4'b1101;//D,定义为    ÷
  endcase
  end
endmodule
