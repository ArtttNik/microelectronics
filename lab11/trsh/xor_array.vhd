library ieee;
use ieee.std_logic_1164.all;

entity XOR_ARRAY is
  port
  (
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Y : out std_logic_vector(7 downto 0)
  );
end XOR_ARRAY;

architecture structural of XOR_ARRAY is
begin
  Y(0) <= A(0) xor B(0);
  Y(1) <= A(1) xor B(1);
  Y(2) <= A(2) xor B(2);
  Y(3) <= A(3) xor B(3);
  Y(4) <= A(4) xor B(4);
  Y(5) <= A(5) xor B(5);
  Y(6) <= A(6) xor B(6);
  Y(7) <= A(7) xor B(7);
end structural;
