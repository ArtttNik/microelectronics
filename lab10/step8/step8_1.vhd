LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
ENTITY step8_1 IS 
PORT 
	(x1,x2,x0 : IN STD_logic;
	even, odd: OUT STD_logic);
END step8_1; 

architecture behav of step8_1 is 
begin  
	process(x1,x2,x0)
	begin
		even <= not(((x0 xor x1) xor x2));
		odd <= ((x0 xor x1) xor x2);
	end process;
end behav;
