LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY step4 IS
PORT( 
    x : IN std_logic_vector(63 DOWNTO 0);
    a : IN std_logic_vector(5 DOWNTO 0);
    e : IN std_logic;
    q : OUT std_logic
);
END step4;

ARCHITECTURE structural OF step4 IS

COMPONENT step2
PORT( 
    x0, x1, x2, x3, a0, a1, e : IN std_logic;
    q : OUT std_logic
);
END COMPONENT;

SIGNAL level1_out : std_logic_vector(1 TO 16);
SIGNAL level2_out : std_logic_vector(1 TO 4);

BEGIN
    -- ?????? ??????? - 16 ???????????????
    M1_1: step2 PORT MAP(x(0), x(1), x(2), x(3), a(0), a(1), e, level1_out(1));
    M1_2: step2 PORT MAP(x(4), x(5), x(6), x(7), a(0), a(1), e, level1_out(2));
    M1_3: step2 PORT MAP(x(8), x(9), x(10), x(11), a(0), a(1), e, level1_out(3));
    M1_4: step2 PORT MAP(x(12), x(13), x(14), x(15), a(0), a(1), e, level1_out(4));
    M1_5: step2 PORT MAP(x(16), x(17), x(18), x(19), a(0), a(1), e, level1_out(5));
    M1_6: step2 PORT MAP(x(20), x(21), x(22), x(23), a(0), a(1), e, level1_out(6));
    M1_7: step2 PORT MAP(x(24), x(25), x(26), x(27), a(0), a(1), e, level1_out(7));
    M1_8: step2 PORT MAP(x(28), x(29), x(30), x(31), a(0), a(1), e, level1_out(8));
    M1_9: step2 PORT MAP(x(32), x(33), x(34), x(35), a(0), a(1), e, level1_out(9));
    M1_10: step2 PORT MAP(x(36), x(37), x(38), x(39), a(0), a(1), e, level1_out(10));
    M1_11: step2 PORT MAP(x(40), x(41), x(42), x(43), a(0), a(1), e, level1_out(11));
    M1_12: step2 PORT MAP(x(44), x(45), x(46), x(47), a(0), a(1), e, level1_out(12));
    M1_13: step2 PORT MAP(x(48), x(49), x(50), x(51), a(0), a(1), e, level1_out(13));
    M1_14: step2 PORT MAP(x(52), x(53), x(54), x(55), a(0), a(1), e, level1_out(14));
    M1_15: step2 PORT MAP(x(56), x(57), x(58), x(59), a(0), a(1), e, level1_out(15));
    M1_16: step2 PORT MAP(x(60), x(61), x(62), x(63), a(0), a(1), e, level1_out(16));
    
    -- ?????? ??????? - 4 ??????????????
    M2_1: step2 PORT MAP(level1_out(1), level1_out(2), level1_out(3), level1_out(4), a(2), a(3), e, level2_out(1));
    M2_2: step2 PORT MAP(level1_out(5), level1_out(6), level1_out(7), level1_out(8), a(2), a(3), e, level2_out(2));
    M2_3: step2 PORT MAP(level1_out(9), level1_out(10), level1_out(11), level1_out(12), a(2), a(3), e, level2_out(3));
    M2_4: step2 PORT MAP(level1_out(13), level1_out(14), level1_out(15), level1_out(16), a(2), a(3), e, level2_out(4));
    
    -- ?????? ??????? - 1 ?????????????
    M3_1: step2 PORT MAP(level2_out(1), level2_out(2), level2_out(3), level2_out(4), a(4), a(5), e, q);

END structural;
