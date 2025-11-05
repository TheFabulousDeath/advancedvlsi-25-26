library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity adder_tb is
end entity adder_tb;

architecture behav of adder_tb is

	constant w : integer := 32;
	signal s_a, s_b : std_logic_vector(w-1 downto 0);
	signal p_c : std_logic_vector(w-1 downto 0);
	signal e_c : std_logic_vector(w-1 downto 0);
	signal correct : std_logic;

begin

	uut: entity work.adder
	generic map (
		bits => w
	)
	port map (
		s_a,
		s_b,
		p_c
	);

	check: process (e_c, p_c)
	begin
		correct <= '0';
		if e_c = p_c then
			correct <= '1';
		end if;
	end process;

	sim: process
	begin

		s_a <= x"00000000";  -- 0
        s_b <= x"00000001";  -- 1
        e_c <= x"00000001";  -- 1
        wait for 10 ns;

        s_a <= x"00000002";  -- 2
        s_b <= x"00000002";  -- 2
        e_c <= x"00000004";  -- 4
        wait for 10 ns;

        s_a <= x"ffffffff";  -- -1
        s_b <= x"00000004";  -- 4
        e_c <= x"00000003";  -- 3
        wait for 10 ns;

        s_a <= x"ffffff29";  -- -215
        s_b <= x"00000053";  -- 83
        e_c <= x"ffffff7c";  -- -132
        wait for 10 ns;

        s_a <= x"00000035";  -- 53
        s_b <= x"00000010";  -- 16
        e_c <= x"00000045";  -- 69
        wait for 10 ns;

        s_a <= x"000000a3";  -- 163
        s_b <= x"000000c9";  -- 201
        e_c <= x"0000016c";  -- 364
        wait for 10 ns;

        s_a <= x"000000d8";  -- 216
        s_b <= x"ffffffa6";  -- -90
        e_c <= x"0000007e";  -- 126
        wait for 10 ns;

        s_a <= x"00000068";  -- 104
        s_b <= x"000000f4";  -- 244
        e_c <= x"0000015c";  -- 348
        wait for 10 ns;

        s_a <= x"ffffffa0";  -- -96
        s_b <= x"ffffff78";  -- -136
        e_c <= x"ffffff18";  -- -232
        wait for 10 ns;

        s_a <= x"000000f9";  -- 249
        s_b <= x"ffffff8e";  -- -114
        e_c <= x"00000087";  -- 135
        wait for 10 ns;

        s_a <= x"00000080";  -- 128
        s_b <= x"00000000";  -- 0
        e_c <= x"00000080";  -- 128
        wait for 10 ns;

        s_a <= x"0000009e";  -- 158
        s_b <= x"ffffff90";  -- -112
        e_c <= x"0000002e";  -- 46
        wait for 10 ns;

        s_a <= x"ffffff18";  -- -232
        s_b <= x"ffffff91";  -- -111
        e_c <= x"fffffea9";  -- -343

		wait;

	end process;

end behav;

