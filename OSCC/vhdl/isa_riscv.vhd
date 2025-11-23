library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

package	alu_control is
    -- Bit 5 from the funct7 & funct3 (concatenated).
	constant ALUOp_ADD : std_logic_vector(3 downto 0) := "0000";
	constant ALUOp_SUB : std_logic_vector(3 downto 0) := "1000";
	constant ALUOp_SLL : std_logic_vector(3 downto 0) := "0001";
	constant ALUOp_SLT : std_logic_vector(3 downto 0) := "0010";
	constant ALUOp_SLTU: std_logic_vector(3 downto 0) := "0011";
	constant ALUOp_XOR : std_logic_vector(3 downto 0) := "0100";
	constant ALUOp_SRL : std_logic_vector(3 downto 0) := "0101";
	constant ALUOp_SRA : std_logic_vector(3 downto 0) := "1101";
	constant ALUOp_OR  : std_logic_vector(3 downto 0) := "0110";
	constant ALUOp_AND : std_logic_vector(3 downto 0) := "0111";

end alu_control;

package instruction_ranges is

    subtype INSTRUCTION_RANGE       is integer range 31 downto 0;
    subtype FUNCT7_RANGE            is integer range 31 downto 25;
    subtype RS2_RANGE               is integer range 24 downto 20;
    subtype RS1_RANGE               is integer range 19 downto 15;
    subtype FUNCT3_RANGE            is integer range 14 downto 12;
    subtype RD_RANGE                is integer range 11 downto 7;
    subtype I_IMMEDIATE_RANGE       is integer range 31 downto 20;
    subtype J_IMMEDIATE_RANGE       is integer range 31 downto 12;
    subtype OPCODE_RANGE            is integer range 6 downto 0;

end instruction_ranges;

library IEEE;
use IEEE.std_logic_1164.ALL;

package funct3 is

    constant F3_JALR      : std_logic_vector(2 downto 0) := "000";   
    constant F3_BEQ       : std_logic_vector(2 downto 0) := "000";
    constant F3_BNE       : std_logic_vector(2 downto 0) := "001";
    constant F3_BLT       : std_logic_vector(2 downto 0) := "100";
    constant F3_BGE       : std_logic_vector(2 downto 0) := "101";
    constant F3_BLTU      : std_logic_vector(2 downto 0) := "110";
    constant F3_BGEU      : std_logic_vector(2 downto 0) := "111";
    constant F3_LB        : std_logic_vector(2 downto 0) := "000";
    constant F3_LH        : std_logic_vector(2 downto 0) := "001";
    constant F3_LW        : std_logic_vector(2 downto 0) := "010";
    constant F3_LBU       : std_logic_vector(2 downto 0) := "100";
    constant F3_LHU       : std_logic_vector(2 downto 0) := "101";
    constant F3_SB        : std_logic_vector(2 downto 0) := "000";
    constant F3_SH        : std_logic_vector(2 downto 0) := "001";
    constant F3_SW        : std_logic_vector(2 downto 0) := "010";
    constant F3_ADDI      : std_logic_vector(2 downto 0) := "000";
    constant F3_SLTI      : std_logic_vector(2 downto 0) := "010";
    constant F3_SLTIU     : std_logic_vector(2 downto 0) := "011";
    constant F3_XORI      : std_logic_vector(2 downto 0) := "100";
    constant F3_ORI       : std_logic_vector(2 downto 0) := "110";
    constant F3_ANDI      : std_logic_vector(2 downto 0) := "111";
    constant F3_SLLI      : std_logic_vector(2 downto 0) := "001";
    constant F3_SRLI      : std_logic_vector(2 downto 0) := "101";
    constant F3_SRAI      : std_logic_vector(2 downto 0) := "101";
    constant F3_ADD       : std_logic_vector(2 downto 0) := "000";
    constant F3_SUB       : std_logic_vector(2 downto 0) := "000";
    constant F3_SLL       : std_logic_vector(2 downto 0) := "001";
    constant F3_SLT       : std_logic_vector(2 downto 0) := "010";
    constant F3_SLTU      : std_logic_vector(2 downto 0) := "011";
    constant F3_XOR       : std_logic_vector(2 downto 0) := "100";
    constant F3_SRL       : std_logic_vector(2 downto 0) := "101";
    constant F3_SRA       : std_logic_vector(2 downto 0) := "101";
    constant F3_OR        : std_logic_vector(2 downto 0) := "110";
    constant F3_AND       : std_logic_vector(2 downto 0) := "111";
    constant F3_FENCE     : std_logic_vector(2 downto 0) := "000";
	constant F3_PAUSE	  : std_logic_vector(2 downto 0) := "000";
	constant F3_ECALL     : std_logic_vector(2 downto 0) := "000";
    constant F3_EBREAK    : std_logic_vector(2 downto 0) := "000";
    
