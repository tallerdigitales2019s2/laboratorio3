//Dout = EN'*A + EN*DIR'*Carry >    + EN*DIR*< Carry


module ShiftBit(en_i , dir_i, carry_left_i,data_i,carry_right_i,data_o,carry_o);

input logic carry_left_i;
input logic carry_right_i;
input logic dir_i;
input logic en_i;
input logic data_i;
output logic carry_o;
output logic data_o;



logic dirn, enn ,x1, x2 ,x3;

not(dirn, dir_i);
not(enn, en_i);

and(x1, enn, data_i);
and(x2, en_i, dirn, carry_left_i);
and(x3, en_i, dir_i, carry_right_i );

or(data_o, x1,x2,x3 );

assign carry_o = data_i;

endmodule
