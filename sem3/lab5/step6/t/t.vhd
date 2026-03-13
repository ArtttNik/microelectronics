library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t is
    Port ( 
        T : in STD_LOGIC;
        R : in STD_LOGIC;
        S : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end t;

architecture behav of t is
begin
    process(T, R, S)
        variable state : STD_LOGIC := '0';
    begin
        if R = '1' then
            state := '0';
        elsif S = '1' then
            state := '1';
        elsif rising_edge(T) then
            state := not state;
        end if;
        
        Q <= state;
        Qn <= not state;
    end process;
end behav;
