//module for substractor of n bits
module N_BIT_SUBSTRACTOR #(parameter N = 3)
	(input logic [N-1:0] INPUT1, //input of the substractor
	 input logic [N-1:0] INPUT2,	//input of the subsractor  
	 output logic [N-1:0] ANSWER,	//output of the subsractor	
	 output logic BORROW_OUT);	//borrow out of the subsractor

	 genvar I;
	 generate 
	 logic [N-1:0] BORROW_IN; //borrow in of the subsractor
		for (I = 0; I < N; I = I + 1)
			begin: GENERATE_N_BIT_SUBSTRACTOR
				if (I == 0)
					HALF_SUBSTRACTOR (INPUT1[0], INPUT2[0], ANSWER[0], BORROW_IN[0]);
				else 
					FULL_SUBSTRACTOR (INPUT1[I], INPUT2[I], BORROW_IN[I-1], ANSWER[I], BORROW_IN[I]);
				end
	assign BORROW_OUT = BORROW_IN[N-1];
	endgenerate			
endmodule

//module for half subsractor
module HALF_SUBSTRACTOR
	(input logic INPUT1,	//input of the half subsractor
	 input logic INPUT2,	//input of the half subsractor
	 output logic ANSWER, //output of the half subsractor
	 output logic BORROW);	//borrow of the half subsractor
	 
	 xor xorAnswer (ANSWER, INPUT1, INPUT2);
	 
	 logic temporal;
	 not not1(temporal, INPUT1);
	 and andAnswer (BORROW, temporal, INPUT2);
	 
	 //assign ANSWER1 = orAnswer;
	 //assign BORROW1 = andAnswer;
endmodule

//module for full subsractor
module FULL_SUBSTRACTOR
	(input logic INPUT1,	//input of the full subsractor
	 input logic INPUT2,	//input of the full subsractor
	 input logic BORROW_IN,	//borrow in of the full subsractor
	 output logic ANSWER,	//output of the full subsractor
	 output logic BORROW_OUT);	//borrow out of the full subsractor
	 
	 logic temporal1;
	 xor xorAnswer1 (temporal1, INPUT1, INPUT2);
	 xor xorAnswer2(ANSWER, temporal1, BORROW_IN); 
	 
	 logic temporalnot2;
	 not not2 (temporalnot2, temporal1);
	 
	 logic temporal2;
	 and and1 (temporal2, temporalnot2, BORROW_IN);
	 
	 logic temporalnot1;
	 not not1(temporalnot1, INPUT1);
	 
	 logic temporal3;
	 and and2 (temporal3, temporalnot1, INPUT2);
	 
	 
	 or or2(BORROW_OUT, temporal2, temporal3);
endmodule
