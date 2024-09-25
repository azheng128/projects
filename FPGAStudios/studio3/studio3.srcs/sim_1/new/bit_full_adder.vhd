----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2023 01:34:05 PM
-- Design Name: 
-- Module Name: bit_full_adder - Behavioral
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

entity bit_full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end bit_full_adder;

architecture Behavioral of bit_full_adder is

begin

S <= ((A NOR B) AND Cin) OR
     ((A NOR Cin) AND B) OR
     ((B NOR Cin) AND A) OR
     (A AND B AND Cin);
     
Cout <= (B AND Cin AND (NOT A)) OR
        (A AND Cin) OR
        (A AND B AND (NOT Cin));

end Behavioral;
