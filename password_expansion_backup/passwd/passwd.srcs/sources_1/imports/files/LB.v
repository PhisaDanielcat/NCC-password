`timescale 1ns / 1ps

module LB_func(
    input [31:0] B,
    output [31:0] LB
    );
    wire[31:0]B_left_13;
    wire[31:0]B_left_23;
    
    assign B_left_13 = {B[18:0] , B[31:19]};
    assign B_left_23 = {B[8:0] , B[31:9]};
    assign LB = B^B_left_13^B_left_23;
    
endmodule
