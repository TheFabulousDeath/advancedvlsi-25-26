library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.instruction_ranges.all;
use work.opcodes.all;

entity immediate_generator is
	port(
            Instruction : in STD_LOGIC_VECTOR(instruction_range);
            Immediate : out STD_LOGIC_VECTOR(instruction_range)
	);
end entity;

architecture behav of immediate_generator is

	signal imm_result : STD_LOGIC_VECTOR(instruction_range);

begin

	process(Instruction) is
		variable imm : STD_LOGIC_VECTOR(instruction_range);
		variable op  : STD_LOGIC_VECTOR(6 downto 0);
	begin
		op := Instruction(opcode_range);

		case op is

			-- U type
			when OP_LUI        |
			    OP_AUIPC =>
				imm(31 downto 20) := Instruction(I_immediate_range);
				imm(19 downto 12) := Instruction(19 downto 12);
				imm(11 downto 0)  := (others => '0');

			-- J type
			when OP_JAL =>
				imm(31 downto 20) := (others => Instruction(31));
				imm(19 downto 12) := Instruction(19 downto 12);
				imm(11)           := Instruction(20);
				imm(10 downto 5)  := Instruction(30 downto 25);
				imm(4 downto 1)   := Instruction(24 downto 21);
				imm(0)            := '0';

			-- I type
			when OP_JALR       |
			    OP_REG_IMM     |
			    OP_LOAD        |
			    OP_FENCE       |
			    OP_SYSTEM  =>
				imm(31 downto 12) := (others => Instruction(31));
				imm(11 downto 5)  := Instruction(funct7_range);
				imm(4 downto 0)   := Instruction(rs2_range);

			-- B type
			when OP_BRANCH =>
				imm(31 downto 12) := (others => Instruction(31));
				imm(11)           := Instruction(7);
				imm(10 downto 5)  := Instruction(30 downto 25);
				imm(4 downto 1)   := Instruction(11 downto 8);
				imm(0)            := '0';

			-- S type
			when OP_STORE =>
				imm(31 downto 12) := (others => Instruction(31));
				imm(11 downto 5)  := Instruction(funct7_range);
				imm(4 downto 0)   := Instruction(rd_range);

			-- R type or unknown
			when others =>
				imm := (others => '0');

		end case;

		imm_result <= imm;
	end process;
    
    Immediate <= imm_result;
    
end architecture;
