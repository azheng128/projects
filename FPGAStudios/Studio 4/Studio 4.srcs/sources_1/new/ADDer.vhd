----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2023 01:29:13 AM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity ADDer is
Port (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      carry_in  : in STD_LOGIC;
      sum       : out STD_LOGIC_VECTOR(4  downto 0));
end ADDer;

architecture Structural of ADDer is
-- component declaration
Component bit_full_adder IS
PORT (  A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        s : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component bit_full_adder;

--signal declaration
signal c0 :STD_LOGIC;
signal c1 :STD_LOGIC;
signal c2 :STD_LOGIC;
signal c3 :STD_LOGIC;

begin
-- component instantiation
sw04: bit_full_adder
    port map (
    A => sw(0),
    B => sw(4),
    Cin => carry_in,
    S => sum(0),
    Cout => c0 );

sw15: bit_full_adder
    port map (
    A => sw(1),
    B => sw(5),
    Cin => c0,
    S => sum(1),
    Cout => c1 );

sw26: bit_full_adder
    port map (
    A => sw(2),
    B => sw(6),
    Cin => c1,
    S => sum(2),
    Cout => c2 );

sw37: bit_full_adder
    port map (
    A => sw(3),
    B => sw(7),
    Cin => c2,
    S => sum(3),
    Cout => sum(4) );
    
end architecture Structural;
