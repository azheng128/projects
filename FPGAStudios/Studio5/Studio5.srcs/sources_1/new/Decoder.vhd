----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2023 03:24:43 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
Port (enable: in STD_LOGIC_VECTOR(2  downto 0);
      input: in STD_LOGIC_VECTOR(2  downto 0);
      output: out STD_LOGIC_VECTOR(7  downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin
output(0) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
(NOT input(0)) AND (NOT input(1)) AND (NOT input(2)));
output(1) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
(NOT input(0)) AND (NOT input(1)) AND input(2));
output(2) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
(NOT input(0)) AND input(1) AND (NOT input(2)));
output(3) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
(NOT input(0)) AND input(1) AND input(2));
output(4) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
input(0) AND (NOT input(1)) AND (NOT input(2)));
output(5) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
input(0) AND (NOT input(1)) AND input(2));
output(6) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
input(0) AND input(1) AND (NOT input(2)));
output(7) <= NOT(enable(0) AND (NOT enable(1)) AND (NOT enable(2)) AND
input(0) AND input(1) AND input(2));

end Behavioral;
