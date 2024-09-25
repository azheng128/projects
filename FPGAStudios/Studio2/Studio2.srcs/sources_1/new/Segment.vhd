----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2023 11:44:53 AM
-- Design Name: 
-- Module Name: Segment - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Segment is
    Port ( SW1 : in STD_LOGIC;
           SW2 : in STD_LOGIC;
           SW3 : in STD_LOGIC;
           SW4 : in STD_LOGIC;
           AN0 : out STD_LOGIC;
           AN1 : out STD_LOGIC;
           AN2 : out STD_LOGIC;
           AN3 : out STD_LOGIC;
           SegA : out STD_LOGIC;
           SegB : out STD_LOGIC;
           SegC : out STD_LOGIC;
           SegD : out STD_LOGIC;
           SegE : out STD_LOGIC;
           SegF : out STD_LOGIC;
           SegG : out STD_LOGIC);
end Segment;

architecture Behavioral of Segment is

begin 

    AN0 <= 'L';
    AN1 <= 'H';
    AN2 <= 'H';
    AN3 <= 'H';
    
    SegA <= (SW2 AND ((SW1 NOR SW3) AND (NOT SW4))) OR
      ((SW1 NOR SW2) AND SW4 AND (NOT SW3)) OR 
      (((SW1 AND SW3) AND SW4) AND (NOT SW2)) OR 
      (((SW1 AND SW2) AND SW4) AND (NOT SW3));
    
    SegB <= (((SW1 AND SW3) AND SW4) AND (NOT SW2)) OR
                  ((SW2 AND SW4) AND (SW1 NOR SW3)) OR
                  ((SW2 AND SW3) AND (SW1 NOR SW4)) OR
                  ((SW1 AND SW2) AND (SW3 NOR SW4)) OR
                  ((SW1 AND SW2) AND SW3);
                  
    SegC <= ((SW1 NOR SW2) AND SW3 AND (NOT SW4)) OR
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
            (SW2 AND SW3 AND SW4 AND (NOT SW1))   OR
            ((SW1 AND SW4) AND (SW2 NOR SW3));
            
    SegF <= ((SW1 NOR SW2) AND SW3) OR
            ((SW4 AND (SW1 NOR SW2)) AND (NOT SW3)) OR
            (((SW2 AND SW3) AND SW4) AND (NOT SW1)) OR
            (((SW1 AND SW2) AND SW4) AND (NOT SW3));
            
    SegG <= ((SW1 NOR SW2) AND (NOT SW3)) OR
            (SW2 AND SW3 AND SW4 AND (NOT SW1)) OR
            ((SW1 AND SW2) AND (SW3 NOR SW4));

end Behavioral;
