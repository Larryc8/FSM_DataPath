Library IEEE;
use IEEE.std_logic_1164.all;
entity register is
	port ( 
		 datain :in  std_logic_vector(7 downto 0) ;
		 w: in std_logic;
		 r: in std_logic;
		 clock: in std_logic;
		 dataout: out std_logic_vector(7 downto 0)
	 );
end register;

architecture arch of register is
	 --signal q : std_logic_vector(7 downto 0);
	 begin
	process(clock, r, w) is
		begin
		 if rising_edge(clock) then
				if(w='1') then
					dataout <= datain;
				end if;
				if(r='1') then
					dataout <= datain; else dataout <= "ZZZZZZZZ";
				end if;
		 end if;
	end process;
end arch;
