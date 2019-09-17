transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/Shifter.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/ShiftBit.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/Shift.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/alu_module_tb.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/N_BIT_ADDER.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/alu_module.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/A2_complement.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/A2_complement_aux.sv}

