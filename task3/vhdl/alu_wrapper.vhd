library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.isa_riscv.ALL;

entity alu_wrapper is
	port (
		switches : in std_logic_vector(7 downto 0);
		leds : out std_logic_vector(7 downto 0);
		buttons : in std_logic_vector(4 downto 0);
		clk : in std_logic
	);
end entity alu_wrapper;

architecture behav of alu_wrapper is

	signal a, b, c : std_logic_vector(7 downto 0);
	signal r_a : std_logic_vector(7 downto 0) := (others => '0');
	signal r_b : std_logic_vector(7 downto 0) := (others => '0');
	signal r_instr : std_logic_vector(3 downto 0) := (others => '0');
	signal instr : std_logic_vector(3 downto 0) := (others => '0');

	signal r_led, led : std_logic_vector(7 downto 0) := (others => '0');

	signal f_z, f_l : std_logic;

begin

	inputs: process (buttons, switches, r_a, r_b, r_instr, c)
	begin
		a <= r_a;
		b <= r_b;
		instr <= r_instr;
		led(7 downto 0) <= c;
		if buttons(0) = '1' then
			a <= switches;
		elsif buttons(1) = '1' then
			b <= switches;
		elsif buttons(2) = '1' then
			led <= r_a;
		elsif buttons(3) = '1' then
			led <= r_b;
		else
			instr <= switches(3 downto 0);
		end if;
	end process;

	reg: process (clk)
	begin
		if rising_edge (clk) then
			r_led <= led;
			r_a <= a;
			r_b <= b;
			r_instr <= instr;
		end if;
	end process;

	ealu: entity work.alu
	generic map(bits => 8)
	port map (a => r_a, b => r_b, c => c, op => r_instr, f_zero => f_z, f_ltzero => f_l);

	
	leds <= r_led;

end behav;

