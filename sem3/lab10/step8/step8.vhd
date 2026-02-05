library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity step8 is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        p_in     : in  STD_LOGIC;
        even_out : out STD_LOGIC
    );
end step8;

architecture Structural of step8 is
    
    component step8_1 is
        Port ( 
            x0, x1, x2 : in STD_LOGIC;
            even, odd   : out STD_LOGIC
        );
    end component;
    
    signal even1, even2, even3 : STD_LOGIC;
    
begin
    
    elem1: step8_1 port map(
        x0 => data_in(0),
        x1 => data_in(1), 
        x2 => data_in(2),
        even => even1,
        odd => open
    );
    
    elem2: step8_1 port map(
        x0 => data_in(3),
        x1 => data_in(4),
        x2 => data_in(5),
        even => even2,
        odd => open
    );
    
    elem3: step8_1 port map(
        x0 => data_in(6),
        x1 => data_in(7),
        x2 => p_in,
        even => even3,
        odd => open
    );
    
    elem4: step8_1 port map(
        x0 => even1,
        x1 => even2, 
        x2 => even3,
        even => even_out,
        odd => open
    );
    
end Structural;