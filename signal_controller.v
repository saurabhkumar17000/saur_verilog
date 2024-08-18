`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2024 02:03:44 PM
// Design Name: 
// Module Name: signal_controller
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

`define y2rdly=1;
`define r2gdly=1; 
module signal_controller(hwy,cntry,x,clear,clk);
input clear,clk,x;
output reg[1:0]hwy,cntry;
reg [2:0]ps,ns;

parameter red=2'b00,yellow=2'b01,green=2'b10;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;

always@(posedge clk)
if(clear)
ps<=s0;
else
ps<=ns;

always@(ps,x)
begin
case(ps)
s0: begin
     if(x==1)
     ns=s1;
     else
     ns=s0;
     end
s1: begin
     repeat(2) @(posedge clk);  
     ns=s2;
     end
s2: begin
    repeat(2)
    @(posedge clk);
    ns=s3;
    end
s3: begin 
    if(x==0)
    ns=s4;
    else
    ns =s3;
    end
s4: begin
    repeat(2)
    @(posedge clk);
    ns=s0;                
    end
default: ns=s0;     

endcase
end

always@(ps)
begin
hwy=green;
cntry=red;
case(ps)
s0:;
s1:hwy=yellow;
s2:hwy=red;
s3:begin 
    cntry=green;
    hwy=red;
    end
s4:begin
   cntry=yellow;
   hwy=red;
   end
endcase
end
endmodule
