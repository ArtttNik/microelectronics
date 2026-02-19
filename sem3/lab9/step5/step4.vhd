LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY step4 IS
PORT (
	X: in std_logic_vector(1 to 0);
	Y: in std_logic_vector(1 to 0);
	
	XMY0, XLY0, XEY0 : in std_logic;
	XMY, XLY, XEY : out std_logic
);
end step4;


architecture behave of step4 is
begin
	Process(X, Y, XMY0, XEY0, XLY0)
	begin
			if(X>Y) then
				XLY<='0';
				XEY<='0';
				XMY<='1';
			elsif(X<Y) then
				XLY<='1';
				XEY<='0';
				XMY<='0';			
			else
				XMY<=XMY0;
				XLY<=XLY0;
				XEY<=XEY0;
			end if;
	end process;
end behave;

