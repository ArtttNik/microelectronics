library IEEE;
use IEEE.std_logic_1164.all;

entity scheme9_11 is
    port (
        d   : in  std_logic;
        c   : in  std_logic;
        r   : in  std_logic;
        q1  : inout std_logic;
        q2  : out std_logic
    );
end scheme9_11;

architecture behav of scheme9_11 is
    signal q1a : std_logic := '0';
    signal q2a : std_logic := '0';
begin
    process(c, r)
    begin
        if r = '0' then
            q1a <= '0';
            q2a <= '0';
        elsif rising_edge(c) then
            q2a <= q1a;
			q1a <= d;
        end if;
    end process;

	process(c, r)
    begin
        if r = '0' then
            q1a <= '0';
            q2a <= '0';
        elsif falling_edge(c) then
            q1 <= q1a;
			q2 <= q2a;
        end if;
    end process;


    end behav;

