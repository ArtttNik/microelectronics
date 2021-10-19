library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity step8 is
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        q     : out std_logic_vector(3 downto 0)
    );
end entity step8;

architecture behav of step8 is
    signal cnt : unsigned(3 downto 0) := (others => '0');  
begin
    process(clk, rst)
    begin
        if rst = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;

    q <= std_logic_vector(cnt);
end architecture;
