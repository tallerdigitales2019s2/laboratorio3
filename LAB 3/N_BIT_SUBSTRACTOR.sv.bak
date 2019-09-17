//module for n bits substractor
module N_BIT_SUBSTRACTOR #(parameter N =3)
	(input logic [N-1:0] INUPUT1, //input of the adder
	 input logic [N-1:0] INPUT2,	//input of the adder  
	 output logic [N-1:0] ANSWER,	//output of the adder
	 input logic [N-1:0] BORROW_IN,	//carry in of the adder	
	 output logic BORROW_OUT);	//carry out of the adder

	 genvar I;
	 generate 
		for (I = 0; N; I = I + 1)
			begin: GENERATE_N_BIT_SUBSTRACTOR
				if (I == 0)
					HALF_SUBSTRACTOR F(INPUT1[0], INPUT2[0], ANSWER[0], BORROW_IN[0];
				else 
					FULL_SUBSTRACTOR F(INPUT1[I], INPUT2[I], BORROW_IN[I-1], ANSWER[I], BORROW_IN[I];
				end
	assign BORROW_OUT = BORROW_IN[N-1];
	endgenerate			
endmodule

//module for half adder
module HALF_SUBSTRACTOR
	(input logic INPUT1,	//input of the half adder
	 input logic INPUT2,	//input of the half adder
	 output logic ANSWER, //output of the half adder
	 input logic BORROW);	//carry of the half adder
	 
	 ANSWER = (not(INPUT1) and INPUT2) or (INPUT1 or not(INPUT2))
	 BORROW = not(INPUT1) and INPUT2
endmodule

//module for full adder
module FULL_SUBSTRACTOR
	(input logic INPUT1,	//input of the full adder
	 input logic INPUT2,	//input of the full adder
	 input logic BORROW_IN,	//carry in of the full adder
	 output logic ANSWER,	//output of the full adder
	 output logic BORROW_OUT);	//carry out of the full adder
	 
	 ANSWER = (INPUT1 xor INPUT2) xor BORROW_IN;
	 BORROW_OUT = (not(INPUT1) and BORROW_IN) or (INPUT2 and BORROW_IN) or (INPUT1 and INPUT2);
endmodule

	


