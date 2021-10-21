LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY step8 IS
PORT( 
    r:   in std_logic;
	jk:  in std_logic;
	c: 	 in std_logic;
    q1: out std_logic;
 	q2: out std_logic;
 	q3: out std_logic;
 	q4: out std_logic
);
END step8;

ARCHITECTURE behav OF step8 IS
    signal t1, t2, t3, t4 : std_logic := '0';
BEGIN
       
    PROCESS(r, c)
    BEGIN
        if(r = '0') then
            t1 <= '0';
            t2 <= '0';
            t3 <= '0';
            t4 <= '0';
        elsif(rising_edge(c)) then
            if(jk = '1') then
                t1 <= not t1;
                if t1 = '1' then
                    t2 <= not t2;
                    if t2 = '1' then
                        t3 <= not t3;
                        if t3 = '1' then
                            t4 <= not t4;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    END PROCESS;

	q1 <= t1;
    q2 <= t2;
    q3 <= t3;
    q4 <= t4;

END behav;

