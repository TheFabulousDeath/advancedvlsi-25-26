library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity program_counter_wrapper is
	generic (
		offset : integer := 4
	);
	port (
		switches : in  std_logic_vector(7 downto 0);
		buttons  : in  std_logic_vector(4 downto 0);
		leds     : out std_logic_vector(7 downto 0);
		clk      : in  std_logic
	);
end entity program_counter_wrapper;

architecture behav of program_counter_wrapper is

	constant clock_div : integer := 20;
	constant cd_in : std_logic_vector(clock_div-1 downto 0) := (others => '0');

	signal pc_in, pc_out : std_logic_vector(7 downto 0);
	signal clkr, rst, cdrst, load : std_logic;
	signal cd_out : std_logic_vector(7 downto 0);

begin

	-- clock divider
	cd: entity work.program_counter
	generic map(bits => clock_div, offset => 0)
	port map (clk, cdrst, cd_out, cd_in, '0');

	-- program counter
	pc: entity work.program_counter
	generic map(bits => 8, offset => offset)
	port map (clkr, rst, pc_out, pc_in, load);

	pc_in <= switches;
	leds <= pc_out;

	rst <= buttons(0);  -- left
	load <= buttons(1); -- right

	clkr <= cd_out(clock_div-1);
	cdrst <= buttons(0) or buttons(1);

end behav;

