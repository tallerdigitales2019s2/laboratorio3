module Shifter_tb#(parameter WIDTH=8)();
logic [1:0] sel_i;
logic [WIDTH-1:0] A_i, shamt_i;
logic [WIDTH-1:0] data_o;

Shifter  #(.WIDTH(WIDTH)) DUT(.*);

initial begin
sel_i = 2'b10;
shamt_i = 2;
A_i=4;
#3;
sel_i = 2'b10;
shamt_i = 2;
A_i=4;
#3;
sel_i = 2'b10;
shamt_i = 3;
A_i=4;
#3;
sel_i = 2'b10;
shamt_i = 4;
A_i=4;
#3;

end


endmodule