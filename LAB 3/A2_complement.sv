module A2_complement#(parameter WIDTH=8)(data_i, data_o, carry_o);
	input [WIDTH-1:0] data_i;
	output [WIDTH-1:0] data_o;
	output carry_o;

	logic [WIDTH-1:0] flags;
	logic ZERO=0;
	genvar i;
	generate
		for (i=1; i<=WIDTH-1; i=i+1) begin : generate_A2_auxs // this is just the block name
			A2_complement_aux a2_aux1(.data_i(data_i[i]),.flag_i(flags[i-1]), .data_o(data_o[i]), .flag_o(flags[i]));
		end 
		
	endgenerate
	A2_complement_aux a2_aux2 (.data_i(data_i[0]),.flag_i(ZERO), .data_o(data_o[0]), .flag_o(flags[0]));

endmodule 