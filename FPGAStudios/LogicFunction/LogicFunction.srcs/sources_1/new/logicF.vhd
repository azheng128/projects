----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2023 01:29:13 AM
-- Design Name: 
-- Module Name: logicF - Behavioral
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

entity logicF is
Port (ABC   : in STD_LOGIC_VECTOR(2  downto 0);
      en    : in STD_LOGIC_VECTOR(2  downto 0);
      F     : OUT STD_LOGIC);
end logicF;

architecture Structural of logicF is
-- component declaration

Component Decoder is 
Port ( enable : in STD_LOGIC_VECTOR(2  downto 0);
       input  : in STD_LOGIC_VECTOR(2  downto 0);
       outputs: out STD_LOGIC_VECTOR(7  downto 0));
end component Decoder;

Component NANDgate is 
Port (cases : in STD_LOGIC_VECTOR(7  downto 0);
      output: out STD_LOGIC);
end component NANDgate;

--signal declaration
signal out_d :STD_LOGIC_VECTOR(7 downto 0);


begin
-- component instantiation
dec: decoder
    port map (
    enable => en,
    input => ABC,
    outputs => out_d
    );
    
gate: NANDgate
   port map (
   cases => out_d,
   output => F
   );

end architecture Structural;