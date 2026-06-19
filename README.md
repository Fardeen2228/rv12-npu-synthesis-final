# RV12 and tiny-NPU Frequency Sweep Synthesis

This repository contains Week 4 frequency-sweep synthesis work for two assigned designs:

- RV12 RISC-V CPU
- tiny-NPU Neural Processing Unit

The target Week 4 flow is ASAP7 at 500 MHz, 600 MHz, and 700 MHz. The tiny-NPU part has been completed using OpenROAD-flow-scripts with the ASAP7 platform.

## Completed Work

### tiny-NPU

- Source repository: https://github.com/Leonui/tiny-npu
- Top module: `top`
- Clock port: `clk`
- Reset port: `rst_n`
- Tool flow: OpenROAD-flow-scripts
- Platform: ASAP7
- Frequencies: 500 MHz, 600 MHz, 700 MHz

NPU results are available in:

- `npu/NPU_frequency_analysis.md`
- `npu/configs/`
- `npu/constraints/`
- `npu/reports/`
- `npu/logs/`
- `npu/results/netlist/`
- `npu/final_report/`

## Metrics Extracted

For each synthesis run, the following metrics are recorded:

- Cell count
- Chip area
- Flip-flop count
- WNS
- TNS
- Most common cell type
- Critical path information

## Author

Fardeen Mosharraf Pranta
