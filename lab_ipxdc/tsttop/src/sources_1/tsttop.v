`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 12:08:32 AM
// Design Name: 
// Module Name: tsttop
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


module tsttop(

    input clk0,
    input clk1,
    input din,
    output dout

    );
    
    sync_ff_0 uut(
    .clk_rx(clk0),
    .clk_tx(clk1),
    .din(din),
    .dout(dout));
    
endmodule
