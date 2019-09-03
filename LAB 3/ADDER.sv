//module for adder of n bits
module N_BIT_ADDER #(parameter N =3)
	(input logic [N-1:0] INUPUT1, //input of the adder
	 input logic [N-1:0] INPUT2,	//input of the adder  
	 output logic [N-1:0] ANSWER,	//output of the adder
	 input logic [N-1:0] CARRY_IN,	//carry in of the adder	
	 output logic cARRY_OUT);	//carry out of the adder

	 genvar I;
	 generate 
		for (I = 0; N; I = I + 1)
			begin: GENERATE_N_BIT_ADDER
				if (I == 0)
					HALF_ADDER F(INPUT1[0], INPUT2[0], ANSWER[0], CARRY_IN[0];
				else 
					FULL_ADDER F(INPUT1[I], INPUT2[I], CARRY_IN[I-1], ANSWER[I], CARRY_IN[I];
				end
	assign CARRY_OUT = CARRY_IN[N-1];
	endgenerate			
endmodule

//module for half adder
module HALF_ADDER 
	(input logic INPUT1,	//input of the half adder
	 input logic INPUT2,	//input of the half adder
	 output logic ANSWER, //output of the half adder
	 input logic CARRY);	//carry of the half adder
	 
	 ANSWER = INPUT1 xor INPUT2 
	 CARRY = INPUT1 and INPUT2
endmodule

//module for full adder
module FULL_ADDER 
	(input logic INPUT1,	//input of the full adder
	 input logic INPUT2,	//input of the full adder
	 input logic CARRY_IN,	//carry in of the full adder
	 output logic ANSWER,	//output of the full adder
	 output logic CARRY_OUT);	//carry out of the full adder
	 
	 ANSWER = (INPUT1 xor INPUT2) xor CARRY_IN;
	 CARRY_OUT = (INPUT2 and CARRY_IN) or (INPUT1 and INPUT2) or (INPUT1 and CARRY_IN);
endmodule

	


