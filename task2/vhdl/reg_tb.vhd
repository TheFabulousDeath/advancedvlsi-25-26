library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity reg_tb is
end entity reg_tb;

architecture behav of reg_tb is

	constant w : integer := 32;
	constant clk_period : time := 10 ns;
	signal s_d : std_logic_vector(w-1 downto 0);
	signal p_q : std_logic_vector(w-1 downto 0);
	signal clk, rst : std_logic;
	signal e_q : std_logic_vector(w-1 downto 0);
	signal correct : std_logic;

begin
	
	uut: entity work.reg
		generic map (
			bits => w
		)
		port map (
			d => s_d,
			q => p_q,
			clk => clk,
			rst => rst
		);

	vclk: process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	check: process (e_q, p_q)
	begin
		correct <= '0';
		if e_q = p_q then
			correct <= '1';
		end if;
	end process;

	cmp: process (clk, rst)
	begin
		if rst = '1' then
			e_q <= (others => '0');
		elsif rising_edge(clk) then
			e_q <= s_d;
		end if;
	end process;

	sim: process
	begin
		rst <= '1';
		wait for clk_period;
		
		s_d <= x"00000042";
		wait for clk_period;

		rst <= '0';
		wait for clk_period;

		s_d <= x"0110f7c3";
		wait for clk_period;

		wait for clk_period;

		s_d <= x"11adf723";
		wait for clk_period;

		rst <= '1';
		wait for clk_period;

		rst <= '0';
		wait for clk_period;

		wait;
	end process;

end behav;

