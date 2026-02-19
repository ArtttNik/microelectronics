library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;

entity step7 is
  port
  (
    r : in std_logic_vector(7 downto 0);
    EI : in std_logic;
    a : out std_logic_vector(2 downto 0);
    G : out std_logic;
    EO : out std_logic
  );
end step7;

architecture simple of step7 is
begin
  a <= "111" when EI='1' and r(7)='1' else
       "110" when EI='1' and r(6)='1' else
       "101" when EI='1' and r(5)='1' else
       "100" when EI='1' and r(4)='1' else
       "011" when EI='1' and r(3)='1' else
       "010" when EI='1' and r(2)='1' else
       "001" when EI='1' and r(1)='1' else
       "000" when EI='1' and r(0)='1' else
       "000";
       
  G <= EI and (r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7));
  EO <= EI and not (r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7));
end simple;
