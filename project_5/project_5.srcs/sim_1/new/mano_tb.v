`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 01:27:45 PM
// Design Name: 
// Module Name: mano_tb
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


module mano_tb;
    reg  CLK;
    wire   [7:0] T ;
    wire   [3:0] SC;
    wire   [7:0] IR;
    wire   [3:0] PC;
    wire   [3:0] AR;
    wire   [7:0] DR;
    wire   [7:0] AC;
    wire   [7:0] D;    //for decoding
    wire   [2:0] S;
    wire [7:0]data;
    wire  [7:0]m ;
    wire  J;
    wire   E; 
mano y5 (.CLK(CLK),
         .T(T),.SC(SC),
         .IR(IR),.PC(PC),
         .AR(AR),.DR(DR),
         .AC(AC),.D(D),
         .D(D),.S(S),
         .m(m),.J(J),.E(E));


initial begin
CLK=0;


end

always begin
  #5 CLK=~CLK ;
end






endmodule
