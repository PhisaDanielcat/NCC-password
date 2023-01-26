`timescale 1ns / 1ps

module top(
    input clk_sys,
    input reset_sys_n,
    input [127:0] crypto_key,
//    input key_expansion_run,
    output key_expansion_busy,
    output crypto_rnd_key_vld,
    output [31:0] crypto_rnd_key
    );
    
    reg [127:0]MK;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            MK <= 0;
        else
            MK <= crypto_key;
            
    reg [31:0]Ki[35:0];
    reg [31:0]rKi[31:0];
    reg [31:0]outbox;
    reg [31:0]outLB;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            integer i;
            for(i=0;i<=35;i++)
                Ki[i]<=0;
                end
        else begin
            Ki[0] <= MK[31:0]^FKi[0];
            Ki[1] <= MK[63:32]^FKi[1];
            Ki[2] <= MK[95:64]^FKi[2];
            Ki[3] <= MK[127:96]^FKi[3];
            Ki[4] <= Ki[0]^outLB;
        end
    wire [31:0]inbox;
    assign inbox = Ki[1]^Ki[2]^Ki[3]^CKi[4];    
    S_box S_box1(inbox[7:0],outbox[7:0]);
    S_box S_box2(inbox[15:8],outbox[15:8]);
    S_box S_box3(inbox[23:16],outbox[23:16]);
    S_box S_box4(inbox[31:24],outbox[31:24]);
    LB_func LB_func(outbox,outLB);

    reg [31:0]FKi[3:0];
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            integer i;
            for(i=0;i<=3;i++)
                FKi[i]<=0;
                end
        else
            begin
            FK[0] <= 32'hA3B1BAC6;
            FK[1] <= 32'h56AA3350;
            FK[2] <= 32'h677D9197;
            FK[3] <= 32'hB27022DC;
            end

    reg[31:0]CKi[31:0];
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            integer i;
            for(i=0;i<=31;i++)
                CKi[i]<=0;
                end
        else
            begin
                CKi[0] <= 32'h00070e15;
                CKi[1] <= 32'h1c232a31;
                CKi[2] <= 32'h383f464d;
                CKi[3] <= 32'h545b6269;
                CKi[4] <= 32'h70777e85;
                CKi[5] <= 32'h8c939aa1;
                CKi[6] <= 32'ha8afb6bd;
                CKi[7] <= 32'hc4cbd2d9;
                CKi[8] <= 32'he0e7eef5;
                CKi[9] <= 32'hfc030a11;
                CKi[10] <= 32'h181f262d;
                CKi[11] <= 32'h343b4249;
                CKi[12] <= 32'h50575e65;
                CKi[13] <= 32'h6c737a81;
                CKi[14] <= 32'h888f969d;
                CKi[15] <= 32'ha4abb2b9;
                CKi[16] <= 32'hc0c7ced5;
                CKi[17] <= 32'hdce3eaf1;
                CKi[18] <= 32'hf8ff060d;
                CKi[19] <= 32'h141b2229;
                CKi[20] <= 32'h30373e45;
                CKi[21] <= 32'h4c535a61;
                CKi[22] <= 32'h686f767d;
                CKi[23] <= 32'h848b9299;
                CKi[24] <= 32'ha0a7aeb5;
                CKi[25] <= 32'hbcc3cad1;
                CKi[26] <= 32'hd8dfe6ed;
                CKi[27] <= 32'hf4fb0209;
                CKi[28] <= 32'h10171e25;
                CKi[29] <= 32'h2c333a41;
                CKi[30] <= 32'h484f565d;
                CKi[31] <= 32'h646b7279;
            end    
endmodule
