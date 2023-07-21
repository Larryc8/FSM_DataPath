-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Fri Jul 21 11:13:39 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FSM_Datapath IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		load1 :  IN  STD_LOGIC;
		view1 :  IN  STD_LOGIC;
		load2 :  IN  STD_LOGIC;
		view2 :  IN  STD_LOGIC;
		startOP :  IN  STD_LOGIC;
		view :  IN  STD_LOGIC;
		next1 :  IN  STD_LOGIC;
		DATA :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		r1 :  OUT  STD_LOGIC;
		r2 :  OUT  STD_LOGIC;
		w1 :  OUT  STD_LOGIC;
		w2 :  OUT  STD_LOGIC;
		ADDER_OUTPUT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		BUS_OUTPUT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		CENT :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		DEC :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		display :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		UNIT :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END FSM_Datapath;

ARCHITECTURE bdf_type OF FSM_Datapath IS 

COMPONENT datapath
	PORT(CLOCK : IN STD_LOGIC;
		 RAM_EN : IN STD_LOGIC;
		 r3 : IN STD_LOGIC;
		 r2 : IN STD_LOGIC;
		 w2 : IN STD_LOGIC;
		 w1 : IN STD_LOGIC;
		 r1 : IN STD_LOGIC;
		 w3 : IN STD_LOGIC;
		 w4 : IN STD_LOGIC;
		 r4 : IN STD_LOGIC;
		 w5 : IN STD_LOGIC;
		 r5 : IN STD_LOGIC;
		 r_ram : IN STD_LOGIC;
		 r_rom2 : IN STD_LOGIC;
		 r_rom1 : IN STD_LOGIC;
		 ADDRES_RAM : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 ADDRES_ROM1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 ADDRES_ROM2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 DATA1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 DATA2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ADDER_OUTPUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 BUS_OUTPUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 display : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT displays
	PORT(BCDin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Seven_Segment : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fsm_aritmetica
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 load1 : IN STD_LOGIC;
		 view1 : IN STD_LOGIC;
		 load2 : IN STD_LOGIC;
		 view2 : IN STD_LOGIC;
		 startOP : IN STD_LOGIC;
		 view : IN STD_LOGIC;
		 next1 : IN STD_LOGIC;
		 endedOP : IN STD_LOGIC;
		 endview : IN STD_LOGIC;
		 count_en : OUT STD_LOGIC;
		 ram_en : OUT STD_LOGIC;
		 r1 : OUT STD_LOGIC;
		 r2 : OUT STD_LOGIC;
		 r3 : OUT STD_LOGIC;
		 r4 : OUT STD_LOGIC;
		 r5 : OUT STD_LOGIC;
		 r_rom1 : OUT STD_LOGIC;
		 r_rom2 : OUT STD_LOGIC;
		 r_ram : OUT STD_LOGIC;
		 w1 : OUT STD_LOGIC;
		 w2 : OUT STD_LOGIC;
		 w3 : OUT STD_LOGIC;
		 w4 : OUT STD_LOGIC;
		 w5 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT counter
	PORT(clk : IN STD_LOGIC;
		 count_en : IN STD_LOGIC;
		 count_is_ended : OUT STD_LOGIC;
		 count_down : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 count_up : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	display_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;


BEGIN 
r1 <= SYNTHESIZED_WIRE_5;
r2 <= SYNTHESIZED_WIRE_2;
w1 <= SYNTHESIZED_WIRE_4;
w2 <= SYNTHESIZED_WIRE_3;



b2v_inst : datapath
PORT MAP(CLOCK => clk,
		 RAM_EN => SYNTHESIZED_WIRE_0,
		 r3 => SYNTHESIZED_WIRE_1,
		 r2 => SYNTHESIZED_WIRE_2,
		 w2 => SYNTHESIZED_WIRE_3,
		 w1 => SYNTHESIZED_WIRE_4,
		 r1 => SYNTHESIZED_WIRE_5,
		 w3 => SYNTHESIZED_WIRE_6,
		 w4 => SYNTHESIZED_WIRE_7,
		 r4 => SYNTHESIZED_WIRE_8,
		 w5 => SYNTHESIZED_WIRE_9,
		 r5 => SYNTHESIZED_WIRE_10,
		 r_ram => SYNTHESIZED_WIRE_11,
		 r_rom2 => SYNTHESIZED_WIRE_12,
		 r_rom1 => SYNTHESIZED_WIRE_13,
		 ADDRES_RAM => SYNTHESIZED_WIRE_20,
		 ADDRES_ROM1 => SYNTHESIZED_WIRE_20,
		 ADDRES_ROM2 => SYNTHESIZED_WIRE_16,
		 DATA1 => DATA,
		 DATA2 => DATA,
		 ADDER_OUTPUT => ADDER_OUTPUT,
		 BUS_OUTPUT => BUS_OUTPUT,
		 display => display_ALTERA_SYNTHESIZED);


b2v_inst1 : displays
PORT MAP(BCDin => display_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 Seven_Segment => UNIT);


b2v_inst2 : fsm_aritmetica
PORT MAP(clk => clk,
		 reset => reset,
		 load1 => load1,
		 view1 => view1,
		 load2 => load2,
		 view2 => view2,
		 startOP => startOP,
		 view => view,
		 next1 => next1,
		 endedOP => SYNTHESIZED_WIRE_21,
		 endview => SYNTHESIZED_WIRE_21,
		 count_en => SYNTHESIZED_WIRE_19,
		 ram_en => SYNTHESIZED_WIRE_0,
		 r1 => SYNTHESIZED_WIRE_5,
		 r2 => SYNTHESIZED_WIRE_2,
		 r3 => SYNTHESIZED_WIRE_1,
		 r4 => SYNTHESIZED_WIRE_8,
		 r5 => SYNTHESIZED_WIRE_10,
		 r_rom1 => SYNTHESIZED_WIRE_13,
		 r_rom2 => SYNTHESIZED_WIRE_12,
		 r_ram => SYNTHESIZED_WIRE_11,
		 w1 => SYNTHESIZED_WIRE_4,
		 w2 => SYNTHESIZED_WIRE_3,
		 w3 => SYNTHESIZED_WIRE_6,
		 w4 => SYNTHESIZED_WIRE_7,
		 w5 => SYNTHESIZED_WIRE_9);


b2v_inst3 : counter
PORT MAP(clk => clk,
		 count_en => SYNTHESIZED_WIRE_19,
		 count_is_ended => SYNTHESIZED_WIRE_21,
		 count_down => SYNTHESIZED_WIRE_16,
		 count_up => SYNTHESIZED_WIRE_20);


b2v_inst4 : displays
PORT MAP(BCDin => display_ALTERA_SYNTHESIZED(7 DOWNTO 4),
		 Seven_Segment => DEC);


b2v_inst5 : displays
PORT MAP(BCDin => display_ALTERA_SYNTHESIZED(11 DOWNTO 8),
		 Seven_Segment => CENT);

display <= display_ALTERA_SYNTHESIZED;

END bdf_type;