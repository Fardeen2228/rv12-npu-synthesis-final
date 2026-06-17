# RV12 and NPU OpenLane Synthesis

This repository contains OpenLane synthesis work for RV12 and NPU at 200 MHz, 300 MHz, and 400 MHz.

## Tool and PDK
- Tool: OpenLane
- PDK: sky130A
- Standard Cell Library: sky130_fd_sc_hd

## Clock Periods
| Frequency | Clock Period |
|---|---:|
| 200 MHz | 5.000 ns |
| 300 MHz | 3.333 ns |
| 400 MHz | 2.500 ns |

## Metrics
For each synthesis run, the following metrics are extracted:
- Cell count
- Chip area
- Flip-flop count
- WNS
- TNS
- Most common cell type

## Author
Fardeen
