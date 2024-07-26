`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 07:39:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input CLK,
    input [7:0]DR,
    input  [7:0]AC,
    input  [7:0]D ,
    input  [7:0] T,
    input  [3:0] B,
    input J,
    input [7:0]datain,   //from DR OR AC
    output reg E,
    output reg [7:0]dataout);   // DataIN TO AC
    wire AND;
    wire ADD;
    wire LDA;
    wire CMA;
    wire CIR;
    wire CIL;
    
   /// Data_Regester u1(.DR(DR),.CLK(CLK),.D(D),.T(T),.datain(datain));
   /// processor_reg u2(.AC(AC),.CLK(CLK),.D(D),.T(T),.datain(datain),.J(J),.B(B));
///   operation_selecction i11 (.D(D),.J(J),.B(B));
///   Timer i12 (.T(T));    
  
    assign AND = D[0] &&T[5];
    assign ADD = D[1] &&T[5];
    assign LDA = D[2] &&T[5];
    assign CMA = ((D[7] && ~J && T[3]) && B[2]);
    assign CIR =((D[7] && ~J && T[3]) && B[1]);
    assign CIL = ((D[7] && ~J && T[3]) && B[0]);
    
    initial E<=0;
    
    always@ *begin
    
    if (AND)begin
    dataout = AC & DR;
    end 
    
    if (ADD) begin
    {E,dataout} = AC+DR;  
    end
    
   if (LDA)begin
   dataout = DR;
    end 
    
   if (CMA)begin
        dataout = ~AC ;
   end
   
   if (CIR)begin
       dataout = AC>>>1 && dataout[7]<=E &&E<=dataout[0];
      
   end
   
   if (CIL)begin
       dataout = AC<<<1 && dataout[0] <= E && E <= dataout[7]; 
   end    
    
    end
endmodule
