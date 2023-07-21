library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ALU is
  port (
    dataa : in std_logic_vector(7 downto 0);
    datab : in std_logic_vector(7 downto 0);
    result : out std_logic_vector(7 downto 0)
       );
end entity ALU;

architecture rtl of ALU is
  signal num1 : unsigned(7 downto 0);
  signal num2 : unsigned(7 downto 0);
begin
  num1 <= unsigned(dataa);
  num2 <= unsigned(datab);
  result <= num1 + num2;
end architecture rtl;
