transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/mix_column.v}
vlog -vlog01compat -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/inv_mix_column.v}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/wrapper.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/SubBytes.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/SBox.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/InvSubBytes.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/InvSBox.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/AddRoundKey.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/decr_192.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/decr_128.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/InvShiftRows.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/KeyExpansion_128.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/KeyExpansion_192.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/KeyExpansion_256.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/decr_256.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/encrypt_128.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/ShiftRows.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/encrypt_192.sv}
vlog -sv -work work +incdir+D:/CMP1-\ Materials/First\ Year/Second\ Term/Logic\ Design/Project/New\ folder {D:/CMP1- Materials/First Year/Second Term/Logic Design/Project/New folder/encrypt_256.sv}

