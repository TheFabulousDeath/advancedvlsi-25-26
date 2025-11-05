library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity logic_wrapper is
	port (
		switches : in std_logic_vector(7 downto 0);
		leds : out std_logic_vector(7 downto 0);
		clk : in std_logic;
		rst : in std_logic
	);
end entity logic_wrapper;

architecture behav of logic_wrapper is

	signal leds_reg, leds_val : std_logic_vector(7 downto 0);

begin

	sync: process (clk, rst)
	begin
		if rst = '1' then
			leds_reg <= "10011100";
		elsif rising_edge(clk) then
			leds_reg <= leds_val;
		end if;
	end process;

	core: entity work.logic
	port map (
		s0 => switches(0),
		s1 => switches(1),
		s2 => switches(2),
		s3 => switches(3),
		s4 => switches(4),
		s5 => switches(5),
		s6 => switches(6),
		s7 => switches(7),
		l0 => leds_val(0),
		l1 => leds_val(1),
		l2 => leds_val(2),
		l3 => leds_val(3),
		l4 => leds_val(4),
		l5 => leds_val(5),
		l6 => leds_val(6),
		l7 => leds_val(7)
	);

	leds <= leds_reg;
	

end behav;

