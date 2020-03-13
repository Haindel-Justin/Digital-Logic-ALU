module multiplexer(
    input [31:0] a,
    input [31:0] b,
    input select,
    output [31:0] result,
    input clk
    );
    wire [31:0] a,b;
    reg [31:0] result;
     
    always @(a,b,select)
    begin
    if(select==0)
        result=a;
    else
        result=b;
    end    
endmodule