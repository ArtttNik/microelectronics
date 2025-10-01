LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY scheme9_14 IS
  PORT
  (
    X1 : IN std_logic;
    X2 : IN std_logic;
    X3 : IN std_logic;
    X4 : IN std_logic;
    Q1 : OUT std_logic;
    Q2 : OUT std_logic;
    Q3 : OUT std_logic;
    Q4 : OUT std_logic;
    WRITE : IN std_logic;
    RESET : IN std_logic;
    READ : IN std_logic
  );
END scheme9_14;

ARCHITECTURE behav OF scheme9_14 IS
  SIGNAL p1, p2, p3, p4 : std_logic;
  BEGIN
    PROCESS (WRITE, RESET, X1, X2, X3, X4)
    BEGIN
      IF (RESET = '0') THEN
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
      ELSIF RISING_EDGE(WRITE) THEN
        p1 <= X1;
        p2 <= X2;
        p3 <= X3;
        p4 <= X4;
      END IF;
    END PROCESS;
    PROCESS (READ, p1, p2, p3, p4)
    BEGIN
        Q1 <= (p1 AND READ);
        Q2 <= (p2 AND READ);
        Q3 <= (p3 AND READ);
        Q4 <= (p4 AND READ);
    END PROCESS;
  END behav;
