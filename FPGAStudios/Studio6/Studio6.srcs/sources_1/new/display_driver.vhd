library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver;

architecture Behavioral of display_driver is

begin

with inputs select

seg_out <=
"1000001" when x"E" ,
"0101111" when x"D" ,
"0010010" when x"C" ,
"0001100" when x"B" ,
"0000110" when x"A" ,
"1000110" when x"9" ,
"0000111" when x"8" ,
"0001000" when x"7" ,
"1000110" when x"6" ,
"1000001" when x"5" ,
"1000111" when x"4" ,
"0001000" when x"3" ,
"0101111" when x"2" ,
"1111111" when x"1" ,
"1111111" when x"0" ,
"1111111" when others;

end Behavioral;
