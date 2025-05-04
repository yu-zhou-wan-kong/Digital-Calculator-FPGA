`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/16 14:45:31
// Design Name: 
// Module Name: select
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


module select(
    input [3:0] binary_in,//ÊäÈëµÄ¼üÅÌ±àÂë

    input [3:0] shift_ya,
    input [3:0] shift_yb,
    input [3:0] shift_yc,
    input [3:0] shift_yd,
    input [3:0] shift_yya,
    input [3:0] shift_yyb,
    input [3:0] shift_yyc,
    input [3:0] shift_yyd,

    input [3:0] trans_a3,
    input [3:0] trans_a2,
    input [3:0] trans_a1,
    input [3:0] trans_a0,
    input [3:0] trans_b3,
    input [3:0] trans_b2,
    input [3:0] trans_b1,
    input [3:0] trans_b0,
 
    output reg [3:0] a3=0,
    output reg [3:0] a2=0,
    output reg [3:0] a1=0,
    output reg [3:0] a0=0,
    output reg [3:0] b3=0,
    output reg [3:0] b2=0,
    output reg [3:0] b1=0,
    output reg [3:0] b0=0
    );

    always @(*) begin
        if(binary_in==4'b1111)
        begin
            a3=trans_a3;
            a2=trans_a2;
            a1=trans_a1;
            a0=trans_a0;
            b3=trans_b3;
            b2=trans_b2;
            b1=trans_b1;
            b0=trans_b0;
        end
        else
        begin
            a3=shift_ya;
            a2=shift_yb;
            a1=shift_yc;
            a0=shift_yd;
            b3=shift_yya;
            b2=shift_yyb;
            b1=shift_yyc;
            b0=shift_yyd;
        end
    end
endmodule
