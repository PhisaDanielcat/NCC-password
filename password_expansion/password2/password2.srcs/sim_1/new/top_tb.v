`timescale 1ns / 1ps
module top_tb();

    reg clk_sys;
    reg reset_sys_n;
//    reg ghash_str;
//    reg ghash_run;
    reg [15:0] ghash_data_len;
    reg [127:0] ghash_din;
    reg [127:0] ghash_key;
    reg [127:0] ghash_ivin;
    wire ghash_done;
    wire ghash_busy;
    wire [127:0] ghash_result;

initial clk_sys=0;
always #10 clk_sys=~clk_sys;

initial begin
reset_sys_n=0;
#30;
reset_sys_n=1;
ghash_din=448'h3BEA3321_BDA9EBF0_2D5459BC_E4295E3A;
ghash_key=128'h00BA5F76_F3D8982B_199920E3_221ED05F;
ghash_ivin=128'h384C3CED_E5CBC556_0F002F94_A8E4205A;
#40;

$stop;
end

top top(
    clk_sys,
    reset_sys_n,
//    ghash_str,
//    ghash_run,
    ghash_data_len,
    ghash_din,
    ghash_key,
    ghash_ivin,
    ghash_done,
    ghash_busy,
    ghash_result
    );
endmodule
