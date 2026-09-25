# VLSI-Xilinx

A collection of gate-level VLSI/digital logic designs in VHDL, built and simulated in **Xilinx ISE**. Every design here is implemented structurally from basic logic gates (primarily NAND) rather than with behavioral operators, to demonstrate gate-level circuit construction and the universal-gate property of NAND.

## Projects

| Project | Description |
|---|---|
| [`Full_Adder_1bit/`](./Full_Adder_1bit) | 1-bit Full Adder built entirely from NAND gates — includes structural AND, OR, NOR, XOR, and Half Adder modules, each derived from `nand_gate`, combined into a complete Full Adder. |
| [`Full_Adder_8bit/`](./Full_Adder_8bit) | 8-bit ripple-carry Full Adder, built hierarchically: eight 1-bit `Full_Adder` cells → two 4-bit `Full_Adder_4bit` blocks → one `Full_Adder_8bit`, with the carry rippling through each stage. |

Each project folder has its own README with the full module breakdown, port tables, and simulation instructions — see the links above for details.

## Common Design Philosophy

- **Gate-level / structural VHDL** — no behavioral `and`/`or`/`xor` operators; every function is composed from instantiated gate components.
- **NAND as the universal gate** — AND, OR, NOR, and XOR are all derived from NAND using standard identities (see `Full_Adder_1bit/README.md` for the identities used).
- **Testbench per module** — every design file (`*.vhd`) has a matching `*_tb.vhd` for standalone verification in ISim.

## Tools

- [Xilinx ISE Design Suite](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html) (ISE / ISim)

## Author
GitHub: [@0Junaid0](https://github.com/0Junaid0)
