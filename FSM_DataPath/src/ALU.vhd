library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ALU is
  port (
    dataa : in unsigned(7 downto 0);
    datab : in unsigned(7 downto 0);
    result : out unsigned(7 downto 0)
       );
end entity ALU;

architecture rtl of ALU is
begin
  result <= dataa + datab;
end architecture rtl;
