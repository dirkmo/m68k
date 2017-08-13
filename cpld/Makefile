all:
	iverilog -Wall -o m68k m68k.v bench.v

sim: all
	./m68k
	gtkwave dump.vcd config.gtkw &
