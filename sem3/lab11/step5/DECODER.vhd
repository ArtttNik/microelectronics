library ieee;
use ieee.std_logic_1164.all;

entity DECODER is
  port
	(
    input : in std_logic_vector (7 downto 0);

    D : out std_logic_vector (3 downto 0);
	p : out std_logic_vector (3 downto 0);
    ONE_ERR : out std_logic;
    DBL_ERR : out std_logic
  );
end DECODER;

architecture behav of DECODER is
signal signal_p : std_logic_vector(3 downto 0);
begin
  process(input)
  begin
    signal_p(0) <= input(0) xor input(2) xor input(4) xor input(6);
    signal_p(1) <= input(1) xor input(2) xor input(5) xor input(6);
    signal_p(2) <= input(3) xor input(4) xor input(5) xor input(6);
    signal_p(3) <= input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6) xor input(7);

    D(0) <= input(2) xor (signal_p(0) and signal_p(1) and not signal_p(2) and signal_p(3));
    D(1) <= input(4) xor (signal_p(0) and not signal_p(1) and signal_p(2) and signal_p(3));
    D(2) <= input(5) xor (not signal_p(0) and signal_p(1) and signal_p(2) and signal_p(3));
    D(3) <= input(6) xor (signal_p(0) and signal_p(1) and signal_p(2) and signal_p(3));
    ONE_ERR <= signal_p(3);
    DBL_ERR <= not (not (signal_p(0) or signal_p(1) or signal_p(2) or signal_p(3)) or signal_p(3));
	p <= signal_p;
  end process;
end behav;
