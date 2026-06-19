export PLATFORM = asap7
export DESIGN_NICKNAME = rv12_500
export DESIGN_NAME = riscv_top_ahb3lite

export VERILOG_FILES = ./designs/src/rv12/rv12_converted.v
export SDC_FILE = ./designs/asap7/rv12/constraint_500.sdc

export MAX_FANOUT = 8
export DIE_AREA = 0 0 200 200
export CORE_AREA = 2 2 198 198
export PLACE_DENSITY = 0.60
export TNS_END_PERCENT = 100
export SYNTH_MEMORY_MAX_BITS = 1000000
