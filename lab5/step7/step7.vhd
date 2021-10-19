library ieee;
use ieee.std_logic_1164.all;

entity step7 is
    port (
        clk : in std_logic;
        rst : in std_logic;
        count : inout std_logic_vector (3 downto 0)
    );
end step7;

architecture behav of step7 is
begin
    process  (count, clk, rst)
    begin
        if (rst = '1') then
            count <= "0000";
        elsif rising_edge(clk) then
			count <= count(3 downto 1) & '1';
        end if;
    end process;
end behav;
