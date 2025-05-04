`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/03/22 20:59:15
// Design Name:
// Module Name: top
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


module top(
    input clk,
    input rst,
    input [3:0] row,
    output [3:0] col,
    output [7:0] aseg,bseg,
    output [3:0] adis,bdis
  );
  wire [3:0] encoder,binaryout;
  wire keypressed;
  wire [3:0] ya,yb,yc,yd,yya,yyb,yyc,yyd,ta3,ta2,ta1,ta0,tb3,tb2,tb1,tb0;

  keyboard keyboardu(
             .clk(clk),
             .row(row),
             .col(col),
             .keypressed(keypressed),
             .encoder(encoder)
           );
  myencoder myencoderu(
              .encoder(encoder),
              .binaryout(binaryout)
            );
  shift4 shift4u0(
           .clk(keypressed),
           .rst(rst),
           .in(binaryout),
           .ya(ya),
           .yb(yb),
           .yc(yc),
           .yd(yd)
         );
  shift4 shift4u1(
           .clk(keypressed),
           .rst(rst),
           .in(yd),
           .ya(yya),
           .yb(yyb),
           .yc(yyc),
           .yd(yyd)
         );
  display displayu(
            .clk(clk),
            .a3(ya),
            .a2(yb),
            .a1(yc),
            .a0(yd),
            .b3(yya),
            .b2(yyb),
            .b1(yyc),
            .b0(yyd),
            .aseg(aseg),
            .bseg(bseg),
            .adis(adis),
            .bdis(bdis)
          );

  //calculate  calculate_inst (
  //             .binary_in(binaryout),
  //             .keypressed(keypressed),
  //             .result_buffer(result_buffer),
  //             .alert(alert)
  //           );
//
  //translation  translation_inst (
  //               .result_buffer(result_buffer),
  //               .alert(alert),
  //               .a3(ta3),
  //               .a2(ta2),
  //               .a1(ta1),
  //               .a0(ta0),
  //               .b3(tb3),
  //               .b2(tb2),
  //               .b1(tb1),
  //               .b0(tb0)
  //             );
//
  //select  select_inst (
  //          .binary_in(binaryout),
  //          .shift_ya(ya),
  //          .shift_yb(yb),
  //          .shift_yc(yc),
  //          .shift_yd(yd),
  //          .shift_yya(yya),
  //          .shift_yyb(yyb),
  //          .shift_yyc(yyc),
  //          .shift_yyd(yyd),
  //          .trans_a3(ta3),
  //          .trans_a2(ta2),
  //          .trans_a1(ta1),
  //          .trans_a0(ta0),
  //          .trans_b3(tb3),
  //          .trans_b2(tb2),
  //          .trans_b1(tb1),
  //          .trans_b0(tb0),
  //          .a3(a3),
  //          .a2(a2),
  //          .a1(a1),
  //          .a0(a0),
  //          .b3(b3),
  //          .b2(b2),
  //          .b1(b1),
  //          .b0(b0)
  //        );
endmodule
