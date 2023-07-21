library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rom1 is
    port (
		  clock : in std_logic;
		  r_rom1: in std_logic;
        dataout : out std_logic_vector (7 downto 0);
        address : in std_logic_vector (1 downto 0)
    );
end entity;

architecture arch of rom1 is

    subtype word is std_logic_vector (7 downto 0);
    type word_array is array (3 downto 0) of word;
	 signal q : std_logic_vector (7 downto 0);

    constant memory : word_array := (
			x"04",
			x"03",
			x"02",
			x"01"
   );

begin
		sync: process (clock)
			begin
			  if rising_edge(clock) then
				 q <= memory(to_integer(unsigned(address)));
			  end if;
			  if(r_rom1='1') then 
				dataout <= q; else dataout <= "ZZZZZZZZ";
			  end if;
			end process sync;
      
end architecture;