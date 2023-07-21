library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- FPGA projects using Verilog code VHDL code
-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL project: VHDL code for counters with testbench  
-- VHDL project: VHDL code for up counter   
entity counter is
    Port ( clk: in std_logic; -- clock input 
			  count_en : in std_logic;
           count_up: out std_logic_vector(1 downto 0);
			  count_down: out std_logic_vector(1 downto 0);
			  count_is_ended : out std_logic
     );
end counter;

architecture arch of counter is
	signal count: std_logic_vector(1 downto 0);
	begin
	-- up counter
		process(clk)
		begin 
		if(rising_edge(clk)) then
				if(count_en='1') then
				 count <= count + "01";
				 end if;
		 end if;
		end process;
		count_up <= count;
		count_down(0) <= not count(0);
		count_down(1) <= not count(1);
		
		count_is_ended <= count(0) and  count(1);
end arch;

