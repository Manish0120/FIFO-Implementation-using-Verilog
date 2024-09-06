`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 17:14:49
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb;
    reg clk, rst, push, pop; 
    reg [15:0]data_in;
    wire fifo_ful, fifo_emp;
    wire [15:0] data_out;
    
    top dut (clk, rst, push, pop, data_in,fifo_ful, fifo_emp, data_out );
    
    initial 
    begin
        clk = 1'b0;
    end
    
    always #5 clk = ~clk;
    
    initial 
    begin
        rst = 0;
        #8 rst = 1;
        #10 rst = 0;
        
        push = 1; data_in = 16'ha; pop = 0;
        #10 data_in = 16'hd;
        #10 data_in = 16'h5;
        #10 data_in = 16'h9;
        
        #20 push = 0; data_in = 16'ha; pop = 1;
        #10 push = 0; pop = 1;
        #10 push = 0; pop = 1;
        #10 push = 0; pop = 1;
        #10 push = 0; pop = 1;
        
        #10 push = 1; data_in = 16'ha; pop = 0;
        #10 data_in = 16'hd;
        
        #10 push = 0; pop = 1;
        #10 push = 0; pop = 1;
        
    end
    
    initial #500 $finish;
endmodule
