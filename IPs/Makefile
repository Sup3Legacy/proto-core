mult:
	iverilog ./tb_frac_mult.sv -o frac_mult
	vvp ./frac_mult

shift:
	iverilog ./tb_shift_expander.sv -o shift_expander
	vvp ./shift_expander

mult_gtk: mult
	gtkwave ./frac_mult.vcd