//icarus verilog from: http://iverilog.icarus.com/
//Sawyer Hill

//================================
module Gate_XOR(a,b,r);
parameter size=16;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] r;
//--------------------
assign r=a^b;
//--------------------
endmodule







module testbench();

  //Registers act like local variables
  reg [15:0] i; //A loop control that can go to 16 to handle a less than.
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
  reg [15:0] j; 
  reg  w15;
  reg  w14;
  reg  w13;
  reg  w12;
  reg  w11;
  reg  w10;
  reg  w9;
  reg  w8;
  reg  w7;
  reg  w6;
  reg  w5;
  reg  w4;
  reg  w3;
  reg  w2;
  reg  w1;
  reg  w0;
 
  
  //A wire can hold the return of a function
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
 	
  

   Gate_XOR xr(i,j,f1);


  //Initial means "start," like a Main() function.
  //Begin denotes the start of a block of code.	
 
  initial begin
   	i=248;
	j=327;
	#5;
	$display("|   i     |     j    | XOR");
	$display("|%b|%b |   %b",i,j,f1);
/*
	
  //$display acts like a classic C printf command.

  $display ("|  |s|s|s|    |    |    |    |    |    |    |    ||    |LA  |E   |"); 
  $display ("| #|2|1|0|Ch 7|Ch 6|Ch 5|Ch 4|Ch 3|Ch 2|Ch 1|Ch 0||b   | out| out|");
  $display ("|==+=+=+=+====+====+====+====+====+====+====+====++====+====+====+");
  
    //A for loop, with register i being the loop control variable.
	for (i = 4; i < 65535; i = i + 1) 
	 //always@(*)
	 begin//Open the code blook of the for loop
		s15=(i/32768)%2;
		s14=(i/16384)%2;
		s13=(i/8192)%2;
		s12=(i/4096)%2;
		s11=(i/2048)%2;
		s10=(i/1024)%2;
		s9=(i/512)%2;
		s8=(i/256)%2;
		s7=(i/128)%2;
		s6=(i/64)%2;
		s5=(i/32)%2;
		s4=(i/16)%2;
		s3=(i/8)%2;
		s2=(i/4)%2;
		s1=(i/2)%2;
		s0=(i/1)%2;	
		
		
		
		for (j = 12; j < 65535; j = j + 1)  
	 		begin
		w15=(j/32768)%2;
		w14=(j/16384)%2;
		w13=(j/8192)%2;
		w12=(j/4096)%2;
		w11=(j/2048)%2;
		w10=(j/1024)%2;
		w9=(j/512)%2;
		w8=(j/256)%2;
		w7=(j/128)%2;
		w6=(j/64)%2;
		w5=(j/32)%2;
		w4=(j/16)%2;
		w3=(j/8)%2;
		w2=(j/4)%2;
		w1=(j/2)%2;
		w0=(j/1)%2;

		#5;
		


		
		$display ("|%5d|%16b||||||||%5d|%16b||||||||||||%5d|%16b",i,i,j,j,f1,f1);
		if(j%4==3) //Every fourth row of the table, put in a marker for easier reading.
		 $display ("|==+=+=+=+====+====+====+====+====+====+====+====++====+====+====+");
  		
		end
  
	end//End of the for loop code block*/
 
	#10; //A time dealy of 10 time units. Hashtag Delay
	$finish;//A command, not unlike System.exit(0) in Java.
  end  //End the code block of the main (initial)
  endmodule
