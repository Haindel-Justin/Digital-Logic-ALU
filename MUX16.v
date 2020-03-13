//## modified from fun.v
//sawyer hill
module Multiplexer8to1(Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0, s, b) ;
  parameter bus_size = 16 ;
  input [bus_size-1:0] Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0 ;  // inputs
  input [7:0] s ; // one-hot select
  output[bus_size-1:0] b ;
  assign b = 
  ({bus_size{s[7]}} & Ch7) | 
  ({bus_size{s[6]}} & Ch6) | 
  ({bus_size{s[5]}} & Ch5) | 
  ({bus_size{s[4]}} & Ch4) |   
  ({bus_size{s[3]}} & Ch3) |   
  ({bus_size{s[2]}} & Ch2) | 
  ({bus_size{s[1]}} & Ch1) |
  ({bus_size{s[0]}} & Ch0) ;
endmodule

//## modified from fun.v
module Multiplexer4to1(Ch3,Ch2, Ch1, Ch0, s, b) ;
  parameter bus_size = 16 ;
  input [bus_size-1:0] Ch3,Ch2, Ch1, Ch0 ;  // inputs
  input [4:0] s ; // one-hot select
  output[bus_size-1:0] b ;
  assign b =   
  ({bus_size{s[3]}} & Ch3) |   
  ({bus_size{s[2]}} & Ch2) | 
  ({bus_size{s[1]}} & Ch1) |
  ({bus_size{s[0]}} & Ch0) ;
endmodule

//## modified from fun.v
module Multiplexer16to1(Ch15,Ch14,Ch13,Ch12,Ch11,Ch10,Ch9,Ch8,Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0, s, b) ;
  parameter bus_size = 16 ;
  input [bus_size-1:0] Ch15,Ch14,Ch13,Ch12,Ch11,Ch10,Ch9,Ch8,Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0 ;  // inputs
  input [15:0] s ; // one-hot select
  output[bus_size-1:0] b ;
  assign b = 
  ({bus_size{s[15]}} & Ch15) | 
  ({bus_size{s[14]}} & Ch14) | 
  ({bus_size{s[13]}} & Ch13) | 
  ({bus_size{s[12]}} & Ch12) |   
  ({bus_size{s[11]}} & Ch11) |   
  ({bus_size{s[10]}} & Ch10) | 
  ({bus_size{s[9]}} & Ch9) |
  ({bus_size{s[8]}} & Ch8) |
  ({bus_size{s[7]}} & Ch7) | 
  ({bus_size{s[6]}} & Ch6) | 
  ({bus_size{s[5]}} & Ch5) | 
  ({bus_size{s[4]}} & Ch4) |   
  ({bus_size{s[3]}} & Ch3) |   
  ({bus_size{s[2]}} & Ch2) | 
  ({bus_size{s[1]}} & Ch1) |
  ({bus_size{s[0]}} & Ch0) ;
endmodule

module connector();

reg [15:0] c0;
reg [15:0] c1;
reg [15:0] c2;
reg [15:0] c3;
reg [15:0] c4;
reg [15:0] c5;
reg [15:0] c6;
reg [15:0] c7;
reg [15:0] c8;
reg [15:0] c9;
reg [15:0] c10;
reg [15:0] c11;
reg [15:0] c12;
reg [15:0] c13;
reg [15:0] c14;
reg [15:0] c15;
reg [15:0] sl;
reg [7:0] s2;
reg [4:0] s3;
wire [15:0] ret;
wire [15:0] ret2;
wire [15:0] ret3;

 Multiplexer16to1 st1(c15,c14,c13,c12,c11,c10,c9,c8,c7,c6,c5,c4,c3,c2, c1, c0, sl, ret) ;
 Multiplexer8to1 st2(c7,c6,c5,c4,c3,c2, c1, c0, s2, ret2) ;
 Multiplexer4to1 st3(c3,c2, c1, c0, s3, ret3) ;
initial begin
	c0={16'b1000000000000000};
	c1={16'b0100010000000000};
	c2={16'b0100011000000000};
	c3={16'b0000010000001100};
	c4={16'b1000010000000000};
	c5={16'b0000010000000000};
	c6={16'b0000011000100000};
	c7={16'b0000010000001100};
	c8={16'b0000010000100000};
	c9={16'b0000000000100000};
	c10={16'b0000010001110000};
	c11={16'b0010011000000100};
	c12={16'b0000010000001100};
	c13={16'b1000010001000000};
	c14={16'b0110010000010000};
	c15={16'b1111111100000000};

	#10;
	sl={16'b0000010000000000};
	s2={16'b00000100};
	s3={16'b0010};
	#10
	$display("|||%b||%b||||%b|",ret,ret2,ret3);
	
	sl={16'b0000000000000001};
	s2={16'b00000001};
	s3={16'b0001};
	#10;
	$display("|||%b||%b||||%b|",ret,ret2,ret3);

	sl={16'b0000000000000010};
	s2={16'b00000010};
	s3={16'b0010};
	#10;
	$display ("|||%b||%b||||%b|",ret,ret2,ret3);
	sl={16'b0000000000000100};
	s2={16'b00000100};
	s3={16'b0100};
	#10;
	$display("|||%b||%b||||%b|",ret,ret2,ret3);
	sl={16'b1000000000000000};
	s2={16'b10000000};
	s3={16'b1000};
	#10;
	$display("|||%b||%b||||%b|",ret,ret2,ret3);
	sl={16'b0010000000000000};
	s2={16'b01000000};
	s3={16'b1000};
	#10;
	$display("|||%b||%b||||%b|",ret,ret2,ret3);
end


endmodule


