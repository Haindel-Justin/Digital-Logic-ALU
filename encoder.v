// testbench
module main;

    reg[15:0] a1;
    wire[3:0] b1;
    encoder enc(a1, b1);
    
  initial 
    begin
  
    assign a1=16'b0000000001000000;
    #100
     $display("Enc Input:\t%16b\nEnc Output:\t%4b", enc.a, enc.b);
     $finish ;
          
    end
endmodule

//16->4 encoder
module encoder(a, b);

  input[15:0] a;
  output[3:0] b;
  
  assign b[0] = a[1] | a[3] | a[5] | a[7] | a[9]  | a[11] | a[13] | a[15];
  assign b[1] = a[2] | a[3] | a[6] | a[7] | a[10] | a[11] | a[14] | a[15];
  assign b[2] = a[4] | a[5] | a[6] | a[7] | a[12] | a[13] | a[14] | a[15];
  assign b[3] = a[8] | a[9] | a[10] | a[11] | a[12] | a[13] | a[14] | a[15];
  
endmodule