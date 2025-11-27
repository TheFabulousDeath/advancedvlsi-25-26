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

package register_aliases is
	
	constant x0  : std_logic_vector(4 downto 0) := "00000";  -- x0 / zero
	constant x1  : std_logic_vector(4 downto 0) := "00001";  -- x1 / ra (return address)
	constant x2  : std_logic_vector(4 downto 0) := "00010";  -- x2 / sp (stack pointer)
	constant x3  : std_logic_vector(4 downto 0) := "00011";  -- x3 / gp (global pointer)
	constant x4  : std_logic_vector(4 downto 0) := "00100";  -- x4 / tp (thread pointer)
	constant x5  : std_logic_vector(4 downto 0) := "00101";  -- x5 / t0 (temporary)
	constant x6  : std_logic_vector(4 downto 0) := "00110";  -- x6 / t1 (temporary)
	constant x7  : std_logic_vector(4 downto 0) := "00111";  -- x7 / t2 (temporary)
	constant x8  : std_logic_vector(4 downto 0) := "01000";  -- x8 / s0 (saved)
	constant x9  : std_logic_vector(4 downto 0) := "01001";  -- x9 / s1 (saved)
	constant x10 : std_logic_vector(4 downto 0) := "01010";  -- x10 / a0 (argument)
	constant x11 : std_logic_vector(4 downto 0) := "01011";  -- x11 / a1 (argument)
	constant x12 : std_logic_vector(4 downto 0) := "01100";  -- x12 / a2 (argument)
	constant x13 : std_logic_vector(4 downto 0) := "01101";  -- x13 / a3 (argument)
	constant x14 : std_logic_vector(4 downto 0) := "01110";  -- x14 / a4 (argument)
	constant x15 : std_logic_vector(4 downto 0) := "01111";  -- x15 / a5 (argument)
	constant x16 : std_logic_vector(4 downto 0) := "10000";  -- x16 / a6 (argument)
	constant x17 : std_logic_vector(4 downto 0) := "10001";  -- x17 / a7 (argument)
	constant x18 : std_logic_vector(4 downto 0) := "10010";  -- x18 / s2 (saved)
	constant x19 : std_logic_vector(4 downto 0) := "10011";  -- x19 / s3 (saved)
	constant x20 : std_logic_vector(4 downto 0) := "10100";  -- x20 / s4 (saved)
	constant x21 : std_logic_vector(4 downto 0) := "10101";  -- x21 / s5 (saved)
	constant x22 : std_logic_vector(4 downto 0) := "10110";  -- x22 / s6 (saved)
	constant x23 : std_logic_vector(4 downto 0) := "10111";  -- x23 / s7 (saved)
	constant x24 : std_logic_vector(4 downto 0) := "11000";  -- x24 / s8 (saved)
	constant x25 : std_logic_vector(4 downto 0) := "11001";  -- x25 / s9 (saved)
	constant x26 : std_logic_vector(4 downto 0) := "11010";  -- x26 / s10 (saved)
	constant x27 : std_logic_vector(4 downto 0) := "11011";  -- x27 / s11 (saved)
	constant x28 : std_logic_vector(4 downto 0) := "11100";  -- x28 / t3 (temporary)
	constant x29 : std_logic_vector(4 downto 0) := "11101";  -- x29 / t4 (temporary)
	constant x30 : std_logic_vector(4 downto 0) := "11110";  -- x30 / t5 (temporary)
	constant x31 : std_logic_vector(4 downto 0) := "11111";  -- x31 / t6 (temporary)
	
end register_aliases;

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
