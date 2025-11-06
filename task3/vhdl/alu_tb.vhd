library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.isa_riscv.ALL;

entity alu_tb is

end alu_tb;

architecture Behavioral of alu_tb is
    
    signal bits : integer := 32;
    
    signal a, b, c : std_logic_vector(bits-1 downto 0);
	signal f_z, f_l : std_logic;
	signal instr : std_logic_vector(3 downto 0);
	
begin

uut : entity work.alu
generic map (bits => bits)
port map (a => a, b => b, c => c, op => instr, f_zero => f_z, f_ltzero => f_l);

process
begin
    a <= std_logic_vector(TO_SIGNED(4, a'length));
    b <= std_logic_vector(TO_SIGNED(7, b'length));
    for i in 0 to 15 loop
        instr <= std_logic_vector(TO_UNSIGNED(i, instr'length));
        wait for 60 ns;
    end loop;
    wait;
end process;

end Behavioral;
