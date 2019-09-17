// SEL:
// 00 sll
// 01 sla
// 10 srl
// 11 sra
module Shift #(parameter WIDTH=8) (sel_i,  A_i,  shamt_i, data_o, shamt_o);
input logic [1:0] sel_i;
input logic [WIDTH-1:0] A_i, shamt_i;
output logic [WIDTH-1:0] data_o, shamt_o;

logic [WIDTH-1:0]  carry_o;
logic ZERO=0;


logic carrt_in_l_n;
and(carrt_in_l_n, sel_i[0], A_i[WIDTH-1] );



logic en;
assign en = (|shamt_i);

assign shamt_o = (en) ? shamt_i-1 : ZERO;



genvar i;
generate
	for (i=1; i<WIDTH-1; i=i+1) begin : generate_shift_registers // this is just the block name
		ShiftBit sb (.en_i(en) , .dir_i(sel_i[1]), .carry_left_i(carry_o[i+1]),.data_i(A_i[i]),.carry_right_i(carry_o[i-1]),
		.data_o(data_o[i]),.carry_o(carry_o[i]));
	end 
endgenerate

ShiftBit sb_0 (.en_i(en) , .dir_i(sel_i[1]), .carry_left_i(carry_o[1]),.data_i(A_i[0]),.carry_right_i(ZERO),
		.data_o(data_o[0]),.carry_o(carry_o[0]));
		
		
ShiftBit sb_N (.en_i(en) , .dir_i(sel_i[1]), .carry_left_i(carrt_in_l_n),.data_i(A_i[WIDTH-1]),.carry_right_i(carry_o[WIDTH-2]),
		.data_o(data_o[WIDTH-1]),.carry_o(carry_o[WIDTH-1]));


endmodule
