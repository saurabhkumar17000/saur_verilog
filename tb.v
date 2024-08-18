`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2024 02:34:01 PM
// Design Name: 
// Module Name: tb
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


module tb();
reg clear,clk,x;
wire [1:0]hwy,cntry;

signal_controller sc(hwy,cntry,x,clear,clk);

initial 
clk=1'b0;
always
#5 clk=!clk;

initial
begin
clear=1'b1;
repeat(5) @(posedge clk);
clear=1'b0;
end

initial 
begin
x=1'b0;
#50 x=1'b1;

#250 x=1'b0;
#150 $stop;
end
endmodule
