library ieee;
use ieee.std_logic_1164.all;

entity fifoCode is
  port (
    CLK   : in  std_logic;
    DI    : in  std_logic_vector(7 downto 0);
    RD    : in  std_logic;
    WR    : in  std_logic;
    Reset : in  std_logic;

    Full  : out std_logic;
    Empty : out std_logic;
    DO    : out std_logic_vector(7 downto 0)
  );
end fifoCode;

architecture behav of fifoCode is

  type array_type is array (0 to 7) of std_logic_vector(7 downto 0);
  signal dffArr    : array_type;

  signal RDCOUNTER : integer range 0 to 7;
  signal WRCOUNTER : integer range 0 to 7;
  signal count     : integer range 0 to 8;

begin

  process(CLK, Reset)
    variable next_count : integer range 0 to 8;
  begin

    if (Reset = '1') then
      RDCOUNTER <= 0;
      WRCOUNTER <= 0;
      count     <= 0;

      Full  <= '0';
      Empty <= '1';
      DO    <= "00000000";

      for i in 0 to 7 loop
        dffArr(i) <= "00000000";
      end loop;

    elsif (CLK'event and (CLK = '1')) then

      next_count := count;

      if (RD = '1') and (count > 0) then
        DO <= dffArr(RDCOUNTER);

        if RDCOUNTER = 7 then
          RDCOUNTER <= 0;
        else
          RDCOUNTER <= RDCOUNTER + 1;
        end if;

        next_count := count - 1;

      elsif (WR = '1') and (count < 8) then
        dffArr(WRCOUNTER) <= DI;

        if WRCOUNTER = 7 then
          WRCOUNTER <= 0;
        else
          WRCOUNTER <= WRCOUNTER + 1;
        end if;

        next_count := count + 1;
      end if;

      count <= next_count;

      if (next_count = 8) then
        Full  <= '1';
        Empty <= '0';
      elsif (next_count = 0) then
        Full  <= '0';
        Empty <= '1';
      else
        Full  <= '0';
        Empty <= '0';
      end if;

    end if;

  end process;

end behav;
