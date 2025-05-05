`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 20:04:58
// Design Name: 
// Module Name: shift4_sim
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


module shift4_sim(  );
  reg clk;
  reg [3:0] in;
  wire [3:0] ya,yb,yc,yd;

shift4 shift4u(
.clk(clk),
.in(in),
.ya(ya),
.yb(yb),
.yc(yc),
.yd(yd)
);  

initial
  begin
    in=0;
    clk=0;
  end
always
  begin
  #50;
  clk=~clk;
  in=in+1;
  end  

endmodule
