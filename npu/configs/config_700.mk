export PLATFORM = asap7
export DESIGN_NICKNAME = tiny_npu_700
export DESIGN_NAME = top

export VERILOG_INCLUDE_DIRS = ./designs/src/tiny_npu/pkg

export VERILOG_FILES = \
  ./designs/src/tiny_npu/pkg/fixed_pkg.sv \
  ./designs/src/tiny_npu/pkg/isa_pkg.sv \
  ./designs/src/tiny_npu/pkg/kv_pkg.sv \
  ./designs/src/tiny_npu/pkg/npu_pkg.sv \
  ./designs/src/tiny_npu/bus/axi_types.sv \
  $(filter-out ./designs/src/tiny_npu/bus/axi_types.sv,$(sort $(wildcard ./designs/src/tiny_npu/bus/*.sv))) \
  $(sort $(wildcard ./designs/src/tiny_npu/ctrl/*.sv)) \
  $(sort $(wildcard ./designs/src/tiny_npu/gemm/*.sv)) \
  $(sort $(wildcard ./designs/src/tiny_npu/mem/*.sv)) \
  $(sort $(wildcard ./designs/src/tiny_npu/ops/*.sv)) \
  ./designs/src/tiny_npu/top.sv

export SDC_FILE = ./designs/asap7/tiny_npu/constraint_700.sdc

export SYNTH_HDL_FRONTEND = slang
export SLANG_PLUGIN_PATH = /OpenROAD-flow-scripts/tools/install/yosys/share/yosys/plugins/slang.so

export MAX_FANOUT = 8
export DIE_AREA = 0 0 1000 1000
export CORE_AREA = 10 10 990 990
export PLACE_DENSITY = 0.60
export TNS_END_PERCENT = 100
