`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/02 14:35:03
// Design Name: 
// Module Name: RELU
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


module RELU(clk,
 a_in,a_val,y_out,y_val
    );
    input clk;
    input [31:0]a_in;
    input a_val;
    output reg y_val;
    output reg[31:0]y_out;
    
//      floating_point_0   relu(.aclk(clk),.s_axis_a_tvalid(a_val),.s_axis_a_tdata(a_in),.s_axis_b_tvalid(1'b1),.s_axis_b_tdata()
//         ,.m_axis_result_tdata(y_out),.m_axis_result_tvalid(y_valid)); //weight: y= w*x + C  bias: y=1*bias
    always@(posedge clk)
    begin
    if(a_val ==1'b1)begin//输入有效;
         if(a_in[31] == 1'b1)   begin//直接用符号位判断是否小于0
              y_out <= 32'h00000000;
              y_val<=1'b1;
             end
         else begin
             y_out <=a_in;
             y_val<=1'b1;
             end
        end
    else y_val = 1'b0;
    
    end//alwaysend
    
endmodule
