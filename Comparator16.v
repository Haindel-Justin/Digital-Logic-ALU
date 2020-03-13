//iverilog
//sawyer Hill
module comparator1bit(a,b,ls,eq,gt);
input a;
input b;
output ls;
output eq;
output gt;

assign ls = (~a)&b;
assign gt = (~b)&a;
assign eq = ~(ls|gt);


endmodule


module comparator2bit(a,b,ls,eq,gt);
input [1:0] a;
input [1:0] b;
output ls;
output eq;
output gt;

wire c1,c2,c3,c4,c5,c6;

comparator1bit msb(a[1],b[1],c4,c5,c6);
comparator1bit lsb(a[0],b[0],c1,c2,c3);

assign ls = c4 | c5 & c1;
assign eq = c5 & c2;
assign gt = c6 | c5 & c3;

endmodule


module comparator4bit(a,b,ls,eq,gt);
input [3:0] a;
input [3:0] b;
output ls;
output eq;
output gt;

wire c1,c2,c3,c4,c5,c6;

comparator2bit msb(a[3:2],b[3:2],c4,c5,c6);
comparator2bit lsb(a[1:0],b[1:0],c1,c2,c3);

assign ls = c4 | c5 & c1;
assign eq = c5 & c2;
assign gt = c6 | c5 & c3;

endmodule


module comparator8bit(a,b,ls,eq,gt);
input [7:0] a;
input [7:0] b;
output ls;
output eq;
output gt;

wire c1,c2,c3,c4,c5,c6;

comparator4bit msb(a[7:4],b[7:4],c4,c5,c6);
comparator4bit lsb(a[3:0],b[3:0],c1,c2,c3);

assign ls = c4 | c5 & c1;
assign eq = c5 & c2;
assign gt = c6 | c5 & c3;

endmodule


module comparator16bit(a,b,ls,eq,gt);
input [15:0] a;
input [15:0] b;
output ls;
output eq;
output gt;

wire c1,c2,c3,c4,c5,c6;

comparator8bit msb(a[15:8],b[15:8],c4,c5,c6);
comparator8bit lsb(a[7:0],b[7:0],c1,c2,c3);

assign ls = c4 | c5 & c1;
assign eq = c5 & c2;
assign gt = c6 | c5 & c3;

endmodule





module testbench();
wire ls,gt,eq;
reg [15:0] v1;
reg [15:0] v2;

comparator16bit c16(v1,v2,ls,eq,gt);

initial begin
	v1={16'b0000000000000001};
	v2={16'b0000000000000001};
	#6;
	$display("||    A     ||    B    ||A<B|A=B|A>B|    ");
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);

	v1={16'b0000000000000010};
	v2={16'b0000000000000001};
	#6;
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);
	v1={16'b0000000000000010};
	v2={16'b0000000000000011};
	#6;
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);
	v1={16'b0000000000000010};
	v2={16'b0100000000000000};
	#6;
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);
	v1={16'b0100100001000000};
	v2={16'b0001110011100000};
	#6;
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);
	v1={16'b0110000010000010};
	v2={16'b0110000010000010};
	#6;
	$display("||%10d||%10d||%1b||%1b|\%1b|||",v1,v2,ls,eq,gt);

end



endmodule
