`timescale 1ns / 1ps



module top_tb();
    reg clk_sys;
    reg reset_sys_n;
    reg [127:0] crypto_key;
    reg key_expansion_run;
    wire key_expansion_busy;
    wire crypto_rnd_key_vld;
    wire [31:0] crypto_rnd_key;
    
    initial clk_sys = 0;
    always #10 clk_sys =~clk_sys;
    
    initial begin
    reset_sys_n = 0;
    #20
    reset_sys_n = 1;
    crypto_key = 128'h01234567_89ABCDEF_FEDCBA98_76543210;
    key_expansion_run=1;
    #1320;
    $stop;
    end
    
    top top(
    .clk_sys(clk_sys),
    .reset_sys_n(reset_sys_n),
    .crypto_key(crypto_key),
    .key_expansion_run(key_expansion_run),
    .key_expansion_busy(key_expansion_busy),
    .crypto_rnd_key_vld(crypto_rnd_key_vld),
    .crypto_rnd_key(crypto_rnd_key)
    );

endmodule
