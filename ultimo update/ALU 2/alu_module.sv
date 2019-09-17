module alu_module #(parameter N = 3)
	(input logic [N-1:0] A, //
	input logic [N-1:0] B,
	input logic [3:0] Op_Code,//Codigo de operacion para el mux
	output logic [N-1:0] Alu_Out, // salida de la alu
	input logic [N-1:0] Carry_in, // 
	output logic C_flag, // bandera de acarreo
	output logic Z_flag, // bandera de cero
	output logic N_flag, // bandera de negativo
	output logic V_flag // bandera de overflow
	);
	/*
		Bloque de variables de salida para cada una de las operaciones
	*/
	logic adder_flag; //Bandera que determina si el módulo adder suma o resta.
	logic [1:0]shifter_flag; // Bandera que selecciona que tipo de shift se usará
	logic [N-1:0]adder_out; // salida del sumador
	//logic [N-1:0]substractor_out; //salida del restador
	logic [N-1:0]xor_out; //salida del xor
	logic [N-1:0]nor_out; // salida del nor
	logic [N-1:0]shifter_out; // salida del shift right logico

	always @ (*)begin
		case(Op_Code)
			4'b0000:
				begin
					shifter_flag = 2'b00; //sll
					Alu_Out=shifter_out;
				end
			4'b0001:
				begin
					shifter_flag = 2'b01; //sla
					Alu_Out=shifter_out;
				end
			4'b0010:
				begin
					shifter_flag = 2'b10; //srl
					Alu_Out=shifter_out;
				end
			4'b0011:
				begin
					shifter_flag = 2'b11; //sra
					Alu_Out=shifter_out;
				end
			4'b0100:
				begin
					adder_flag = 1'b0; //suma
					Alu_Out=adder_out;
				end
			4'b0101:
				begin
					adder_flag = 1'b1; //resta
					Alu_Out=adder_out;
				end
			4'b0110:
				begin
					Alu_Out = A & B;
				end
			4'b0111:
				begin
					Alu_Out = ~A;				
				end
			4'b1000:
				begin
					Alu_Out = A | B;
				end
			4'b1001:
				begin
					Alu_Out = A ^ B;
				end
		endcase
	end


	/*
		Instancias de los módulos necesarios para hacer la suma, resta y los distintos tipos de shift
	*/

	Shifter #(N) sll (.sel_i(shifter_flag), .A_i(A), .shamt_i(B), .data_o(shifter_out));	
	N_BIT_ADDER #(N) adder (.INPUT1(A),.INPUT2(B),.SEL(adder_flag),.ANSWER(adder_out),.CARRY_OUT(C_flag));
endmodule 
