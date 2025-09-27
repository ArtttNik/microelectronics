library IEEE;
use IEEE.std_logic_1164.all;

entity scheme9_11 is
    port (
        clk : in std_logic;
        d : in std_logic;
        q1 : out std_logic;
        q2 : out std_logic
    );
end scheme9_11;

architecture behav of scheme9_11 is
    signal internal_q1 : std_logic := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            q2 <= internal_q1;
            internal_q1 <= d;
        end if;
    end process;
    q1 <= internal_q1;
end behav;
