# RV12 and tiny-NPU Frequency Sweep Synthesis

This repository contains Week 4 frequency-sweep synthesis work for two designs:

* RV12 RISC-V CPU
* tiny-NPU Neural Processing Unit

Both designs were synthesized using OpenROAD-flow-scripts with the ASAP7 platform at 500 MHz, 600 MHz, and 700 MHz.

## Tool and Platform

* Tool flow: OpenROAD-flow-scripts
* Docker image: openroad/orfs
* Platform: ASAP7
* Standard cell library: asap7sc7p5t
* Synthesis engine: Yosys + ABC
* Timing analysis: OpenROAD / OpenSTA

## Frequencies

| Frequency | Clock Period |
| --------: | -----------: |
|   500 MHz |     2.000 ns |
|   600 MHz |     1.667 ns |
|   700 MHz |     1.429 ns |

## Repository Structure

* rv12/

  * RV12_frequency_analysis.md
  * configs/
  * constraints/
  * logs/
  * reports/
  * results/netlist/

* npu/

  * NPU_frequency_analysis.md
  * configs/
  * constraints/
  * final_report/
  * logs/
  * reports/
  * results/netlist/

## Metrics Extracted

For each synthesis run, the following metrics were extracted:

* Cell count
* Chip area
* Flip-flop count
* WNS
* TNS
* Most common cell type
* Critical path information

## Author

Fardeen Mosharraf Pranta
