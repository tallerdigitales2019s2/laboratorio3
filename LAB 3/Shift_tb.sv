module Shift_tb();
parameter WIDTH=8;
logic [1:0] sel_i;
logic [WIDTH-1:0] A_i, shamt_i;
logic [WIDTH-1:0] data_o, shamt_o;



Shift #(.WIDTH(WIDTH)) DUT(.*);





initial begin
	
  #0 $display("Inicio de la simulacion para Shift de %d bits", WIDTH);
  
  
   $display("SRL");
  sel_i=2'b00;
  shamt_i=3;
  A_i= 9'b10001000;
  #2;

  shamt_i=5;
  #2;
  
  $display("SRA");
  sel_i=2'b01;
  shamt_i=3;
  A_i= 9'b10001000;

  #2;
  
  
  shamt_i=4;
  #2;
  
  shamt_i=5;
  #2;
  
  
  
  
  
  
    $display("SLL");

  
  sel_i=2'b10;
  shamt_i=3;
  A_i= 9'b10001000;
  #2;
  
  
  shamt_i=4;
  #2;
  
  shamt_i=5;
  #2;
  
  
  
  
 $display("SLL");

  
  
  sel_i=2'b11;
  shamt_i=3;
  A_i= 9'b10001000;
  #2;
  
  shamt_i=4;
  #2;
  
  shamt_i=5;
  #2;
  
  
  #1 $finish;
 end

endmodule
