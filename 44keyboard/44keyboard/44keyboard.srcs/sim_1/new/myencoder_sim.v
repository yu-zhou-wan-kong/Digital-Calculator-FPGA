`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 19:47:29
// Design Name: 
// Module Name: myencoder_sim
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


module myencoder_sim(   );
 reg [3:0] encoder;
 wire [3:0] binaryout;
 
 myencoder myencoderu(
 .encoder(encoder),
 .binaryout(binaryout)
 );
 
 initial
  begin
   encoder=4'b0000;
   #100;
   encoder=4'b0101;
      #100;
      encoder=4'b1010;
         #100;
         encoder=4'b1111;
            #100;
      encoder=4'b0100;
               #100;
      encoder=4'b0101;
                  #100;
      encoder=4'b0110;
                     #100;
      encoder=4'b0111;
   end
 endmodule
