# tiny-NPU Frequency Sweep Synthesis Report

## Design Information

- Design: tiny-NPU
- Repository: https://github.com/Leonui/tiny-npu
- Top module: `top`
- Clock port: `clk`
- Reset port: `rst_n`
- Platform: ASAP7
- Tool flow: OpenROAD-flow-scripts
- Frequencies: 500 MHz, 600 MHz, 700 MHz

## Synthesis Metrics

| Frequency | Clock Period | Cell Count | Chip Area | Flip-Flop Count | Most Common Cell | TNS | WNS | Positive Worst Slack |
|---:|---:|---:|---:|---:|---|---:|---:|---:|
| 500 MHz | 2.000 ns | 3,482 | 537.345900 µm² | 714 | DFFASRHQNx1_ASAP7_75t_R = 714 | 0.00 | 0.00 | +1.471 ns |
| 600 MHz | 1.667 ns | 3,482 | 537.345900 µm² | 714 | DFFASRHQNx1_ASAP7_75t_R = 714 | 0.00 | 0.00 | +1.138 ns |
| 700 MHz | 1.429 ns | 3,482 | 537.345900 µm² | 714 | DFFASRHQNx1_ASAP7_75t_R = 714 | 0.00 | 0.00 | +0.900 ns |

## Observation

The tiny-NPU design met timing at all three target frequencies. Cell count and chip area remained unchanged across 500, 600, and 700 MHz. The positive worst slack decreased as frequency increased, but timing was still met at 700 MHz.

## Critical Path at 700 MHz

The 700 MHz floorplan timing report showed the worst clocked timing path from:

- Startpoint: `u_dma_rd.m_axi_araddr[1]`
- Endpoint: `u_dma_rd.m_axi_arlen[7]`
- Path group: `clk`
- Slack: +900.01 ps

This indicates that the critical path was in DMA/address-control logic rather than inside the MAC multiplier or activation function logic.

## NPU Design-Specific Answers

### Q1. Does sigmoid appear as a distinct block?

Sigmoid did not appear as a distinct block in the synthesized netlist. Activation-related logic mainly appeared through names such as `gelu`, `softmax`, and `layernorm`, especially busy/done/timer registers. Since synthesis flattened the design, individual activation module boundaries were not clearly preserved in the final gate-level netlist.

### Q2. At 700 MHz, where is the critical path?

At 700 MHz, the critical path appeared in the DMA read/address-control logic, not in the MAC multiplier or activation function. The path from `u_dma_rd.m_axi_araddr[1]` to `u_dma_rd.m_axi_arlen[7]` had +900.01 ps slack, so timing was met.

### Q3. What happens if MAC units are doubled?

Doubling MAC units would increase cell count and area approximately linearly because each MAC contains multiplier, adder, and register logic. However, maximum frequency would not automatically improve. If fanout, routing, or control complexity increases, WNS may become worse unless extra pipelining is added.

### Q4. NPU vs TPU comparison

A TPU is usually more regular because it is mainly a repeated systolic MAC array. An NPU includes MACs plus activation functions, normalization, softmax, DMA, register control, and sequencing logic. Therefore, NPU timing can be limited by control or data movement logic, while TPU timing is often dominated by the regular MAC datapath.
