library IEEE;
use IEEE.std_logic_1164.all;

entity scheme9_14 is
    port (
        clk : in std_logic;
        write_en : in std_logic;
        x : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
end scheme9_14;

architecture behav of scheme9_14 is
    signal internal_q : std_logic_vector(3 downto 0) := "0000";
begin
    process (clk)
    begin
        if rising_edge(clk) and write_en = '1' then
            internal_q <= x;
        end if;
    end process;
    q <= internal_q;
end behav;
