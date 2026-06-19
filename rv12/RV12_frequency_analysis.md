# RV12 Frequency Sweep Synthesis Report

## Design Information

- Design: RV12 RISC-V CPU
- Top module: `riscv_top_ahb3lite`
- Clock port: `HCLK`
- Tool flow: OpenROAD-flow-scripts
- Platform: ASAP7
- Frequencies: 500 MHz, 600 MHz, 700 MHz

## Synthesis Metrics

| Frequency | Clock Period | Cell Count | Chip Area | Flip-Flop Count | Most Common Cell | TNS | WNS | Positive Setup Slack |
|---:|---:|---:|---:|---:|---|---:|---:|---:|
| 500 MHz | 2.000 ns | 79,853 | 9964.496880 µm² | 11,804 | DFFHQNx1_ASAP7_75t_R = 10,388 | 0.00 | 0.00 | +0.649 ns |
| 600 MHz | 1.667 ns | 79,853 | 9964.496880 µm² | 11,804 | DFFHQNx1_ASAP7_75t_R = 10,388 | 0.00 | 0.00 | +0.316 ns |
| 700 MHz | 1.429 ns | 79,853 | 9964.496880 µm² | 11,804 | DFFHQNx1_ASAP7_75t_R = 10,388 | 0.00 | 0.00 | +0.078 ns |

## Critical Path

The setup-critical path appeared in the RV12 multiplier unit.

- Startpoint: `core.ex_units.genblk1.mul.mul_bubble_o$_DFF_PN1_`
- Endpoint: `core.ex_units.genblk1.mul.mul_r_o[30]$_DFF_P_`
- Path group: `HCLK`

| Frequency | Required Time | Arrival Time | Slack |
|---:|---:|---:|---:|
| 500 MHz | 1984.83 ps | 1336.25 ps | +648.57 ps |
| 600 MHz | 1651.83 ps | 1336.25 ps | +315.57 ps |
| 700 MHz | 1413.83 ps | 1336.25 ps | +77.57 ps |

## Observation

RV12 met timing at 500 MHz, 600 MHz, and 700 MHz. The cell count and chip area remained unchanged across all three runs. However, the positive setup slack decreased as the target frequency increased. At 700 MHz, the timing margin was only +77.57 ps, which means the design still passed timing but was close to the limit.

## Issues Faced

1. The first RV12 synthesis failed because inferred memory size exceeded the default `SYNTH_MEMORY_MAX_BITS` value. The fix was to increase it to `1000000`.

2. The first floorplan used a very large die area, which caused huge tapcell insertion and filled disk space. The fix was to use a smaller die/core area: `DIE_AREA = 0 0 200 200` and `CORE_AREA = 2 2 198 198`.
