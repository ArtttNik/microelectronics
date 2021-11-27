LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY punkt5_11 IS 
PORT 
( 
X : std_logic_vector(7 downto 0);
D: IN std_logic;
Odd, Even: INOUT std_logic
);
END punkt5_11; 
architecture behav of punkt5_11 is 
begin
Odd<= (((X(0) xor X(1)) xor (X(2) xor X(3))) xor ((X(4) xor X(5)) xor (X(6) xor X(7)))) xor D;
Even<= not Odd;
end behav;

