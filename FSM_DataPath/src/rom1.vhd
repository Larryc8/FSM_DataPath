library ieee;
use ieee.std_logic_1164.all;

entity rom1 is
  generic (D_Width : integer := 8;
           A_Width : integer := 2);
  port (
    clk : in std_logic;
    addr : in std_logic_vector(A_Width-1 downto 0);
    data : out std_logic_vector(D_Width-1 downto 0)
       );
end entity rom1;

architecture rtl of rom1 is
  signal rom_d, data_reg : std_logic_vector(D_Width-1 downto 0);
  signal addr_sel : std_logic_vector(1 downto 0);
begin
  addr_sel <= addr;

  rom_proc : process (clk) begin
    data_reg <= rom_d;
  end process rom_proc;

  lookup_proc : process (clk) begin
    case(addr_sel) is
      when "00" => rom_d <= "00000001";
      when "01" => rom_d <= "00000010";
      when "10" => rom_d <= "00000011";
      when "11" => rom_d <= "00000100";
    end case;
  end process lookup_proc;

  data <= data_reg;

end architecture rtl;
