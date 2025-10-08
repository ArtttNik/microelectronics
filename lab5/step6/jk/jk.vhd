library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk is
    Port ( 
        J : in STD_LOGIC;
        K : in STD_LOGIC;  
        R : in STD_LOGIC;
        S : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end jk;

architecture behavioral of jk is
    signal q_temp : STD_LOGIC := '0';
begin
    process(J, K, R, S)
    begin
        if R = '1' then
            q_temp <= '0';
        elsif S = '1' then
            q_temp <= '1';
        elsif J = '0' and K = '0' then
            q_temp <= q_temp;
        elsif J = '1' and K = '0' then
            q_temp <= '1';
        elsif J = '0' and K = '1' then
            q_temp <= '0';
        else
            q_temp <= not q_temp;
        end if;
    end process;
    
    Q <= q_temp;
    Qn <= not q_temp;
end behavioral;
