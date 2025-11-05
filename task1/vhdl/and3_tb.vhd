library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity and3_tb is
end entity and3_tb;

architecture behav of and3_tb is

	signal s_a, s_b, s_c : std_logic;
	signal p_r : std_logic;

begin

	uut: entity work.and3
	port map (
		a => s_a,
		b => s_b,
		c => s_c,
		r => p_r
	);

	sim: process
	begin
		s_a <= '0';
		s_b <= '0';
		s_c <= '0';
		wait for 10 ns;
		s_a <= '0';
		s_b <= '0';
		s_c <= '1';
		wait for 10 ns;
		s_a <= '0';
		s_b <= '1';
		s_c <= '0';
		wait for 10 ns;
		s_a <= '0';
		s_b <= '1';
		s_c <= '1';
		wait for 10 ns;
		s_a <= '1';
		s_b <= '0';
		s_c <= '0';
		wait for 10 ns;
		s_a <= '1';
		s_b <= '0';
		s_c <= '1';
		wait for 10 ns;
		s_a <= '1';
		s_b <= '1';
		s_c <= '0';
		wait for 10 ns;
		s_a <= '1';
		s_b <= '1';
		s_c <= '1';
		wait;
	end process;


end behav;

