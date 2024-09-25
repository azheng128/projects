----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2023 01:52:27 PM
-- Design Name: 
-- Module Name: encode - Behavioral
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

entity encode is
Port(
    enIn   : in std_logic;
    input  : in STD_LOGIC_VECTOR(7  downto 0);
    output : out STD_LOGIC_VECTOR(2  downto 0);
    GS     : out std_logic;
    EO     : out std_logic 
);
end encode;

architecture Behavioral of encode is

begin
output(0) <= (NOT enIn);
output(1) <= (NOT enIn);
output(2) <= (NOT enIn);

end Behavioral;
