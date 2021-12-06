`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/01 15:53:28
// Design Name: 
// Module Name: nn_unit
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


module nn_unit(
clk,x,x_l,w,y,y_v,x_v,w_v
    );
    input [31:0] x;
    input clk;
    input [31:0]w;
    input x_l;
    input x_v;
    input w_v;
    
    output y_v;
    output [31:0]y;
    
    wire [31:0]a;
    wire a_v;
    junction j1(.x(x),.weight(w),.x_valid(x_v),.w_valid(w_v),.clk(clk),.result(a),.x_last(x_l),.result_valid(a_v));
    
    RELU relu(.clk(clk),.a_in(a),.a_val(a_v),.y_out(y),.y_val(y_v));
    
endmodule
