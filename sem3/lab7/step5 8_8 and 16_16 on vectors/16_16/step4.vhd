library ieee;
use ieee.std_logic_1164.all;

entity step4 is
  port
	(
    r : in std_logic_vector (15 downto 0);
    EI : in std_logic;

    a : out std_logic_vector (3 downto 0);
    G : out std_logic;
	EO : out std_logic
  );
end step4;

architecture behav of step4 is
  component step3
  port
  (
    r : in std_logic_vector (7 downto 0);
    EI : in std_logic;

    a : out std_logic_vector (2 downto 0);
    G : out std_logic;
    EO : out std_logic
  );
  end component;
  signal au2_buf : std_logic_vector (2 downto 0);
  signal au1_buf : std_logic_vector (2 downto 0);
  signal G_buf : std_logic_vector (1 downto 0);
  signal a3_internal : std_logic;
begin
  u2 : step3
    port map(r(15 downto 8), EI, au2_buf, G_buf(0), a3_internal);
  u1 : step3
    port map(r(7 downto 0), a3_internal, au1_buf, G_buf(1), EO);
	a(0) <= au2_buf(0) or au1_buf(0);
	a(1) <= au2_buf(1) or au1_buf(1);
	a(2) <= au2_buf(2) or au1_buf(2);
	G <= G_buf(0) or G_buf(1);

  process (a3_internal)
  begin
    a(3) <= EI and not a3_internal;
  end process;
end behav;
configuration con of step4 is
  for behav
    for u1, u2 : step3
      use entity work.step3(behaviour);
    end for;
  end for;
end con;
