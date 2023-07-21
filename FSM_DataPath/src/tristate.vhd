library ieee;
use ieee.std_logic_1164.all;

entity tristate is
  port (
    r : in std_logic;
    q : in std_logic_vector(7 downto 0);
    dataout : out std_logic_vector(7 downto 0)
       );
end entity tristate;

architecture rtl of tristate is
begin
  dataout <= q when (r = '1') else
             (others => 'Z');
end architecture rtl;
