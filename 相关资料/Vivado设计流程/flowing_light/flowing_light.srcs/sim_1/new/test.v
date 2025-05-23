`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/07 19:43:37
// Design Name: 
// Module Name: test
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


module test_flowing_light( );
 


reg clk;
reg rst;
 




 
wire [3:0] led;


flowing_light u0(
.clk(clk),
.rst(rst),
.led(led) );


parameter PERIOD = 10;


always begin
clk = 1'b0;
#(PERIOD/2) clk = 1'b1;
#(PERIOD/2);
end


initial begin
clk = 1'b0;
rst = 1'b0;
#100;
rst = 1'b1;
#100;
rst = 1'b0;
end
endmodule
 


