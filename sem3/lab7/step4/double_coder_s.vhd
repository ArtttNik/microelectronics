  library ieee;
use ieee.std_logic_1164.all;

entity double_coder_s is
    port(
        r: in std_logic_vector(63 downto 0);
        ei: in std_logic;
        a: out std_logic_vector(5 downto 0);
        g: out std_logic;
        eo: out std_logic
    );
end double_coder_s;

architecture structural_simple of double_coder_s is

    component step3
        port(
            r: in std_logic_vector(7 downto 0);
            ei: in std_logic;
            a: out std_logic_vector(2 downto 0);
            g: out std_logic;
            eo: out std_logic
        );
    end component;

    signal a1_1, a1_2, a1_3, a1_4, a1_5, a1_6, a1_7, a1_8 : std_logic_vector(2 downto 0);
    signal g1_1, g1_2, g1_3, g1_4, g1_5, g1_6, g1_7, g1_8 : std_logic;
    signal eo1_1, eo1_2, eo1_3, eo1_4, eo1_5, eo1_6, eo1_7, eo1_8 : std_logic;

begin

    -- ?????????? ??????????? ? ???????????????? ???????????
    coder8: step3 port map(r(63 downto 56), ei,        a1_8, g1_8, eo1_8);  -- ?????? ?????????
    coder7: step3 port map(r(55 downto 48), eo1_8,     a1_7, g1_7, eo1_7);
    coder6: step3 port map(r(47 downto 40), eo1_7,     a1_6, g1_6, eo1_6);
    coder5: step3 port map(r(39 downto 32), eo1_6,     a1_5, g1_5, eo1_5);
    coder4: step3 port map(r(31 downto 24), eo1_5,     a1_4, g1_4, eo1_4);
    coder3: step3 port map(r(23 downto 16), eo1_4,     a1_3, g1_3, eo1_3);
    coder2: step3 port map(r(15 downto 8),  eo1_3,     a1_2, g1_2, eo1_2);
    coder1: step3 port map(r(7 downto 0),   eo1_2,     a1_1, g1_1, eo1_1);  -- ?????? ?????????

    -- ???????????? ??????
    process(g1_8, g1_7, g1_6, g1_5, g1_4, g1_3, g1_2, g1_1,
            a1_8, a1_7, a1_6, a1_5, a1_4, a1_3, a1_2, a1_1)
    begin
        if g1_8 = '1' then
            a <= "111" & a1_8;  -- 56-63
        elsif g1_7 = '1' then
            a <= "110" & a1_7;  -- 48-55
        elsif g1_6 = '1' then
            a <= "101" & a1_6;  -- 40-47
        elsif g1_5 = '1' then
            a <= "100" & a1_5;  -- 32-39
        elsif g1_4 = '1' then
            a <= "011" & a1_4;  -- 24-31
        elsif g1_3 = '1' then
            a <= "010" & a1_3;  -- 16-23
        elsif g1_2 = '1' then
            a <= "001" & a1_2;  -- 8-15
        elsif g1_1 = '1' then
            a <= "000" & a1_1;  -- 0-7
        else
            a <= "000000";
        end if;
    end process;

    g <= g1_1 or g1_2 or g1_3 or g1_4 or g1_5 or g1_6 or g1_7 or g1_8;
    eo <= eo1_1;  -- ?????????? ?????? ?? ?????????? ?????????

end structural_simple;
