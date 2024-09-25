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

entity toplevel is
Port (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      carry_in  : in STD_LOGIC;
      clk_in    : in STD_LOGIC;
      segment   : OUT STD_LOGIC_VECTOR(6  downto 0);
      anode     : OUT STD_LOGIC_VECTOR(3 downto 0));
end toplevel;

architecture Structural of toplevel is
-- component declaration
Component bit_full_adder IS
PORT (  A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component bit_full_adder;

Component Display_Driver is 
Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;

Component LEDdisplay is
PORT (  clk					: IN  STD_LOGIC;
		seg0,seg1,seg2,seg3 : IN  STD_LOGIC_VECTOR(6 downto 0);
        seg       		    : OUT  STD_LOGIC_VECTOR(6  downto 0);
		an					: OUT STD_LOGIC_VECTOR(3 downto 0));		  
END COMPONENT LEDdisplay;

--signal declaration
signal c0 :STD_LOGIC;
signal c1 :STD_LOGIC;
signal c2 :STD_LOGIC;
signal c3 :STD_LOGIC;
signal s0 :STD_LOGIC;
signal s1 :STD_LOGIC;
signal s2 :STD_LOGIC;
signal s3 :STD_LOGIC;
signal sig_seg1 :STD_LOGIC_VECTOR(6 downto 0);
signal sig_seg2 :STD_LOGIC_VECTOR(6 downto 0);

begin
-- component instantiation
sw04: bit_full_adder
    port map (
    A => sw(0),
    B => sw(4),
    Cin => carry_in,
    S => s0,
    Cout => c0 );

sw15: bit_full_adder
    port map (
    A => sw(1),
    B => sw(5),
    Cin => c0,
    S => s1,
    Cout => c1 );

sw26: bit_full_adder
    port map (
    A => sw(2),
    B => sw(6),
    Cin => c1,
    S => s2,
    Cout => c2 );

sw37: bit_full_adder
    port map (
    A => sw(3),
    B => sw(7),
    Cin => c2,
    S => s3,
    Cout => c3 );

displaydriver1: Display_driver
    port map (
    inputs(0) => s0,
    inputs(1) => s1,
    inputs(2) => s2,
    inputs(3) => s3,
    seg_out => sig_seg1);
    
displaydriver1: Display_driver
    port map (
    inputs(0) => c3,
    inputs(1) => '0',
    inputs(2) => '0',
    inputs(3) => '0',
    seg_out => sig_seg2);

LEDdisplay: LEDdisplay
    port map (
    clk => clk_in,
    seg0 => sig_seg1,
    seg1 => sig_seg2,
    seg2 => "0000000",
    seg3 => "0000000",
    seg => segment,
    an => anode);
    

end architecture Structural;
