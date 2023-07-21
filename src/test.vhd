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
-- CREATED		"Fri Jul 21 03:46:59 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY test IS 
	PORT
	(
		CLOCK :  IN  STD_LOGIC;
		RAM_EN :  IN  STD_LOGIC;
		r3 :  IN  STD_LOGIC;
		r2 :  IN  STD_LOGIC;
		w2 :  IN  STD_LOGIC;
		w1 :  IN  STD_LOGIC;
		r1 :  IN  STD_LOGIC;
		w3 :  IN  STD_LOGIC;
		w4 :  IN  STD_LOGIC;
		r4 :  IN  STD_LOGIC;
		w5 :  IN  STD_LOGIC;
		r5 :  IN  STD_LOGIC;
		r_ram :  IN  STD_LOGIC;
		r_rom2 :  IN  STD_LOGIC;
		r_rom1 :  IN  STD_LOGIC;
		ADDRES_RAM :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		ADDRES_ROM1 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		ADDRES_ROM2 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		DATA1 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA2 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		ADDER_OUTPUT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		BUS_OUTPUT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		display :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END test;

ARCHITECTURE bdf_type OF test IS 

COMPONENT rom1
	PORT(clock : IN STD_LOGIC;
		 r_rom1 : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rom2
	PORT(clock : IN STD_LOGIC;
		 r_rom1 : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram
	PORT(RAM_WR : IN STD_LOGIC;
		 RAM_CLOCK : IN STD_LOGIC;
		 r_ram : IN STD_LOGIC;
		 RAM_ADDR : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 RAM_DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 RAM_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(dataa : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rom_bcd
	PORT(clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg
	PORT(w : IN STD_LOGIC;
		 r : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 datain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	gdfx_temp0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
ADDER_OUTPUT <= SYNTHESIZED_WIRE_0;



b2v_inst : rom1
PORT MAP(clock => CLOCK,
		 r_rom1 => r_rom1,
		 address => ADDRES_ROM1,
		 dataout => gdfx_temp0);


b2v_inst10 : rom2
PORT MAP(clock => CLOCK,
		 r_rom1 => r_rom2,
		 address => ADDRES_ROM2,
		 dataout => gdfx_temp0);


b2v_inst2 : ram
PORT MAP(RAM_WR => RAM_EN,
		 RAM_CLOCK => CLOCK,
		 r_ram => r_ram,
		 RAM_ADDR => ADDRES_RAM,
		 RAM_DATA_IN => SYNTHESIZED_WIRE_0,
		 RAM_DATA_OUT => gdfx_temp0);


b2v_inst3 : alu
PORT MAP(dataa => SYNTHESIZED_WIRE_1,
		 datab => SYNTHESIZED_WIRE_2,
		 result => SYNTHESIZED_WIRE_0);


b2v_inst4 : rom_bcd
PORT MAP(clock => CLOCK,
		 address => SYNTHESIZED_WIRE_3,
		 dataout => display);


b2v_inst5 : reg
PORT MAP(w => w3,
		 r => r3,
		 clock => CLOCK,
		 datain => gdfx_temp0,
		 dataout => SYNTHESIZED_WIRE_1);


b2v_inst6 : reg
PORT MAP(w => w4,
		 r => r4,
		 clock => CLOCK,
		 datain => gdfx_temp0,
		 dataout => SYNTHESIZED_WIRE_2);


b2v_inst7 : reg
PORT MAP(w => w1,
		 r => r1,
		 clock => CLOCK,
		 datain => DATA1,
		 dataout => gdfx_temp0);


b2v_inst8 : reg
PORT MAP(w => w2,
		 r => r2,
		 clock => CLOCK,
		 datain => DATA2,
		 dataout => gdfx_temp0);


b2v_inst9 : reg
PORT MAP(w => w5,
		 r => r5,
		 clock => CLOCK,
		 datain => gdfx_temp0,
		 dataout => SYNTHESIZED_WIRE_3);

BUS_OUTPUT <= gdfx_temp0;

END bdf_type;