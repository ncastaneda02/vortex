TESTS := $(wildcard *.hex)

VTESTS := $(wildcard *-v-*.hex)

TESTS := $(filter-out $(VTESTS) rv32si-p-scall.hex rv32si-p-sbreak.hex rv32mi-p-breakpoint.hex rv32ud-p-fclass.hex rv32ua-p-amomax_w.hex rv32ua-p-amoxor_w.hex rv32ud-p-ldst.hex rv32ua-p-amoor_w.hex rv32mi-p-ma_addr.hex rv32ud-p-fdiv.hex rv32ud-p-fcmp.hex rv32mi-p-mcsr.hex rv32ua-p-amoswap_w.hex rv32mi-p-ma_fetch.hex rv32mi-p-csr.hex rv32ua-p-amoadd_w.hex rv32si-p-dirty.hex rv32ud-p-fcvt.hex rv32ui-p-fence_i.hex rv32si-p-csr.hex rv32mi-p-shamt.hex rv32ua-p-amomin_w.hex rv32ua-p-lrsc.hex rv32ud-p-fmadd.hex rv32ud-p-fadd.hex rv32si-p-wfi.hex rv32ua-p-amomaxu_w.hex rv32si-p-ma_fetch.hex rv32ud-p-fmin.hex rv32mi-p-illegal.hex rv32uc-p-rvc.hex rv32mi-p-sbreak.hex rv32ua-p-amominu_w.hex rv32ua-p-amoand_w.hex, $(TESTS))

run:
	cd ../../../hw/simulate/obj_dir && ./VVortex -r $(foreach test,$(TESTS),../../../tests/riscv/isa/$(test))