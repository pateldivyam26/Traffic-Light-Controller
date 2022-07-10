`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 12:02:25 AM
// Design Name: 
// Module Name: test
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


module test();
reg      clk;
reg      rst_a;
wire [2:0] n_lights,s_lights,e_lights,w_lights;

VerilogBM_224_238 T1(n_lights,s_lights,e_lights,w_lights,clk,rst_a);

initial
begin
    rst_a=0; clk=0;
    #5 rst_a=1;
    #5 clk=1; rst_a=0;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
    #10 clk=0; #10 clk=1;
end
 
initial #850 $finish;
endmodule
