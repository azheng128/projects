----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2023 06:47:14 PM
-- Design Name: 
-- Module Name: Zheng_Andy_Studio1 - Behavioral
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

entity Zheng_Andy_Studio1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           ABgtCD : out STD_LOGIC;
           ABeqCD : out STD_LOGIC;
           ABltCD : out STD_LOGIC);
end Zheng_Andy_Studio1;

architecture Behavioral of Zheng_Andy_Studio1 is

begin

ABgtCD <= (A AND (NOT C)) OR ((A AND B) AND (C NAND D)) OR (B AND (C NOR D));
ABeqCD <= (A AND B AND C AND D) OR ((A AND C) AND (B NOR D)) OR ((B AND D) AND (A NOR C)) OR ((A NOR B) AND (C NOR D));
ABltCD <= ((NOT A) AND C) OR ((A NOR B) AND D) OR ((A NAND B) AND (C AND D));

end Behavioral;
