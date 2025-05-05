`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/07 19:27:29
// Design Name: 
// Module Name: flowing_light
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

module flowing_light(
input clk,
input rst,
output [15:0] led
);


reg [23:0] cnt_reg;
reg [15:0] light_reg;


always @ (posedge clk)
begin
if (rst)
cnt_reg <= 0;
else
cnt_reg <= cnt_reg + 1;
end


always @ (posedge clk)
begin
if (rst)
light_reg <= 16'h0001;
else if (cnt_reg == 24'hffffff) begin
if (light_reg == 16'h8000)
light_reg <= 16'h0001;
else
light_reg <= light_reg << 1;
end
end
assign led = light_reg;
endmodule



