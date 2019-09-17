module Display_Results(input logic [3:0] a, b,
					input logic [3:0] sel,
					input logic clk,
					output logic [3:0] result,
					output logic carryOut, salida,
					output logic oVerflow, carryF, negative, zero);
					
		logic [3:0] sumResult;
		
		alu_module #(64) ALU32(a, b, sel, result, carryOut, oVerflow, carryF, negative, zero); 
		seven_segments testSegments(result, segments);
endmodule 