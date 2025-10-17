LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rstr IS
PORT( 
    s : IN std_logic;
    r : IN std_logic;
    q : OUT std_logic;
    qb : OUT std_logic
);
END rstr;

ARCHITECTURE behav OF rstr IS
    SIGNAL q_internal : std_logic;
    SIGNAL qb_internal : std_logic;
    
    COMPONENT notand
    PORT( 
        a : IN std_logic;
        b : IN std_logic;
        c : OUT std_logic 
    );
    END COMPONENT;
BEGIN
    q <= q_internal;
    qb <= qb_internal;
    
    u1: notand
    PORT MAP ( 
        a => s, 
        b => qb_internal,
        c => q_internal
    );
    
    u2: notand
    PORT MAP (
        a => q_internal,  
        b => r,
        c => qb_internal
    );
END behav;

CONFIGURATION con OF rstr IS
    FOR behav
        FOR u1, u2: notand
            USE ENTITY work.notand(behavior);
        END FOR;
    END FOR;
END con;
