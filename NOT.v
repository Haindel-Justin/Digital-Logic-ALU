module Gate_NOT(a,r);
parameter size=16;
input [size-1:0] a;
output [size-1:0] r;
assign r =  ~a;
endmodule
module testbench();

  reg [15:0] i;
  reg  s15;
  reg  s14;
  reg  s13;
  reg  s12;
  reg  s11;
  reg  s10;
  reg  s9;
  reg  s8;
  reg  s7;
  reg  s6;
  reg  s5;
  reg  s4;
  reg  s3;
  reg  s2;
  reg  s1;
  reg  s0;
  wire  outwire;
  wire  [15:0] f1;
  wire  outwire2;
  wire  [15:0] f2;

  wire  [15:0] ft;
  wire  outwire3;
  wire  [15:0] f3;

  wire  outwire4;
  wire  outwire5;
  wire  outwire6;
 	
  

   Gate_NOT nt(i,f1);


  //Initial means "start," like a Main() function.
  //Begin denotes the start of a block of code.	
 
  initial begin
   	i=248;
	#5;
	$display("|   i            | NOR");
	$display("|%b   %b",i,f1);

 
	#10; //A time dealy of 10 time units. Hashtag Delay
	$finish;//A command, not unlike System.exit(0) in Java.
  end  //End the code block of the main (initial)
  endmodule