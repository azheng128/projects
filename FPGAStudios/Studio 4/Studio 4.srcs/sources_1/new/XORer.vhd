----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 11:59:43 PM
-- Design Name: 
-- Module Name: ANDer - Behavioral
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

entity XORer is
Port (sw : in STD_LOGIC_VECTOR(7 downto 0);
      lOut : out STD_LOGIC_VECTOR(3 downto 0) );
end XORer;

architecture Behavioral of XORer is

begin

lOut(0) <= sw(0) XOR sw(4);
lOut(1) <= sw(1) XOR sw(5);
lOut(2) <= sw(2) XOR sw(6);
lOut(3) <= sw(3) XOR sw(7);

end Behavioral;
