module Shifter #(parameter WIDTH=8)(sel_i,  A_i,  shamt_i, data_o);
input logic [1:0] sel_i;
input logic [WIDTH-1:0] A_i, shamt_i;
output logic [WIDTH-1:0] data_o;

logic [WIDTH-1:0][WIDTH-1:0] temp_o, temp_shamt;


genvar i;
generate
	for (i=1; i<WIDTH-1; i=i+1) begin : generate_shift_registers // this is just the block name
		Shift_en #(.WIDTH(WIDTH)) sb (.sel_i(sel_i),  .A_i(temp_o[i-1]),  .shamt_i(temp_shamt[i-1]), .data_o(temp_o[i]), .shamt_o(temp_shamt[i]));
	end 
endgenerate
Shift_en #(.WIDTH(WIDTH)) sb_0 (.sel_i(sel_i), .A_i(A_i), .shamt_i(shamt_i), .data_o(temp_o[0]), .shamt_o(temp_shamt[0]));
Shift_en #(.WIDTH(WIDTH)) sb_N (.sel_i(sel_i), .A_i(temp_o[WIDTH-2]), .shamt_i(temp_shamt[WIDTH-2]), .data_o(data_o));
endmodule