`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/02/12 15:47:00
// Design Name:
// Module Name: calculate_tb
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


module calculate_tb;

// Parameters

//Ports
reg [3:0] binary_in;
reg  keypressed;
wire [35:0] result_buffer;
wire  alert;

calculate  calculate_inst (
  .binary_in(binary_in),
  .keypressed(keypressed),
  .result_buffer(result_buffer),
  .alert(alert)
);

initial
begin
  keypressed=1;
  binary_in<=0;
  //#20
  //binary_in<=4'b0011;
  //#20
  //binary_in<=4'b1010;//+
  //#20
  //binary_in<=4'b0010;
  //#20
  //binary_in<=4'b1111;//=
//
  //#20
  //binary_in<=4'b0011;
  //#20
  //binary_in<=4'b1011;//-
  //#20
  //binary_in<=4'b0010;
  //#20
  //binary_in<=4'b1111;//=
//
  //#20
  //binary_in<=4'b0011;
  //#20
  //binary_in<=4'b1100;//¡Á
  //#20
  //binary_in<=4'b0010;
  //#20
  //binary_in<=4'b1111;//=
//
  //#20
  //binary_in<=4'b0011;
  //#20
  //binary_in<=4'b1101;//¡Â
  //#20
  //binary_in<=4'b0010;
  //#20
  //binary_in<=4'b1111;//=
/////////////////////////////////
  #20
  binary_in<=4'b1001;
  #20
  binary_in<=4'b1001;
  #20
  binary_in<=4'b1001;
  #20
  binary_in<=4'b1001;
  #20
  binary_in<=4'b1101;//chu
  #20
  binary_in<=4'b0000;
  #20
  binary_in<=4'b1111;//=
end
always #10  keypressed = ! keypressed ;
endmodule