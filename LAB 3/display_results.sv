module display_results(input logic [3:0] a,
					input logic [3:0] b,
					input logic [3:0] sel,
					output logic [3:0] result,
					output logic [6:0] segments,
					output logic carryOut,
					output logic overflow, 
					output logic carryF,
					output logic negative,
					output logic zero);
		
		
		alu_module #(3) ALU3 (.A(a), .B(b), .Op_Code(sel), .Alu_Out(result), .C_flag(carryOut), .V_flag(overflow), .N_flag(negative), .Z_flag(zero)); 
		seven_segments testSegments(result, segments);
endmodule 