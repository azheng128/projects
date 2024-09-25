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
Port (switch    : in STD_LOGIC_VECTOR(7  downto 0);
      ctrl   : in STD_LOGIC_VECTOR(1  downto 0);
      c_in      : in STD_LOGIC;
      clk_in    : in STD_LOGIC;
      segment   : OUT STD_LOGIC_VECTOR(6  downto 0);
      anode     : OUT STD_LOGIC_VECTOR(3 downto 0));
end toplevel;

architecture Structural of toplevel is
-- component declaration
Component ADDer IS
PORT (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      carry_in  : in STD_LOGIC;
      sum       : out STD_LOGIC_VECTOR(4  downto 0));
end component ADDer;

Component ANDer IS
PORT (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      lOut      : out STD_LOGIC_VECTOR(3 downto 0));
end component ANDer;

Component ORer IS
PORT (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      lOut      : out STD_LOGIC_VECTOR(3 downto 0));
end component ORer;

Component XORer IS
PORT (sw        : in STD_LOGIC_VECTOR(7  downto 0);
      lOut      : out STD_LOGIC_VECTOR(3 downto 0));
end component XORer;

Component Function_select is 
Port ( Input0 : in  STD_LOGIC_VECTOR (3 downto 0);
       Input1 : in  STD_LOGIC_VECTOR (3 downto 0);
	   Input2 : in  STD_LOGIC_VECTOR (3 downto 0);
       Input3 : in  STD_LOGIC_VECTOR (4 downto 0);
       control : in  STD_LOGIC_VECTOR (1 downto 0);
       Output : out  STD_LOGIC_VECTOR (4 downto 0));
end component Function_select;

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
signal out_and    :STD_LOGIC_VECTOR(3 downto 0);
signal out_or     :STD_LOGIC_VECTOR(3 downto 0);
signal out_xor    :STD_LOGIC_VECTOR(3 downto 0);
signal out_adder  :STD_LOGIC_VECTOR(4 downto 0);
signal out_select :STD_LOGIC_VECTOR(4 downto 0);
signal sig_seg1   :STD_LOGIC_VECTOR(6 downto 0);
signal sig_seg2   :STD_LOGIC_VECTOR(6 downto 0);

begin
-- component instantiation
ADD: ADDer
    port map (
    sw => switch,
    carry_in => c_in,
    sum => out_adder );

ANDer0: ANDer
    port map (
    sw => switch,
    lOut => out_and );
    
ORer0: ORer
    port map (
    sw => switch,
    lOut => out_or );

XORer0: XORer
    port map (
    sw => switch,
    lOut => out_xor );

fselect: Function_select
    port map (
    Input0 => out_and,
    Input1 => out_or,
    Input2 => out_xor,
    Input3 => out_adder,
    control => ctrl,
    Output => out_select );

displaydriver1: Display_driver
    port map (
    inputs(0) => out_select(0),
    inputs(1) => out_select(1),
    inputs(2) => out_select(2),
    inputs(3) => out_select(3),
    seg_out => sig_seg1);
    
displaydriver2: Display_driver
    port map (
    inputs(0) => out_select(4),
    inputs(1) => '0',
    inputs(2) => '0',
    inputs(3) => '0',
    seg_out => sig_seg2);

display: LEDdisplay
    port map (
    clk => clk_in,
    seg0 => sig_seg1,
    seg1 => sig_seg2,
    seg2 => "1111111",
    seg3 => "1111111",
    seg => segment,
    an => anode);
    

end architecture Structural;