end funct3;

library IEEE;
use IEEE.std_logic_1164.ALL;

package funct7 is

    constant F7_SLLI      : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SRLI      : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SRAI      : std_logic_vector(6 downto 0) := "0100000";
    constant F7_ADD       : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SUB       : std_logic_vector(6 downto 0) := "0100000";
    constant F7_SLL       : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SLT       : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SLTU      : std_logic_vector(6 downto 0) := "0000000";
    constant F7_XOR       : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SRL       : std_logic_vector(6 downto 0) := "0000000";
    constant F7_SRA       : std_logic_vector(6 downto 0) := "0100000";
    constant F7_OR        : std_logic_vector(6 downto 0) := "0000000";
    constant F7_AND       : std_logic_vector(6 downto 0) := "0000000";

end funct7;

library IEEE;
use IEEE.std_logic_1164.ALL;

package opcodes is

    --U types
    constant OP_LUI       : std_logic_vector(6 downto 0) := "0110111"; -- LUI
    constant OP_AUIPC     : std_logic_vector(6 downto 0) := "0010111"; -- AUIPC

    --J types
    constant OP_JAL       : std_logic_vector(6 downto 0) := "1101111"; -- JAL

    --I types
    constant OP_JALR      : std_logic_vector(6 downto 0) := "1100111"; -- JALR
    constant OP_REG_IMM   : std_logic_vector(6 downto 0) := "0010011"; -- ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
    constant OP_LOAD      : std_logic_vector(6 downto 0) := "0000011"; -- LB, LBU, LH, LHU, LW
    constant OP_FENCE     : std_logic_vector(6 downto 0) := "0001111"; -- FENCE, PAUSE
    constant OP_SYSTEM    : std_logic_vector(6 downto 0) := "1110011"; -- ECALL, EBREAK

    --B types
    constant OP_BRANCH    : std_logic_vector(6 downto 0) := "1100011"; -- BEQ, BNE, BLT, BLTU, BGE, BGEU

    --S types
    constant OP_STORE     : std_logic_vector(6 downto 0) := "0100011"; -- SB, SH, SW

    --R types
    constant OP_REG_REG   : std_logic_vector(6 downto 0) := "0110011"; -- ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND

end opcodes;

library IEEE;
use IEEE.std_logic_1164.ALL;

package cpu_constants is

	constant ARCHITECTURE_WIDTH             : natural := 32;
	constant INSTRUCTION_MEM_SIZE           : natural := 2**8;
	constant DATA_MEM_SIZE                  : natural := 2**10;
    constant REG_FILE_SIZE                  : natural := 32;
    subtype COUNTER_RANGE                   is integer range 31 downto 0;
	subtype REGISTER_WORD_RANGE			    is integer range 31 downto 0;
    subtype ARCHITECTURE_RANGE              is integer range ARCHITECTURE_WIDTH - 1 downto 0;
    subtype ALU_OPCODE_RANGE                is integer range 3 downto 0;
    subtype CTRL_ALU_OP_RANGE               is integer range 1 downto 0;
end cpu_constants;