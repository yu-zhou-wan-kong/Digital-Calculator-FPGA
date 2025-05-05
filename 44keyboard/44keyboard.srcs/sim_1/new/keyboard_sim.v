`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 14:18:24
// Design Name: 
// Module Name: keyboard_sim
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


module keyboard_sim(  );
reg clk;
reg [3:0] row;
wire [3:0] col;
wire [3:0] encoder;

keyboard u1(
.clk(clk),
.row(row),
.col(col),
.encoder(encoder)
);

parameter CLK_period=20;

initial
  begin
   row=4'b1111;
   #50000000;
   row=4'b1110;
   #30000000;
   row=4'b1101;
      #30000000;
      row=4'b1011;
         #30000000;
         row=4'b0111;
            #30000000;
            row=4'b1110;
               #30000000;
   row=4'b1101;
                  #30000000;
 row=4'b1011;
                     #30000000;   
   row=4'b1111;
  end
always
  begin
    clk=0;
    #(CLK_period/2);
    clk=1;
    #(CLK_period/2);
  end
endmodule
