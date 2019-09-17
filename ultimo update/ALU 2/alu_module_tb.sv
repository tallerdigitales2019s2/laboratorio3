module alu_module_tb();
	parameter SIZE = 3;
	logic [SIZE-1:0] A;
	logic [SIZE-1:0] B;
	logic [3:0] Op_Code;
	logic [SIZE-1:0] Alu_Out;
   logic Carry_out;
	logic Carry_in;
	logic C_flag;
	logic Z_flag;
	logic N_flag;
	logic V_flag;
	
	alu_module #(SIZE) DUT (A,B, Op_Code, Alu_Out,Carry_in, C_flag, Z_flag, N_flag, V_flag);
	
	initial begin
		Op_Code =0;
		B = 2;
		A=4;
		#10;
		Op_Code = 1;
		B = 2;
		A=4;
		#10;
		Op_Code = 2;
		B = 3;
		A=4;
		#10;
		Op_Code = 3;
		B = 4;
		A=4;
		#10;
		Op_Code = 4;
		A =0;
		B = 1;
		#1;
		if(Alu_Out != A + B) begin
			$display("*ERROR IN 1ST ADDER TEST*");
		end
		#10
		A= 1;
		B=2;
		#1;
		if(Alu_Out != A + B) begin
			$display("*ERROR IN 2ND ADDER TEST*");
		end
		#10
		Op_Code = 5;
		A = 1; 
		B = 0;
		#1;
		if(Alu_Out != A - B) begin
			$display("*ERROR IN 1ST SUBS TEST*");
		end
		#10
		A = 3;
		B = 2;
		#1;
		if(Alu_Out != A - B) begin
			$display("*ERROR IN 2ND SUBS TEST*");
		end
		#10
		Op_Code = 6;
		A = 0;
		B = 1;
		#1;
		if(Alu_Out != A & B) begin
			$display("*ERROR IN 1ST AND TEST*");
		end
		#10
		A = 2;
		B= 3;
		#1;
		if(Alu_Out != A & B) begin
			$display("*ERROR IN 2ND AND TEST*");
		end
		#10
		Op_Code = 7;
		A = 0;
		B = 1;
		#1;
		if(Alu_Out != ~A) begin
			$display("*ERROR IN 1ST NOT TEST*");
		end
		#10
		A = 2;
		B = 3;
		#1;
		if(Alu_Out != ~A) begin
			$display("*ERROR IN 2ND NOT TEST*");
		end
		#10
		Op_Code = 8;
		A = 0;
		B = 1;
		#1;
		if(Alu_Out != (A | B)) begin
			$display("*ERROR IN 1ST OR TEST*");
		end
		#10
		A = 2; 
		B = 3;
		#1;
		if(Alu_Out != (A | B)) begin
			$display("*ERROR IN 2ND OR TEST*");
		end
		#10
		Op_Code = 9;
		A = 0;
		B = 1;
		#1;
		if(Alu_Out != (A ^ B)) begin
			$display("*ERROR IN 1ST XOR TEST*");
		end
		#10
		A = 2;
		B = 3;
		#1;
		if(Alu_Out != (A ^ B)) begin
			$display("*ERROR IN 2ND XOR TEST*");
		end
	
	end
	
endmodule 
