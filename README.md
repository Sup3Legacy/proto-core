# proto-core

Attempt at building entirely from scrath a RISC-V SoC for self-education purposes.

The targeted RISC-V flavor is RV32IMA (maybe extensible to RV32G).

(vague) TODO-list:

- Core:
    - [X] (fast) adder : carry look-ahead
    - [ ] ALU
    - [X] Multiplication
    - [ ] Division
    - [ ] MD unit
    - [ ] Logic 
    - [ ] 5 staged-pipeline
    - [ ] Memory bus
    - [ ] CSR
    - [ ] Instruction cache
    - [ ] MMU
- Modules:
    - [X] TRNG
    - [ ] PUF
    - [ ] GPIO
    - [ ] VGA
    - [ ] JTAG
    - [ ] USB??
- Toolsuite:
    - [ ] Compiler (and assembler)
    - [ ] Bootloader
    - [ ] Mini microkernel
- Misc:
    - [ ] Automated synthesis and software stack compilation
- Port:
    - [ ] FPGA
    - [ ] ASIC??
    - [ ] ...
    - [ ] Quantum computer???!!