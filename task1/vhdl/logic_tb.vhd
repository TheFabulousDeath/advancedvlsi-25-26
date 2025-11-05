library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity logic_tb is
end entity logic_tb;

architecture behav of logic_tb is

	signal switch : std_logic_vector (7 downto 0);
	signal expected, led : std_logic_vector (7 downto 0);
	signal correct : std_logic;

begin

	uut: entity work.logic
	port map (
		s0 => switch(0),
		s1 => switch(1),
		s2 => switch(2),
		s3 => switch(3),
		s4 => switch(4),
		s5 => switch(5),
		s6 => switch(6),
		s7 => switch(7),
		l0 => led(0),
		l1 => led(1),
		l2 => led(2),
		l3 => led(3),
		l4 => led(4),
		l5 => led(5),
		l6 => led(6),
		l7 => led(7)
	);

	sim: process
	begin
		switch <= x"c1";
		expected <= x"c1";
		wait for 1 ns;
		switch <= x"f1";
		expected <= x"19";
		wait for 1 ns;
		switch <= x"89";
		expected <= x"9b";
		wait for 1 ns;
		switch <= x"b5";
		expected <= x"5d";
		wait for 1 ns;
		switch <= x"23";
		expected <= x"fa";
		wait for 1 ns;
		switch <= x"95";
		expected <= x"f5";
		wait for 1 ns;
		switch <= x"f2";
		expected <= x"9b";
		wait for 1 ns;
		switch <= x"34";
		expected <= x"5c";
		wait for 1 ns;
		switch <= x"83";
		expected <= x"da";
		wait for 1 ns;
		switch <= x"46";
		expected <= x"df";
		wait for 1 ns;
		switch <= x"ef";
		expected <= x"34";
		wait for 1 ns;
		switch <= x"d3";
		expected <= x"ba";
		wait for 1 ns;
		switch <= x"56";
		expected <= x"af";
		wait for 1 ns;
		switch <= x"f3";
		expected <= x"1a";
		wait for 1 ns;
		switch <= x"44";
		expected <= x"d4";
		wait for 1 ns;
		switch <= x"63";
		expected <= x"aa";
		wait for 1 ns;
		switch <= x"d6";
		expected <= x"2f";
		wait for 1 ns;
		switch <= x"21";
		expected <= x"b9";
		wait for 1 ns;
		switch <= x"14";
		expected <= x"f4";
		wait for 1 ns;
		switch <= x"b4";
		expected <= x"dc";
		wait for 1 ns;
		wait;
	end process;

	correct <= '1' when expected = led else '0';

end behav;

