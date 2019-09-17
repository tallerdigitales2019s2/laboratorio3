module register#( parameter N = 3 )
	(input CLK,
	input ENABLE,
	input RESET,
	input [N-1:0] INPUT,
	input LOAD,
	output OUTPUT );
	
	logic [N-1:0] D;
	logic [N-1:0] Q;

	always @(posedge CLK)
		if (RESET) begin
			Q = 0;
		end
		else if (ENABLE) begin
			Q <= D;
		end
		
	assign D = LOAD ? OUTPUT : {1'b0,Q[N-1:1]};
	assign OUTPUT = Q[0];



endmodule 
