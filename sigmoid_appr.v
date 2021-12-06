`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/25 16:06:30
// Design Name: 
// Module Name: sigmoid_appr
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


module sigmoid_appr(
    x_in, y_in, clk
    );
    input  clk;
    input [31:0] x_in;
    output [31:0] y_in;
    reg  [31:0] fx;
    reg [31:0] x;
    reg [31:0]y;
    
    reg[31:0]y_in;
    wire[31:0] float_out0;
    wire[31:0] float_out1;
    wire[31:0] float_out2;
    wire[31:0] float_out3;
    wire m_axis_result_tvalid;

    always @(posedge clk)
    begin
    if ((x>=32'h00000000)&(x<32'h3F800000))
            fx<=float_out0;
    else if ((x>=32'h3F800000)&(x<32'h40180000))
            fx<=float_out1;
     else if ((x>=32'h40180000)&(x<32'h40A00000))
            fx<=float_out2;
     else
            fx<=float_out3;
    end

         floating_point_0   f1(.aclk(clk),.s_axis_a_tvalid(1'b1),.s_axis_a_tdata(x),.s_axis_b_tvalid(1'b1),.s_axis_b_tdata(32'h3E800000)
          ,.s_axis_c_tvalid(1'b1),.s_axis_c_tdata(32'h3F000000),.m_axis_result_tdata(float_out0));

           floating_point_0 f2(.aclk(clk),.s_axis_a_tvalid(1'b1),.s_axis_a_tdata(x),.s_axis_b_tvalid(1'b1),.s_axis_b_tdata( 32'h3E000000)
   ,.s_axis_c_tvalid(1'b1),.s_axis_c_tdata(32'h3F200000),.m_axis_result_tdata(float_out1));
   
           floating_point_0 f3(.aclk(clk),.s_axis_a_tvalid(1'b1),.s_axis_a_tdata(x),.s_axis_b_tvalid(1'b1),.s_axis_b_tdata( 32'h3D000000)
   ,.s_axis_c_tvalid(1'b1),.s_axis_c_tdata(32'h3F580000),.m_axis_result_tdata(float_out2));
       
          floating_point_0 f4(.aclk(clk),.s_axis_a_tvalid(1'b0),.s_axis_a_tdata(x),.s_axis_b_tvalid(1'b0),.s_axis_b_tdata( 32'h3D000000)
   ,.s_axis_c_tvalid(1'b1),.s_axis_c_tdata(32'h3F800000),.m_axis_result_tdata(float_out3));

        
    always @(posedge clk)
    begin
     x<= x_in;  
      y_in <= fx;
    end
   
   
endmodule
