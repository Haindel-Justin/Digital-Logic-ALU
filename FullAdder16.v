//iverilog
//Sawyer Hill

//================================
// Proper Half Adder   ####taken from fun.v
//================================  
module HalfAdder1Bit(a,b,c,s) ;
  input a,b ;
  output c,s ;  // carry and sum
  assign s = a ^ b ;
  assign c = a & b ;
endmodule

//----------------------------------------------------------------------
// full adder - from half adders  ####taken from fun.v
module FullAdder1Bit(a,b,cin,cout,s) ;
  input a,b,cin ;
  output cout,s ;  // carry and sum
  wire g,p ;	   // generate and propagate
  wire cp ;
  HalfAdder1Bit ha1(a,b,g,p) ;
  HalfAdder1Bit ha2(cin,p,cp,s) ;
  assign cout = g | cp;
endmodule


//================================
// FULL ADDER (4 BIT)	####taken from fun.v
//================================
module FullAdder4Bit(a,b,cin,s,cout);
parameter size=4;
input [size-1:0] a;
input [size-1:0] b;
input cin;

output [size-1:0] s;
output cout;

wire  sum[size-1:0];
wire  car[size-1:0];

FullAdder1Bit fa0(a[0],b[0],cin,car[0],sum[0]);
FullAdder1Bit fa1(a[1],b[1],car[0],car[1],sum[1]);
FullAdder1Bit fa2(a[2],b[2],car[1],car[2],sum[2]);
FullAdder1Bit fa3(a[3],b[3],car[2],car[3],sum[3]);

assign cout=car[3];
assign s[0]=sum[0];
assign s[1]=sum[1];
assign s[2]=sum[2];
assign s[3]=sum[3];


endmodule


//================================
// FULL ADDER (16 BIT)	####taken and modified from fun.v
//================================
module FullAdder16Bit(a,b,cin,s,cout);
parameter size= 16;
input [size-1:0] a;
input [size-1:0] b;
input cin;

output [size-1:0] s;
output cout;

wire  sum[size-1:0];
wire  car[size-1:0];

FullAdder4Bit f4a0(a[3:0],b[3:0],cin,s[3:0],car[0]);
FullAdder4Bit f4a1(a[7:4],b[7:4],car[0],s[7:4],car[1]);
FullAdder4Bit f4a2(a[11:8],b[11:8],car[1],s[11:8],car[2]);
FullAdder4Bit f4a3(a[15:12],b[15:12],car[2],s[15:12],car[3]);


assign cout=car[3];
assign s[0]=sum[0];
assign s[1]=sum[1];
assign s[2]=sum[2];
assign s[3]=sum[3];
assign s[4]=sum[4];
assign s[5]=sum[5];
assign s[6]=sum[6];
assign s[7]=sum[7];
assign s[8]=sum[8];
assign s[9]=sum[9];
assign s[10]=sum[10];
assign s[11]=sum[11];
assign s[12]=sum[12];
assign s[13]=sum[13];
assign s[14]=sum[14];
assign s[15]=sum[15];


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
 
  

   FullAdder16Bit fa(i,j,1'b0,f1,outwire);

  //Initial means "start," like a Main() function.
  //Begin denotes the start of a block of code.	
 
  initial begin
   	
  i = 12;
  j = 24;
  #4;
  $display("||A    ||B    ||Cin||A+B||Cout");
  $display("||%b||%b||%b||%b||%b",i,j,1'b0,f1,outwire);

  i = 17557;
  j = 2652;
  #4;
  $display("||A    ||B    ||Cin||A+B||Cout");
  $display("||%b||%b||%b||%b||%b",i,j,1'b0,f1,outwire);

  i = 7866;
  j = 22;
  #4;
  $display("||A    ||B    ||Cin||A+B||Cout");
  $display("||%b||%b||%b||%b||%b",i,j,1'b0,f1,outwire);

/*	 
	
  //$display acts like a classic C printf command.

  $display ("|  |s|s|s|    |    |    |    |    |    |    |    ||    |LA  |E   |"); 
  $display ("| #|2|1|0|Ch 7|Ch 6|Ch 5|Ch 4|Ch 3|Ch 2|Ch 1|Ch 0||b   | out| out|");
  $display ("|==+=+=+=+====+====+====+====+====+====+====+====++====+====+====+");
  
    //A for loop, with register i being the loop control variable.
	for (i = 0; i < 65535; i = i + 1) 
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
		
		
		
		for (j = 0; j < 65535; j = j + 1)  
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
		


		
		$display ("|%5d|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b||||||||%5d|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|||||||||||%5d|%16b|",i,s15,s14,s13,s12,s11,s10,s9,s8,s7,s6,s5,s4,s3,s2,s1,s0,j,w15,w14,w13,w12,w11,w10,w9,w8,w7,w6,w5,w4,w3,w2,w1,w0,f1,f1,outwire);
		if(j%4==3) //Every fourth row of the table, put in a marker for easier reading.
		 $display ("|==+=+=+=+====+====+====+====+====+====+====+====++====+====+====+");
  		
		end
  
	end//End of the for loop code block
 */
	#10 //A time dealy of 10 time units. Hashtag Delay
	$finish;//A command, not unlike System.exit(0) in Java.
  end  //End the code block of the main (initial)
  endmodule
