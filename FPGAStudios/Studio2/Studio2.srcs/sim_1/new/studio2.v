`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 10:07:41 AM
// Design Name: 
// Module Name: studio2
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


module studio2(
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output SegA,
    output SegB,
    output SegC,
    output SegD,
    output SegE,
    output SegF,
    output SegG
    );
    
    AN0 <= FALSE;
    AN1 <= TRUE;
    AN2 <= TRUE;
    AN3 <= TRUE;
    
    SegA <= (SW2 AND ((SW1 NOR SW3) NOR SW4)) OR 
      (((SW1 AND SW3) AND SW4) AND (NOT SW2)) OR 
      (((SW1 AND SW2) AND SW4) AND (NOT SW3));
    
    SegB <= (((SW1 AND SW3) AND SW4) AND (NOT SW2)) OR
                  ((SW2 AND SW4) AND (SW1 NOR SW3)) OR
                  ((SW2 AND SW3) AND (SW1 NOR SW4)) OR
                  ((SW1 AND SW2) AND (SW3 NOR SW4)) OR
                  ((SW1 AND SW2) AND SW3);
                  
    SegC <= ((SW1 NOR SW2) AND (SW3 NAND SW4)) OR
             ((SW1 AND SW2) AND (SW3 NOR SW4)) OR
             ((SW1 AND SW2) AND SW3);
             
    SegD <= (SW4 AND (SW1 NOR SW2) AND (NOT SW3)) OR
            (SW2 AND (SW1 NOR SW3) AND (NOT SW4)) OR
            (SW2 AND (SW3 AND SW4) AND (NOT SW1)) OR
            ((SW1 AND SW3) AND (SW2 NOR SW4)) OR
            (SW1 AND SW2 AND SW3 AND SW4);
            
    SegE <= (SW4 AND (SW1 NOR SW2) AND (NOT SW3)) OR
            ((SW1 NOR SW2) AND (SW3 AND SW4))     OR
            (SW2 AND (SW1 NOR SW3))               OR
            (SW2 AND SW3 AND SW$ AND (NOT SW1))   OR
            ((SW1 AND SW4) AND (SW2 NOR SW3));
            
    SegF <= (SW1 NOR SW2) AND SW3)                OR
            (SW4 AND (SW1 NOR SW2) AND (NOT SW3)) OR
            (SW2 AND SW3 AND SW$ AND (NOT SW1))   OR
            ((SW1 AND SW2) AND SW4 AND (NOT SW3));
            
    SegG <= (SW1 NOR SW2 AND (NOT SW3))           OR
            (SW2 AND SW3 AND SW$ AND (NOT SW1))   OR
            ((SW1 AND SW2) AND (SW3 NOR SW4));
            
endmodule
