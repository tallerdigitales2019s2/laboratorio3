transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/Shifter.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/ShiftBit.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/Shift.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/N_BIT_ADDER.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/alu_module.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/A2_complement.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio3/LAB\ 3 {/home/gsegura/Documents/taller/laboratorio3/LAB 3/A2_complement_aux.sv}

