LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtr_struct IS
PORT(
    d  : IN std_logic;
    l  : IN std_logic;
    q  : OUT std_logic;
    qb : OUT std_logic
);
END dtr_struct;

ARCHITECTURE behav OF dtr_struct IS
    COMPONENT notand
    PORT(
        a : IN std_logic;
        b : IN std_logic;
        c : OUT std_logic
    );
    END COMPONENT;

    COMPONENT rstr
    PORT(
        s  : IN std_logic;
        r  : IN std_logic;
        q  : OUT std_logic;
        qb : OUT std_logic
    );
    END COMPONENT;

    SIGNAL s_sig  : std_logic;
    SIGNAL r_sig  : std_logic;
    SIGNAL notd   : std_logic;
BEGIN
    inv1: notand PORT MAP (d, d, notd);

    g1: notand PORT MAP (d, l, s_sig);
    g2: notand PORT MAP (notd, l, r_sig);

    rs: rstr PORT MAP (s_sig, r_sig, q, qb);
END behav;

CONFIGURATION con OF dtr IS
    FOR behav
        FOR ALL: notand
            USE ENTITY work.notand(behavior);
        END FOR;
        FOR rs: rstr
            USE ENTITY work.rstr(behav);
        END FOR;
    END FOR;
END con;

