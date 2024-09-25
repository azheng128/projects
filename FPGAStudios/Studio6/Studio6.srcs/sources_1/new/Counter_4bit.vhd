library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_4bit is
    Port ( 
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           LOAD_N : in STD_LOGIC;
           initial_value : in STD_LOGIC_VECTOR (3 downto 0);
           clear_n : in STD_LOGIC;
           counter_output : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Counter_4bit;

architecture Behavioral of Counter_4bit is
    signal counter_signal : std_logic_vector(3 downto 0) := "0000";
begin
    process (clock, clear_n)
    begin
        if clear_n = '0' then
            counter_signal <= (others => '0');
        elsif rising_edge(clock) then
            if LOAD_N = '0' then
                counter_signal <= initial_value;
            if enable = '1' then
                    counter_signal <= std_logic_vector(unsigned(counter_signal) + 1);
                end if;
            end if;
        end if;
    end process;

    counter_output <= counter_signal;

end Behavioral;
