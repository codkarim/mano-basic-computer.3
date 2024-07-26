`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 09:52:40 PM
// Design Name: 
// Module Name: mano
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


module mano(
    input  CLK,
    inout  [7:0] T ,
    inout  [3:0] SC,
    inout  [7:0] IR,
    inout  [3:0] PC,
    inout  [3:0] AR,
    inout  [7:0] DR,
    inout  [7:0] AC,
    inout [7:0] D,    //for decoding
    input [7:0] dataAC,
    inout  [3:0] B,
    inout  [2:0] S,
    inout  [7:0]m ,
    inout  J,
    inout   E,
    output  [7:0] data );
    
    
    Timer i0 (.T(T),.SC(SC));
    Seqence_counter i1 (.SC(SC),.CLK(CLK),.D(D),.T(T));
    Instruction_Regester i2 (.IR(IR),.D(D),.T(T),.CLK(CLK),.datain(data));
    program_counter i3 (.PC(PC),.CLK(CLK),.D(D),.T(T),.datain(data));
    Address_Regester i4 (.AR(AR),.J(J),.CLK(CLK),.D(D),.T(T),.datain(data));
    Data_Regester i5(.DR(DR),.CLK(CLK),.D(D),.T(T),.datain(data));
    processor_reg i6 (.AC(AC),.B(B),.J(J),.CLK(CLK),.D(D),.T(T),.datain(dataAC));
    operation_selecction i7 (.D(D),.J(J),.T(T),.SC(SC),.IR(IR),.B(B));
    ALU i8(.E(E),.D(D),.T(T),.AC(AC),.DR(DR),.J(J),.B(B),.dataout(dataAC),.CLK(CLK),.datain(dataAC));
    BUS i9 (.S(S),.D(D),.J(J),.T(T));
    memory i10 (.CLK(CLK),.D(D),.J(J),.T(T),.AR(AR),.datain(m),.dataout(data));
    
   
  //  assign AR = T[0] ? PC : 'hzz;
    
  // assign IR = T[1] ? m[AR] : 'hzz; 
 //  assign PC = T[1] ? PC+1 : 'hzz;
    
   //assign AR = (~D[7]&&J&&T[3]) ? m[AR] : 'hzz;
    
    //assign DR = (D[0]&&T[4]) ?m[AR]: 'hzz;
    //assign AC = (D[0]&&T[5]) ?AC&DR: 'hzz;
     
    //assign DR = (D[1]&&T[4]) ?m[AR]: 'hzz;
    //assign {E,AC} = (D[1]&&T[5]) ? AC+DR: 'hzz;
    
   //assign DR = (D[2]&&T[4]) ?m[AR]: 'hzz;
   //assign AC = (D[2]&&T[5]) ? DR: 'hzz;  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
