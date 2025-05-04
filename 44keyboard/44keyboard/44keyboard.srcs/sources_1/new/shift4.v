`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/03/22 19:42:01
// Design Name:
// Module Name: shift4
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


module shift4(
    input clk,
    input rst,
    input [3:0] in,
    output [3:0] ya,yb,yc,yd
  );
  reg [3:0] ya_l,yb_l,yc_l,yd_l;

  assign ya=ya_l;
  assign yb=yb_l;
  assign yc=yc_l;
  assign yd=yd_l;

  always @(posedge clk, posedge rst)
  begin
    if (rst==1)
    begin
      ya_l<=4'b0000;
      yb_l<=4'b0000;
      yc_l<=4'b0000;
      yd_l<=4'b0000;
    end
    else
    begin
      ya_l<=in;
      yb_l<=ya;
      yc_l<=yb;
      yd_l<=yc;
    end
  end
endmodule
