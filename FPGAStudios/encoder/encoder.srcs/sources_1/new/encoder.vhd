----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2023 01:12:19 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
Port(
    enIn   : in std_logic;
    input  : in STD_LOGIC_VECTOR(7  downto 0);
    output : out STD_LOGIC_VECTOR(2  downto 0);
    GS     : out std_logic;
    EO     : out std_logic 
);

end encoder;

architecture Behavioral of encoder is
begin

output(0) <= ( (( (input(7) AND (NOT input(6)) ) OR 
(input(7) AND input(6) AND input(5) AND (NOT input(4)) ) OR
(input(7) AND input(6) AND input(5) AND input(4) AND input(3) AND (NOT input(2)) ) OR
(input(7) AND input(6) AND input(5) AND input(4) AND input(3) AND input(2) AND input(1) ) ) 
AND (NOT enIn)) OR enIn);

output(1) <= ( (( (input(7) AND input(6) AND (NOT input(5))) OR
(input(7) AND input(6) AND input(5) AND (NOT input(4)) ) OR
(input(7) AND input(6) AND input(5) AND input(4) AND input(3) AND input(2)) ) 
AND (NOT enIn)) OR enIn);

output(2) <= ( ( (input(7) AND input(6) AND input(5) AND input(4)) 
AND (NOT enIn)) OR enIn);

GS <= NOT (NOT (enIn OR 
((input(7) AND input(6) AND input(5) AND input(4) AND input(3) AND input(2) AND input(1) AND input(0))
AND (NOT enIn))));

EO <= NOT ((input(7) AND input(6) AND input(5) AND input(4) AND input(3) AND input(2) AND input(1) AND input(0))
AND (NOT enIn));

end Behavioral;
