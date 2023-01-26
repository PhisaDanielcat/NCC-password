`timescale 1ns / 1ps



module LB_func_tb();

reg [31:0]B;
wire [31:0]LB;
initial begin
B=32'h00000001;
#20;
B=32'h8ad24122;
#20;
B=32'hd5b555c2;
#20;
$stop;
end


LB_func LB_func(B,LB);
endmodule
