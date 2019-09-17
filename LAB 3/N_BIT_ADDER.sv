//module for adder of n bits
module N_BIT_ADDER #(parameter N = 3)
	(input logic [N-1:0] INPUT1, //input of the adder
	 input logic [N-1:0] INPUT2,	//input of the adder 
	 input  logic SEL,
	 output logic [N-1:0] ANSWER,	//output of the adder	
	 output logic CARRY_OUT);	//carry out of the adder
	 logic [N-1:0] INPUT2_A2,INPUT2_TEMP;
	 
	 A2_complement #( .WIDTH(N))  a2_c (.data_i(INPUT2), .data_o(INPUT2_A2));
	 assign  INPUT2_TEMP = (SEL) ? (INPUT2_A2) : (INPUT2);
	 
	 genvar I;
	 generate 
	 logic [N-1:0] CARRY_IN; //carry in of the adder
		for (I = 0; I < N; I = I + 1)
			begin: GENERATE_N_BIT_ADDER
				if (I == 0)
					HALF_ADDER half_adder1 (INPUT1[0], INPUT2_TEMP[0], ANSWER[0], CARRY_IN[0]);
				else 
					FULL_ADDER full_adder1 (INPUT1[I], INPUT2_TEMP[I], CARRY_IN[I-1], ANSWER[I], CARRY_IN[I]);
				end
	assign CARRY_OUT = CARRY_IN[N-1];
	endgenerate			
endmodule

//module for half adder
module HALF_ADDER 
	(input logic INPUT1,	//input of the half adder
	 input logic INPUT2,	//input of the half adder
	 output logic ANSWER, //output of the half adder
	 output logic CARRY);	//carry of the half adder
	 
	 xor xorAnswer (ANSWER, INPUT1, INPUT2);
	 and andAnswer (CARRY, INPUT1, INPUT2);
	 
	 //assign ANSWER1 = orAnswer;
	 //assign CARRY1 = andAnswer;
endmodule

//module for full adder
module FULL_ADDER 
	(input logic INPUT1,	//input of the full adder
	 input logic INPUT2,	//input of the full adder
	 input logic CARRY_IN,	//carry in of the full adder
	 output logic ANSWER,	//output of the full adder
	 output logic CARRY_OUT);	//carry out of the full adder
	 
	 logic temporal1;
	 xor xorAnswer1 (temporal1, INPUT1, INPUT2);
	 xor xorAnswer2(ANSWER, temporal1, CARRY_IN); 
	 
	 logic temporal2;
	 and and1 (temporal2, temporal1, CARRY_IN);
	 
	 logic temporal3;
	 and and2 (temporal3, INPUT1, INPUT2);
	 
	 
	 or or2(CARRY_OUT, temporal2, temporal3);
endmodule 