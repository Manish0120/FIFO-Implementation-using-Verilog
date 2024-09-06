`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 23:50:20
// Design Name: 
// Module Name: counter
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


module counter(
    input inc, dec, rst, clk,
    output reg [2:0] count
    );
    
    wire en;
    assign en = inc ^ dec;
    
    always @(posedge clk)
    begin
        if(rst) count <= 3'd0;
        else if (en)
            begin
                if(inc) count <= count + 1;
                else count <= count - 1;
            end
    end
        
endmodule
