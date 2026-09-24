# Full Adder using NAND Gates, XOR-Gate, OR-Gate, AND-Gates — Xilinx ISE

VHDL implementation of a 1-bit Full Adder built entirely from NAND gates, designed and simulated in Xilinx ISE. The project demonstrates the universal-gate property of NAND by structurally composing AND, OR, NOR, and XOR gates from NAND primitives, then combining them (via a Half Adder stage) into a complete Full Adder.

## Overview

- **Sum** and **Carry-out** logic for a Full Adder (A, B, Cin → Sum, Cout) is realized without using any behavioral `and`/`or`/`xor` operators — every gate is built structurally from `nand_gate`.
- Each module has a matching testbench (`*_tb.vhd`) for standalone functional verification.
- Designed and simulated using **Xilinx ISE** (ISim).

## Repository Structure

| File | Description |
|---|---|
| `nand_gate.vhd` | Base NAND gate — the only primitive gate used in the design |
| `nand_gate_tb.vhd` | Testbench for the NAND gate |
| `and_gate.vhd` | AND gate built from NAND gates |
| `and_gate_tb.vhd` | Testbench for the AND gate |
| `or_gate.vhd` | OR gate built from NAND gates |
| `or_gate_tb.vhd` | Testbench for the OR gate |
| `nor_gate.vhd` | NOR gate built from NAND gates |
| `nor_gate_tb.vhd` | Testbench for the NOR gate |
| `xor_gate.vhd` | XOR gate built from NAND gates |
| `xor_gate_tb.vhd` | Testbench for the XOR gate |
| `half_adder_gate.vhd` | Half Adder built from the gate modules above |
| `half_adder_gate_tb.vhd` | Testbench for the Half Adder |
| `full_adder_gate.vhd` | Top-level Full Adder module |
| `full_adder_gate_tb.vhd` | Testbench for the Full Adder |

## Full Adder Truth Table

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## Getting Started

### Prerequisites

- [Xilinx ISE Design Suite](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html) 

### Simulating in Xilinx ISE

1. Open ISE and create a new project (or add these files to an existing one).
2. Add all `.vhd` source files and their corresponding `*_tb.vhd` testbenches to the project.
3. Set `full_adder_gate_tb.vhd` as the top module for simulation (or any individual gate testbench to verify that gate alone).
4. Run **Behavioral Simulation** to open ISim and view the waveform.
5. Verify the Sum and Cout outputs against the truth table above.

## Design Notes

- Every gate is derived only from `nand_gate`, following the classic universal-gate identities:
  - **NOT(A)** = NAND(A, A)
  - **AND(A, B)** = NOT(NAND(A, B))
  - **OR(A, B)** = NAND(NOT(A), NOT(B))
  - **XOR(A, B)** = built from a small NAND network (see `xor_gate.vhd`)
- The Full Adder is composed by cascading two Half Adder stages with a final OR gate to combine the carries, all implemented structurally in VHDL.

## Author

**Junaid**
GitHub: [@0Junaid0](https://github.com/0Junaid0)

## License

No license specified yet — add one (e.g. MIT) if you want others to reuse this code.
