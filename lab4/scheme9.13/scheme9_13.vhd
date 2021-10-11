library IEEE;
use IEEE.std_logic_1164.all;

entity scheme9_13 is
    port (
        c1 : in std_logic;
        c2 : in std_logic;
        d : in std_logic;
        q1 : out std_logic;
        q2 : out std_logic
    );
end scheme9_13;

architecture behav of scheme9_13 is
    signal q1_prime, q2_prime : std_logic := '0';
begin
    process (c1, c2)
    begin
        if rising_edge(c1) then
            q1_prime <= d;
            q2_prime <= q1;
        elsif rising_edge(c2) then
            q1 <= q1_prime;
            q2 <= q2_prime;
        end if;
    end process;
end behav;
