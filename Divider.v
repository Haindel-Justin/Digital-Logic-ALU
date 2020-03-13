//iverilog
//sawyer hill

//a/b and a % b
module divider16bit(a,b,q,r);
input [15:0] a;
input [15:0] b;
output [15:0] q;
output [15:0] r;
reg [15:0] w;
reg [15:0] g;
always @(a,b,q,r)
begin
w = a/b;
g = a%b;
end

assign q = w;
assign r = g; 
endmodule

module testbench();

reg [15:0] a;
reg [15:0] b;
wire [15:0] q;
wire [15:0] r;

divider16bit db(a,b,q,r);

initial begin

a=21;
b=7;
#5;
$display("A    B        Quotent      Remainder");
$display("%d|%b||%d|%b||%d||%b||%d||%b",a,a,b,b,q,q,r,r);

a=11;
b=5;
#5;
$display("%d|%b||%d|%b||%d||%b||%d||%b",a,a,b,b,q,q,r,r);

a=30843;
b=27;
#5;
$display("%d|%b||%d|%b||%d||%b||%d||%b",a,a,b,b,q,q,r,r);
end

endmodule