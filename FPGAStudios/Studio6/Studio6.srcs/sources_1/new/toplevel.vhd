library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity toplevel is
    Port (
        clk_in   : STD_LOGIC;
        enable   : in STD_LOGIC;
        load     : in STD_LOGIC;
        clear    : in STD_LOGIC;
        init_val : in STD_LOGIC_VECTOR(3 downto 0);
        segment  : OUT STD_LOGIC_VECTOR(6 downto 0);
        anode    : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end toplevel;

architecture Structural of toplevel is
    -- component declaration
    Component clock_divider is
        Port (
            clk         : in STD_LOGIC;
            message_clk : out STD_LOGIC
        );
    end component clock_divider;

    Component LEDdisplay is
        PORT (
            clk   : IN STD_LOGIC;
            seg0  : IN STD_LOGIC_VECTOR(6 downto 0);
            seg1  : IN STD_LOGIC_VECTOR(6 downto 0);
            seg2  : IN STD_LOGIC_VECTOR(6 downto 0);
            seg3  : IN STD_LOGIC_VECTOR(6 downto 0);
            seg   : OUT STD_LOGIC_VECTOR(6 downto 0);
            an    : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT LEDdisplay;

    Component display_driver is
        Port (
            inputs  : in STD_LOGIC_VECTOR(3 downto 0);
            seg_out : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component display_driver;

    component Counter_4bit is
        Port (
            clock           : in STD_LOGIC;
            enable          : in STD_LOGIC;
            LOAD_N          : in STD_LOGIC;
            initial_value   : in STD_LOGIC_VECTOR(3 downto 0);
            clear_n         : in STD_LOGIC;
            counter_output  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component Counter_4bit;

    -- signal declaration
    signal m_clk           : STD_LOGIC;
    signal cnt_out         : STD_LOGIC_VECTOR(3 downto 0);
    signal cnt_out_plus_1  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal cnt_out_plus_2  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal cnt_out_plus_3  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal sig_seg0        : STD_LOGIC_VECTOR(6 downto 0);
    signal sig_seg1        : STD_LOGIC_VECTOR(6 downto 0);
    signal sig_seg2        : STD_LOGIC_VECTOR(6 downto 0);
    signal sig_seg3        : STD_LOGIC_VECTOR(6 downto 0);

begin
    -- component instantiation
    clk_div : clock_divider
        port map (
            clk         => clk_in,
            message_clk => m_clk
        );

    counter : Counter_4bit
        port map (
            clock           => m_clk,
            enable          => enable,
            LOAD_N          => load,
            initial_value   => init_val,
            clear_n         => clear,
            counter_output  => cnt_out
        );

    cnt_out_plus_1 <= std_logic_vector(unsigned(cnt_out) + 1);
    cnt_out_plus_2 <= std_logic_vector(unsigned(cnt_out) + 2);
    cnt_out_plus_3 <= std_logic_vector(unsigned(cnt_out) + 3);
    
    dd0 : display_driver
        port map (
            inputs => cnt_out,
            seg_out => sig_seg0
        );

    dd1 : display_driver
        port map (
            inputs  => cnt_out_plus_1,
            seg_out => sig_seg1
        );

    dd2 : display_driver
        port map (
            inputs  => cnt_out_plus_2,
            seg_out => sig_seg2
        );

    dd3 : display_driver
        port map (
            inputs  => cnt_out_plus_3,
            seg_out => sig_seg3
        );

    display : LEDdisplay
        port map (
            clk   => clk_in,
            seg0  => sig_seg0,
            seg1  => sig_seg1,
            seg2  => sig_seg2,
            seg3  => sig_seg3,
            seg   => segment,
            an    => anode
        );

end architecture Structural;
