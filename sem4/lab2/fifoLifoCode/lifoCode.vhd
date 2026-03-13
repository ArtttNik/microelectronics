library ieee;
use ieee.std_logic_1164.all;

entity lifoCode is
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
end lifoCode;

architecture behav of lifoCode is
  type array_type is array (0 to 7) of std_logic_vector(7 downto 0);
  signal dffArr : array_type;

  signal count  : integer range 0 to 8;
begin

  process(CLK, Reset)
    variable idx : integer range 0 to 7;
    variable next_count : integer range 0 to 8;
  begin

    if (Reset = '1') then
      count <= 0;

      Full  <= '0';
      Empty <= '1';
      DO    <= "00000000";

      for i in 0 to 7 loop
        dffArr(i) <= "00000000";
      end loop;

    elsif (CLK'event and (CLK = '1')) then

      next_count := count;

      -- READ (pop)
      if (RD = '1') and (count > 0) then
        -- ????????? ????????? ?????? 0..7 ????? ?????????
        if count = 1 then
          idx := 0;
        elsif count = 2 then
          idx := 1;
        elsif count = 3 then
          idx := 2;
        elsif count = 4 then
          idx := 3;
        elsif count = 5 then
          idx := 4;
        elsif count = 6 then
          idx := 5;
        elsif count = 7 then
          idx := 6;
        else
          -- count = 8
          idx := 7;
        end if;

        DO <= dffArr(idx);
        next_count := count - 1;

      -- WRITE (push)
      elsif (WR = '1') and (count < 8) then
        -- count ??? 0..7 => ?????? ?????????, ?? ?????? ?????????? ??? ????? ????? ??????????,
        -- ??????? ???? ????? ?????????:
        if count = 0 then
          idx := 0;
        elsif count = 1 then
          idx := 1;
        elsif count = 2 then
          idx := 2;
        elsif count = 3 then
          idx := 3;
        elsif count = 4 then
          idx := 4;
        elsif count = 5 then
          idx := 5;
        elsif count = 6 then
          idx := 6;
        else
          -- count = 7
          idx := 7;
        end if;

        dffArr(idx) <= DI;
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
