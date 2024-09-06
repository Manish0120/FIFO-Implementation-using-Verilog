`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 23:39:58
// Design Name: 
// Module Name: register
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


module register(
    input clk, push, enable, rst, [15:0] data_in, 
    output reg [15:0] out  
    );
    
    always @(posedge clk)
    begin
        if (rst) out <= 16'd0;
        
        else if(push && ~enable)
            out <= data_in;
    end
endmodule
