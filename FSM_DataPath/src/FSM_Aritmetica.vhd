library ieee;
use ieee.std_logic_1164.all;

entity FSM_Aritmetica is

	port(
		clk		 : in	std_logic;		
		reset	 : in	std_logic;
		load1, view1, load2, view2, startOP, view, next1, endedOP, endview: in	std_logic;
		count_en, ram_en	 : out	std_logic;
		r1,r2,r3, r4,r5, r_rom1, r_rom2, r_ram	 : out	std_logic;
		w1,w2,w3, w4,w5	 : out	std_logic
	);

end entity;

architecture rtl of FSM_Aritmetica is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if load1 = '1' then
						state <= s1;
					else
						state <= s0;
					end if;	
					
				when s1=>
					if view1 = '1' then
						state <= s2;
					else
						state <= s1;
					end if;	
					
				when s2=>
					if load2 = '1' then
						state <= s3;
					else
						state <= s2;
					end if;	
					
				when s3=>
					if view2 = '1' then
						state <= s4;
					else
						state <= s3;
					end if;	
	
				when s4=>
					if startOP = '0' and view = '0' then
						state <= s4;
					elsif startOP = '1' and view = '1' then
						state <= s4;
					elsif startOP = '1' and view = '0' then
						state <= s5;
					elsif startOP = '0' and view = '1' then
						state <= s14;
					end if;		
				
				when s5=>
					state <= s6;			
			
				when s6=>
					state <= s7;		
				
				when s7=>
					state <= s8;
					
		      when s8=>
					state <= s9;
				
				when s9=>
					state <= s10;
					
				when s10=>
					state <= s11;
					
				when s11=>
					state <= s12;
				
				when s12=>
					state <= s13;
				
				when s13=>
					if endedOP = '1' then
						state <= s4;
					else
						state <= s16;
					end if;
				
				when s16=>
						state <= s5;	
					
					
				when s14=>
					if endview = '0' and next1 = '0' then
						state <= s15;
					elsif endview = '1' and next1 = '1' then
						state <= s4;
					elsif endview = '1' and next1 = '0' then
						state <= s4;
					elsif endview = '0' and next1 = '1' then
						state <= s14;
					end if;		

				when s15=>
					if next1 = '1' then
						state <= s14;
					else
						state <= s15;
					end if;	
					
				
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
				when s0=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';

				when s1=>
					w1 <= '1';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
					
				when s2=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '1';
					r1 <= '1';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '1';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
				
				when s3=>
					w1 <= '0';
					w2 <= '1';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
					
				when s4=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '1';
					r1 <= '0';
					r2 <= '1';
					r3 <= '0';
					r4 <= '0';
					r5 <= '1';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';

					
				when s5=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '1';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '1';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
				
				when s6=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '1';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '1';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
				
				when s7=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '1';
					r4 <= '1';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '1';
				
				when s8=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '1';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '1';
					count_en <= '0';
					ram_en <= '0';
					
				when s9=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '1';
					w5 <= '0';
					r1 <= '1';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
					
				when s10=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '1';
					r4 <= '1';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '1';
					
				when s11=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '1';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '1';
					count_en <= '0';
					ram_en <= '0';
					
				when s12=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '1';
					w5 <= '0';
					r1 <= '0';
					r2 <= '1';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
					
				when s13=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '1';
					r4 <= '1';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '1';
					ram_en <= '1';
					
				when s14=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '1';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '1';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '1';
					count_en <= '1';
					ram_en <= '0';
					
				when s15=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';
					
					when s16=>
					w1 <= '0';
					w2 <= '0';
					w3 <= '0';
					w4 <= '0';
					w5 <= '0';
					r1 <= '0';
					r2 <= '0';
					r3 <= '0';
					r4 <= '0';
					r5 <= '0';
					r_rom1 <= '0';
					r_rom2 <= '0';
					r_ram <= '0';
					count_en <= '0';
					ram_en <= '0';

			end case;
	end process;

end rtl;
