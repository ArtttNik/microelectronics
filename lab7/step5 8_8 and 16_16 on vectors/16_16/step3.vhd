library ieee;
use ieee.std_logic_1164.all;

entity step3 is
  port
	(
    r  : in std_logic_vector (7 downto 0);
    EI : in std_logic;

    a : out std_logic_vector (2 downto 0);
    G : out std_logic;
    EO : out std_logic
  );
end step3;

architecture behav of step3 is
begin
  process(r, EI)
  begin
    a(2) <= EI and (r(7) or r(6) or r(5) or r(4));
    a(1) <= EI and (r(7) or r(6) or (not r(5) and not r(4) and r(3)) or (not r(5) and not r(4) and r(2)));
    a(0) <= EI and (r(7) or (not r(6) and r(5)) or (not r(6) and not r(4) and r(3)) or (not r(6) and not r(4) and not r(2) and r(1)));
    G <= EI and (r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7));
    EO <= EI and (not (r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7)));
  end process;
end behav;
