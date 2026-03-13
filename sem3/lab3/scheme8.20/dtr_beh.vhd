LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtr_beh IS
PORT(
    d  : IN std_logic;
    l  : IN std_logic;
    q  : OUT std_logic;
    qb : OUT std_logic
);
END dtr_beh;

ARCHITECTURE behav OF dtr_beh IS
    SIGNAL qs : std_logic := '0';
BEGIN
    PROCESS(l)
    BEGIN
        IF rising_edge(l) THEN
            qs <= d;
        END IF;
    END PROCESS;

    q  <= qs;
    qb <= NOT qs;
END behav;

