`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 12:41:43 AM
// Design Name: 
// Module Name: sync_ff_tb
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

`timescale 1ns/1ns
module sync_ff_tb(

    );
    
    reg clk_rx,clk_tx;
    reg din;
    wire dout;
    
    always #5 clk_rx =~clk_rx;
    always #6 clk_tx = !clk_tx;
    
    always #20 din = ~din;
    
    initial  begin
       clk_rx =0;
       clk_tx =0;
       din =0;
        #1000 $stop;
    end
    sync_ff uut(
      .clk_rx(clk_rx),
      .clk_tx(clk_tx),
      .din(din),
      .dout(dout)
    );
endmodule
