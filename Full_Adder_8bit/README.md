# 8-bit Full Adder — Xilinx ISE (VHDL)

A structural, gate-level 8-bit ripple-carry adder built in VHDL by hierarchically composing 1-bit Full Adders, designed and simulated in Xilinx ISE.

## Design Hierarchy

The design is built bottom-up in three levels of structural VHDL:

```
Full_Adder_8bit
 ├── Full_Adder_4bit  (lower nibble, bits 3:0)
 │    ├── Full_Adder (bit 0)
 │    ├── Full_Adder (bit 1)
 │    ├── Full_Adder (bit 2)
 │    └── Full_Adder (bit 3)
 └── Full_Adder_4bit  (upper nibble, bits 7:4)
      ├── Full_Adder (bit 4)
      ├── Full_Adder (bit 5)
      ├── Full_Adder (bit 6)
      └── Full_Adder (bit 7)
```

Each 1-bit `Full_Adder` (`full_adder_gate.vhd`) is itself built at the gate level from `XOR_gate`, `AND_gate`, and `OR_gate` components:

- `SUM  = (A XOR B) XOR Cin`
- `COUT = (A AND B) OR (Cin AND (A XOR B))`

> This design instantiates `AND_gate`, `OR_gate`, and `XOR_gate` components. Add their source files to the ISE project (e.g. from the gate-level library used elsewhere in this repo) alongside the files below so the design elaborates cleanly.

## Repository Structure

| File | Description |
|---|---|
| `full_adder_gate.vhd` | 1-bit Full Adder — structural composition of XOR/AND/OR gates |
| `full_adder_gate_tb.vhd` | Testbench for the 1-bit Full Adder |
| `Full_Adder_4bit.vhd` | 4-bit Full Adder — ripple-carry chain of four 1-bit `Full_Adder` instances |
| `Full_Adder_4bit_tb.vhd` | Testbench for the 4-bit Full Adder |
| `Full_Adder_8bit.vhd` | 8-bit Full Adder — two `Full_Adder_4bit` blocks chained via the nibble carry |
| `Full_Adder_8bit_tb.vhd` | Testbench for the 8-bit Full Adder |

## Port Interface

**`Full_Adder_8bit`**

| Port | Direction | Type | Description |
|---|---|---|---|
| `A` | in | `std_logic_vector(7 downto 0)` | First 8-bit operand |
| `B` | in | `std_logic_vector(7 downto 0)` | Second 8-bit operand |
| `Cin` | in | `std_logic` | Carry-in |
| `Sum` | out | `std_logic_vector(7 downto 0)` | 8-bit sum |
| `Cout` | out | `std_logic` | Carry-out |

## How It Works

1. **`Full_Adder`** — the 1-bit cell — computes `Sum` and `Cout` from `A`, `B`, `Cin` using only `XOR_gate`, `AND_gate`, and `OR_gate` instances (no behavioral operators).
2. **`Full_Adder_4bit`** — chains four `Full_Adder` cells, wiring each stage's `Cout` into the next stage's `Cin`; the external `Cin` feeds bit 0, and bit 3's `Cout` becomes the nibble's carry-out.
3. **`Full_Adder_8bit`** — chains two `Full_Adder_4bit` blocks (`FA4_LOW` for bits 3:0, `FA4_HIGH` for bits 7:4), passing the low nibble's carry-out into the high nibble's `Cin`. This is a classic **ripple-carry adder**: correct but with propagation delay proportional to the carry chain length.

## Getting Started

### Simulating in Xilinx ISE

1. Create a new ISE project and add `full_adder_gate.vhd`, `Full_Adder_4bit.vhd`, and `Full_Adder_8bit.vhd`, along with the `AND_gate`/`OR_gate`/`XOR_gate` source files.
2. Add the matching testbenches (`full_adder_gate_tb.vhd`, `Full_Adder_4bit_tb.vhd`, `Full_Adder_8bit_tb.vhd`) as needed.
3. Set `Full_Adder_8bit_tb.vhd` as the top module for simulation to test the full 8-bit adder end-to-end (or use the 1-bit / 4-bit testbenches to verify each level independently).
4. Run **Behavioral Simulation** in ISim and check `Sum`/`Cout` against your test vectors, e.g. `A = "00001111"`, `B = "00000001"`, `Cin = '0'` → `Sum = "00010000"`, `Cout = '0'`.

## Author
GitHub: [@0Junaid0](https://github.com/0Junaid0)
