`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:57:46 PM
// Design Name: 
// Module Name: sync_ff
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


module sync_ff(
    input clk_rx,
    input din,
    input clk_tx,
    output dout
    );
    
    reg [1:0] din_sync,dout_sync;
    
    always@(posedge clk_rx)
    din_sync={din,din_sync}>>1;
    
    always@(posedge clk_tx)
    dout_sync={din_sync,dout_sync}>>1;
    
    assign dout = dout_sync[0];
endmodule
