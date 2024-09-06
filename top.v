`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 00:10:21
// Design Name: 
// Module Name: top
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

module top(
    input clk, rst, push, pop, [15:0]data_in,
    output fifo_ful, fifo_emp, [15:0] data_out 
    );
    
    wire[2:0] count;
    wire inc, dec;
    wire [15:0] q0, q1, q2, q3;
    
    assign fifo_ful = count[2];
    assign fifo_emp = ~|count;
    assign inc = push & ~count[2];
    assign dec = pop & ( |count);
    
//    module counter(
//    input inc, dec, rst, clk,
//    output reg [2:0] count
//    );
    
    counter cnt0(inc, dec, rst, clk, count);
    
//    module register(
//    input clk, push, enable, rst, [15:0] data_in, 
//    output reg [15:0] out  
//    );

    register r0 (clk, push, count[2], rst, data_in, q0);
    register r1 (clk, push, count[2], rst, q0, q1);
    register r2 (clk, push, count[2], rst, q1, q2);
    register r3 (clk, push, count[2], rst, q2, q3);
    
//    module mux41(
//    input pop, [15:0] a, b, c, d, [1:0] s,
//    output reg [15:0] out
//    );
    
    mux41 m0 (dec, q0, q1, q2, q3, count[1:0], data_out);
    
endmodule