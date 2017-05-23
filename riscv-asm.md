# RISC-V Assembly Programmer's Manual

# Copyright and License Information

The RISC-V Assembly Programmer's Manual is

  &copy; 2017 Palmer Dabbelt <palmer@dabbelt.com>
  &copy; 2017 Michael Clark <michaeljclark@mac.com>

It is licensed under the Creative Commons Attribution 4.0 International License
(CC-BY 4.0). The full license text is available at
https://creativecommons.org/licenses/by/4.0/.

# Command-Line Arguments

I think it's probably better to beef up the binutils documentation rather than
duplicating it here.

# Registers

ISA and ABI register names for X, F, and CSRs.

# Addressing

Addressing formats like %pcrel_lo().  We can just link to the RISC-V PS ABI
document to describe what the relocations actually do.

# Instruction Set

Links to the various RISC-V ISA manuals that are supported.

## Instructions

Here we can just link to the RISC-V ISA manual.

## Instruction Aliases

ALIAS line from opcodes/riscv-opc.c

## Pseudo Ops

Both the RISC-V-specific and GNU .-prefixed options.

The following table lists assembler directives:

Directive    | Arguments                      | Description
:----------- | :-------------                 | :---------------
.align       | integer                        | align to power of 2 (alias for .p2align)
.file        | "filename"                     | emit filename FILE LOCAL symbol table
.globl       | symbol_name                    | emit symbol_name to symbol table (scope GLOBAL)
.local       | symbol_name                    | emit symbol_name to symbol table (scope LOCAL)
.comm        | symbol_name,size,align         | emit common object to .bss section
.common      | symbol_name,size,align         | emit common object to .bss section
.ident       | "string"                       | accepted for source compatibility
.section     | [{.text,.data,.rodata,.bss}]   | emit section (if not present, default .text) and make current
.size        | symbol, symbol                 | accepted for source compatibility
.text        |                                | emit .text section (if not present) and make current
.data        |                                | emit .data section (if not present) and make current
.rodata      |                                | emit .rodata section (if not present) and make current
.bss         |                                | emit .bss section (if not present) and make current
.string      | "string"                       | emit string
.asciz       | "string"                       | emit string (alias for .string)
.equ         | name, value                    | constant definition
.macro       | name arg1 [, argn]             | begin macro definition \argname to substitute
.endm        |                                | end macro definition
.type        | symbol, @function              | accepted for source compatibility
.option      | {rvc,norvc,pic,nopic,push,pop} | RISC-V options
.byte        |                                | 8-bit comma separated words
.2byte       | expression [, expression]*     | 16-bit comma separated words (unaligned)
.4byte       | expression [, expression]*     | 32-bit comma separated words (unaligned)
.8byte       | expression [, expression]*     | 64-bit comma separated words (unaligned)
.half        | expression [, expression]*     | 16-bit comma separated words (naturally aligned)
.word        | expression [, expression]*     | 32-bit comma separated words (naturally aligned)
.dword       | expression [, expression]*     | 64-bit comma separated words (naturally aligned)
.dtprelword  | expression [, expression]*     | 32-bit thread local word
.dtpreldword | expression [, expression]*     | 64-bit thread local word
.sleb128     | expression                     | signed little endian base 128, DWARF
.uleb128     | expression                     | unsigned little endian base 128, DWARF
.p2align     | p2,[pad_val=0],max             | align to power of 2
.balign      | b,[pad_val=0]                  | byte align
.zero        | integer                        | zero bytes

The following table lists assembler relocation expansions:

Assembler Notation       | Description                 | Instruction / Macro
:----------------------  | :---------------            | :-------------------
%hi(symbol)              | Absolute (HI20)             | lui
%lo(symbol)              | Absolute (LO12)             | load, store, add
%pcrel_hi(symbol)        | PC-relative (HI20)          | auipc
%pcrel_lo(label)         | PC-relative (LO12)          | load, store, add
%tprel_hi(symbol)        | TLS LE "Local Exec"         | auipc
%tprel_lo(label)         | TLS LE "Local Exec"         | load, store, add
%tprel_add(offset)       | TLS LE "Local Exec"         | add
