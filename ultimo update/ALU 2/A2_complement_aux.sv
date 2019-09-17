module A2_complement_aux(data_i,flag_i, data_o, flag_o);
	input data_i, flag_i;
	output data_o, flag_o;
	or(flag_o, data_i, flag_i);
	xor(data_o,data_i, flag_i);
endmodule 