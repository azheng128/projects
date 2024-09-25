----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2023 02:52:58 AM
-- Design Name: 
-- Module Name: NANDgate - Behavioral
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

entity NANDgate is
Port (cases : in STD_LOGIC_VECTOR(7  downto 0);
      output: out STD_LOGIC);
end NANDgate;

architecture Behavioral of NANDgate is

begin
output <= NOT(cases(2) AND cases(3) AND cases(4) AND cases(5) AND cases(6));

end Behavioral;
