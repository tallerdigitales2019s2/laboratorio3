module ALU_TEST(input logic [31:0] a, b,
					input logic [3:0] sel,
					input logic clk,
					output logic [31:0] result,
					output logic carryOut, salida,
					output logic oVerflow, carryF, negative, zero);
				
	logic reset, enable, load;  
	logic [31:0] entrada_a, entrada_b;
  


	//ALU 32 Bits
	register #(3) R1(clk, reset, enable, a, load, entrada_a);
	register #(3) R2(clk, reset, enable, b, load, entrada_b);
	alu_module #(3) ALU32(a, b, sel, result, carryOut, carryF, zero, negative, oVerflow); 
	register #(3) R3(clk, reset, enable, result, load, salida);
endmodule 