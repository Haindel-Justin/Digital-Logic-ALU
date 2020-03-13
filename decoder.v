module main;

    reg [3:0] a;
    decoder dec(a,b);
    
  initial 
    begin
    
    assign a=4'b0000;
      $display("Dec Input:\t%4b\nDec Output:\t%16b", dec.a, dec.b);
      $finish ;
    end
endmodule

//4->16 decoder
module decoder(a, b);
  parameter n = 4;
  parameter m = 16;
  
  input [n-1:0] a;
  output [m-1:0] b;
  wire [m-1: 0] b = 1 << a;
  
endmodule