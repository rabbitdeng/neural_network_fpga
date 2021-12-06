`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/25 11:48:46
// Design Name: 
// Module Name: mac
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


module mac(
    out ,pixel_in, weights_in,bias_in, clk
    );
    output [32:0] out;
    input [15:0] pixel_in;
    input  [15:0] weights_in;
    input [15:0]bias_in;
    input clk;
    
    reg [32:0]out;
    reg [15:0] pixel;
    reg [15:0] weights;
    reg [31:0] bias;
    
    wire [31:0] product;
    wire [32:0] sum_out;
    
    always @(posedge clk)
    begin
        pixel <= pixel_in;
        weights<= weights_in;
        bias <= bias_in;
        out <=sum_out;
    end
    multipler #(.OUT_WIDTH(32),.INP_WIDTH(16)) mul_instan(product[31:0],pixel[15:0], weights[15:0]);
    adder #(.OUT_WIDTH(33),.INP_WIDTH(32)) add_instan(sum_out[32:0],product[31:0], bias[31:0] );
    

endmodule
