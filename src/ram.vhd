library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity ram is
port(
 RAM_ADDR: in std_logic_vector(1 downto 0); -- Address to write/read RAM
 RAM_DATA_IN: in std_logic_vector(7 downto 0); -- Data to write into RAM
 RAM_WR: in std_logic; -- Write enable 
 RAM_CLOCK: in std_logic; -- clock input for RAM
 RAM_DATA_OUT: out std_logic_vector(7 downto 0); -- Data output of RAM
 r_ram: in std_logic
);
end entity ram;

architecture rtl of ram is
-- define the new type for the 128x8 RAM 
type RAM_ARRAY is array (0 to 3 ) of std_logic_vector (7 downto 0);
-- initial values in the RAM
signal RAM: RAM_ARRAY :=(
   x"00",x"00",x"00",x"00"
   ); 
signal q: std_logic_vector(7 downto 0);

begin
process(RAM_CLOCK)
begin
 if(rising_edge(RAM_CLOCK)) then
	 if(RAM_WR='1') then -- when write enable = 1, 
	 -- write input data into RAM at the provided address
	 RAM(to_integer(unsigned(RAM_ADDR))) <= RAM_DATA_IN;
	 -- The index of the RAM array type needs to be integer so
	 -- converts RAM_ADDR from std_logic_vector -> Unsigned -> Interger using numeric_std library
	 end if;
 end if;
 q <= RAM(to_integer(unsigned(RAM_ADDR)));
 if(r_ram='1') then
	RAM_DATA_OUT <= q; else RAM_DATA_OUT <= "ZZZZZZZZ";
 end if;
end process;
 -- Data to be read out 
 
end architecture rtl;
