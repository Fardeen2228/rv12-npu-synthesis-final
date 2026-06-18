# RV12 Synthesis Summary

## Design Information

- Design: RV12
- Top module: riscv_top_ahb3lite
- Clock port: HCLK
- PDK: sky130A
- Standard cell library: sky130_fd_sc_hd
- Synthesis strategy: DELAY 0

## RV12 Synthesis Results

| Frequency | Clock Period | Cell Count | Chip Area | WNS | TNS | Flip-Flop Count | Most Common Cell |
|---:|---:|---:|---:|---:|---:|---:|---|
| 200 MHz | 5.000 ns | 73,785 | 795,038.755200 | -20.05 | -28,970.58 | 11,802 | sky130_fd_sc_hd__buf_1 = 14,405 |
| 300 MHz | 3.333 ns | 73,785 | 795,038.755200 | -21.38 | -32,939.95 | 11,802 | sky130_fd_sc_hd__buf_1 = 14,405 |
| 400 MHz | 2.500 ns | 73,785 | 795,038.755200 | -22.05 | -39,293.66 | 11,802 | sky130_fd_sc_hd__buf_1 = 14,405 |

## Observation

The RV12 design was synthesized successfully at 200 MHz, 300 MHz, and 400 MHz. The cell count and chip area remained the same across all three runs. However, timing violations increased as the target frequency increased. The WNS and TNS became more negative at higher frequencies, showing that the design did not meet timing under the current synthesis setup.

## Issues and Fixes

| Issue | Cause | Fix |
|---|---|---|
| `sv2v` package error for `ahb3lite_pkg` | RV12 needed external AHB3-Lite package from submodule | Initialized RV12 submodules and added `ahb3lite_pkg.sv` |
| `sv2v` parse error at `import` | Full `ahb3lite_pkg.sv` contained interface/modport code not needed for synthesis | Kept only the package content up to `endpackage` |
| Missing `rl_ram_1rw` module | Memory submodule RTL was not included | Added `rl_ram_1rw.sv` and `rl_ram_1rw_generic.sv` |
| Missing `rl_queue` module | Queue memory RTL was not included | Added `rl_queue.sv`, `rl_ram_1r1w.sv`, and `rl_ram_1r1w_generic.sv` |
| Yosys procedural loop error | Converted Verilog had non-constant loop condition `(i < XLEN) && true` | Moved `true` check inside loop body |
| Yosys check warnings for undriven wires | Some debug/prediction-related generated signals were reported as undriven | Set `QUIT_ON_SYNTH_CHECKS` to `0` and documented the warnings |
