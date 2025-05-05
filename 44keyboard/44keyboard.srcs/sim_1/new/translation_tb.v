`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/16 13:56:35
// Design Name: 
// Module Name: translation_tb
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


module translation_tb;

// Parameters

//Ports
reg [35:0] result_buffer;
reg  alert;
wire [3:0] a3;
wire [3:0] a2;
wire [3:0] a1;
wire [3:0] a0;
wire [3:0] b3;
wire [3:0] b2;
wire [3:0] b1;
wire [3:0] b0;

translation  translation_inst (
  .result_buffer(result_buffer),
  .alert(alert),
  .a3(a3),
  .a2(a2),
  .a1(a1),
  .a0(a0),
  .b3(b3),
  .b2(b2),
  .b1(b1),
  .b0(b0)
);

initial begin
    result_buffer<=0;
    alert=0;
    #20
    result_buffer<=100;
    #20
    result_buffer<=123400;
    #20
    result_buffer<=123456;
    #20
    result_buffer<=56;
    #20
    alert=1;
    result_buffer<=56;
end

endmodule