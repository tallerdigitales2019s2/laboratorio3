module ShiftBit_en_tb();
	logic carry_left_i;
	logic carry_right_i;
	logic dir_i;
	logic en_i;
	logic data_i;
	
	logic carry_o;
	logic data_o;
	
	ShiftBit_en DUT(.*);
	
	
	
	initial begin
		en_i=0;
		dir_i=0;
		
		data_i=1;
		carry_left_i=0;
		carry_right_i=0;
		
		#1;
		
		en_i=0;
		dir_i=1;
		
		data_i=0;
		carry_left_i=1;
		carry_right_i=1;
		#1;
		
		en_i=1;
		dir_i=0;
		
		data_i=0;
		carry_left_i=1;
		carry_right_i=0;
		#1;
		
		en_i=1;
		dir_i=1;
		
		data_i=0;
		carry_left_i=0;
		carry_right_i=1;
		#1;
		
		
			
	end
 



endmodule