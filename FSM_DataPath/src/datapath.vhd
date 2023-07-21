library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  port(
  r1, w1, re, w2, r3, w3, r2, r4, w4, r5, w5, r_rom1, r_rom2, r_ram, ram_en : in std_logic;
  clk : in std_logic;
  addres_rom1, addres_rom2, addres_ram : in std_logic_vector(1 downto 0);
  datain : in std_logic_vector(7 downto 0);
  uni, dec, cen : out std_logic_vector(6 downto 0)
      );
end entity datapath;

architecture rtl of datapath is
  signal mybus : std_logic_vector(7 downto 0);
  signal data_rom1, data_rom2, data_reg5, data_reg3, data_reg4, sum_result, data_ram : std_logic_vector(7 downto 0);
  signal display : std_logic_vector(11 downto 0);
begin
  -- Definiendo los componentes
  -- Los de entradas
  rom1 : entity work.rom1 
  port map(
  clk => clk,
  addr => addres_rom1,
  data => data_rom1
          );
  triest_rom1 : entity work.tristate
  port map(
    r => r_rom1,
    q => data_rom1,
    dataout => mybus
          );
  rom2 : entity work.rom2 
  port map(
  clk => clk,
  addr => addres_rom2,
  data => data_rom2
          );
  triest_rom2 : entity work.tristate
  port map(
    r => r_rom2,
    q => data_rom2,
    dataout => mybus
          );
  reg1 : entity work.reg
  port map(
    datain => datain,
    w => w1,
    r => r1,
    clock => clk,
    dataout => mybus
          );
  reg2 : entity work.reg
  port map(
    datain => datain,
    w => w2,
    r => r2,
    clock => clk,
    dataout => mybus
          );

  -- Los de visualizacion
  reg5 : entity work.reg
  port map(
    datain => mybus,
    w => w5,
    r => r5,
    clock => clk,
    dataout => data_reg5
          );
  rom_bcd : entity work.rom_bcd 
  port map(
    clock => clk,
    address => data_reg5,
    dataout => display
          );

  -- Los displays
  unidades : entity work.displays 
  port map(
    BCDin => display(3 downto 0),
    Seven_Segment => uni
          );
  decenas : entity work.displays 
  port map(
    BCDin => display(7 downto 4),
    Seven_Segment => dec
          );
  centenas : entity work.displays 
  port map(
    BCDin => display(11 downto 8),
    Seven_Segment => cen
          );

  -- Aritmetica
  reg3 : entity work.reg
  port map(
    datain => mybus,
    w => w3,
    r => r3,
    clock => clk,
    dataout => data_reg3
          );
  reg4 : entity work.reg
  port map(
    datain => mybus,
    w => w4,
    r => r4,
    clock => clk,
    dataout => data_reg4
          );
  ALU : entity work.ALU 
  port map(
    dataa => data_reg3,
    datab => data_reg4,
    result => sum_result
          );
  ram : entity work.ram 
  port map(
    RAM_ADDR => addres_ram,
    RAM_DATA_IN => sum_result,
    RAM_WR => ram_en,
    RAM_CLOCK => clk,
    RAM_DATA_OUT => data_ram
          );
  triest_ram : entity work.tristate
  port map(
    r => r_ram,
    q => data_ram,
    dataout => mybus
          );
end architecture rtl;
