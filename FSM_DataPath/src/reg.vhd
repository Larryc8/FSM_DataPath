Library IEEE;
use IEEE.std_logic_1164.all;
entity reg is
	port ( 
		 datain :in  std_logic_vector(7 downto 0) ;
		 w: in std_logic;
		 r: in std_logic;
		 clock: in std_logic;
		 dataout: out std_logic_vector(7 downto 0)
	 );
end entity reg;

architecture arch of reg is
	 --signal q : std_logic_vector(7 downto 0);
	 begin
	process(clock, r, w) is
    variable data : std_logic_vector(7 downto 0);
		begin
		 if rising_edge(clock) then
				if(w='1') then
          data := datain;
				end if;
				if(r='1') then
					dataout <= data; else dataout <= "ZZZZZZZZ";
				end if;
		 end if;
	end process;
end architecture arch;
