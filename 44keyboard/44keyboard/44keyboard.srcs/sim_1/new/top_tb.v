`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/16 15:17:56
// Design Name: 
// Module Name: top_tb
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


module top_tb;

// Parameters

//Ports
reg  clk;
reg  rst;
reg [3:0] row;
wire [3:0] col;
wire [7:0] aseg;
wire  bseg;
wire [3:0] adis;
wire  bdis;

top  top_inst (
  .clk(clk),
  .rst(rst),
  .row(row),
  .col(col),
  .aseg(aseg),
  .bseg(bseg),
  .adis(adis),
  .bdis(bdis)
);

initial begin
    clk=0;
    rst=0;
    row=0;
    #20
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
always #5  clk = ! clk ;

endmodule