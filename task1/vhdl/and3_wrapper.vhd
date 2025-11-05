library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity and3_wrapper is
	port (
		switches : in std_logic_vector(7 downto 0);
		leds : out std_logic_vector(7 downto 0);
		clk : in std_logic
	);
end entity and3_wrapper;

architecture behav of and3_wrapper is

	signal r_leds : std_logic_vector(7 downto 0) := (others => '0');
	signal a, b, c, r : std_logic;

begin

	process (clk)
	begin
		if rising_edge (clk) then
			r_leds(2 downto 0) <= switches(2 downto 0);
			r_leds(7) <= r;
		end if;
	end process;

	gate: entity work.and3
	port map (
		a, b, c, r
	);

	a <= switches(0);
	b <= switches(1);
	c <= switches(2);
	
	leds <= r_leds;

end behav;

