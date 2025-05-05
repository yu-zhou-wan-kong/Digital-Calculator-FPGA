`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/30 09:49:16
// Design Name: 
// Module Name: flow_led_sim
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


module flow_led_sim(    );
  reg  clk;
  wire [15:0] led;

 flow_led u0(
      .clk(clk),
      .led(led)
    );
    
    parameter clk_period=100;
   
    always
       begin
         clk=1'b0;
         #(clk_period/2);
         clk=1'b1;
         #(clk_period/2); 
       end
endmodule
