mult:
	iverilog ./tb_frac_mult.sv -o frac_mult.o
	vvp ./frac_mult.o

shift:
	iverilog ./tb_shift_expander.sv -o shift_expander.o
	vvp ./shift_expander.o

mult_gtk: mult
	gtkwave ./frac_mult.vcd

clean:
	rm *.o; rm *.vcd