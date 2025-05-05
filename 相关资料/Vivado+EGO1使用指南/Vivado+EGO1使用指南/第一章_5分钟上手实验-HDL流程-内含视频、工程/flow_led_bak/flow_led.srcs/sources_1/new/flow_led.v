`timescale 1ns / 1ps

module flow_led ( 
  input  clk,
  output reg [15:0] led = 16'h0003
  );

  reg [27:0] counter = 0;      //clock divider counter

  always @(posedge clk) begin
    if( counter < 50000000)    //500ms
        counter = counter + 1;
    else
        begin
            counter = 0;
            led = { led[13:0], led[15:14] };
        end
  end
endmodule