`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/26 13:07:26
// Design Name: 
// Module Name: junction
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


module junction(
 x, weight, result,x_last,clk,result_valid,x_valid,w_valid
    );
    input clk;
    input [31:0]x;
    input x_last;
    input [31:0]weight;
    input x_valid;
    input w_valid;
    output [31:0]result;
    output result_valid;

    wire [31:0]y_out;
//    wire [31:0]result_out;
    wire y_valid;
    wire y_last;
//    reg[31:0]result;
    wire acc_out_last;

    floating_point_0   f1(.aclk(clk),.s_axis_a_tvalid(x_valid),.s_axis_a_tdata(x),.s_axis_b_tvalid(w_valid),.s_axis_b_tdata(weight)
         ,.m_axis_result_tdata(y_out),.m_axis_result_tvalid(y_valid)); //weight: y= w*x + C  bias: y=1*bias
          //注意这里我把ip选择为nonblocking
        floating_point_1 accu_1(.aclk(clk),. s_axis_a_tvalid(y_valid), .s_axis_a_tdata(y_out), 
  .s_axis_a_tlast(x_last),.m_axis_result_tvalid(result_valid),.m_axis_result_tdata(result),.m_axis_result_tlast(acc_out_last));

endmodule
