`timescale 1ns / 1ps

module top(
    input clk_sys,
    input reset_sys_n,
    input [127:0] crypto_key,
    input key_expansion_run,
    output reg key_expansion_busy,
    output reg crypto_rnd_key_vld,
    output reg[31:0] crypto_rnd_key
    );
    
    
    reg [63:0]cnter;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            cnter <= 0;
        else if(key_expansion_run == 0)
            cnter <= 0;
        else
            cnter <= cnter + 1;
    
    reg [4:0]num;
        always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            num <= 0;
        else if(key_expansion_run == 0)
            num <= 0;
        else case(cnter)
                    64'd5: num <= 0;
            64'd6: num <= 0;
            64'd7: num <= 1;
            64'd8: num <= 1;
            64'd9: num <= 2;
            64'd10: num <= 2;
            64'd11: num <= 3;
            64'd12: num <= 3;
            64'd13: num <= 4;
            64'd14: num <= 4;
            64'd15: num <= 5;
            64'd16: num <= 5;
            64'd17: num <= 6;
            64'd18: num <= 6;
            64'd19: num <= 7;
            64'd20: num <= 7;
            64'd21: num <= 8;
            64'd22: num <= 8;
            64'd23: num <= 9;
            64'd24: num <= 9;
            64'd25: num <= 10;
            64'd26: num <= 10;
            64'd27: num <= 11;
            64'd28: num <= 11;
            64'd29: num <= 12;
            64'd30: num <= 12;
            64'd31: num <= 13;
            64'd32: num <= 13;
            64'd33: num <= 14;
            64'd34: num <= 14;
            64'd35: num <= 15;
            64'd36: num <= 15;
            64'd37: num <= 16;
            64'd38: num <= 16;
            64'd39: num <= 17;
            64'd40: num <= 17;
            64'd41: num <= 18;
            64'd42: num <= 18;
            64'd43: num <= 19;
            64'd44: num <= 19;
            64'd45: num <= 20;
            64'd46: num <= 20;
            64'd47: num <= 21;
            64'd48: num <= 21;
            64'd49: num <= 22;
            64'd50: num <= 22;
            64'd51: num <= 23;
            64'd52: num <= 23;
            64'd53: num <= 24;
            64'd54: num <= 24;
            64'd55: num <= 25;
            64'd56: num <= 25;
            64'd57: num <= 26;
            64'd58: num <= 26;
            64'd59: num <= 27;
            64'd60: num <= 27;
            64'd61: num <= 28;
            64'd62: num <= 28;
            64'd63: num <= 29;
            64'd64: num <= 29;
            64'd65: num <= 30;
            64'd66: num <= 30;
            64'd67: num <= 31;
            64'd68: num <= 31;
            64'd69: num <= 32;
            64'd70: num <= 32;
            64'd71: num <= 33;
            64'd72: num <= 33;
            64'd73: num <= 34;
            64'd74: num <= 34;
            64'd75: num <= 35;
            64'd76: num <= 35;
//            64'd5: num <= 0;
//            64'd7: num <= 1;
//            64'd9: num <= 2;
//            64'd11: num <= 3;
//            64'd13: num <= 4;
//            64'd15: num <= 5;
//            64'd17: num <= 6;
//            64'd19: num <= 7;
//            64'd21: num <= 8;
//            64'd23: num <= 9;
//            64'd25: num <= 10;
//            64'd27: num <= 11;
//            64'd29: num <= 12;
//            64'd31: num <= 13;
//            64'd33: num <= 14;
//            64'd35: num <= 15;
//            64'd37: num <= 16;
//            64'd39: num <= 17;
//            64'd41: num <= 18;
//            64'd43: num <= 19;
//            64'd45: num <= 20;
//            64'd47: num <= 21;
//            64'd49: num <= 22;
//            64'd51: num <= 23;
//            64'd53: num <= 24;
//            64'd55: num <= 25;
//            64'd57: num <= 26;
//            64'd59: num <= 27;
//            64'd61: num <= 28;
//            64'd63: num <= 29;
//            64'd65: num <= 30;
//            64'd67: num <= 31;
            default: num <= 0;
        endcase


    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            crypto_rnd_key_vld <= 0;
        else if((num==0&&cnter==6)||(num<32&&num>0))
            crypto_rnd_key_vld <= 1;
        else
            crypto_rnd_key_vld <= 0;

    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            key_expansion_busy <= 0;
        else if(key_expansion_run == 1)
            key_expansion_busy <= 1;
        else if(cnter > 36)
            key_expansion_busy <= 0;
        else
            key_expansion_busy <= key_expansion_busy;
    
    
    reg [127:0]MK;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            MK <= 0;
        else
            MK <= crypto_key;
            
    reg [31:0]Ki[35:0];
    wire [31:0]outbox;
    wire [31:0]outLB;
    integer i;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            for(i=0;i<=35;i=i+1)
                Ki[i]<=0;
                end
        else if(key_expansion_run==1)begin
            case(cnter)
                64'd1:begin            
                    Ki[0] <= MK[127:96]^FKi[0];
                    Ki[1] <= MK[95:64]^FKi[1];
                    Ki[2] <= MK[63:32]^FKi[2];
                    Ki[3] <= MK[31:0]^FKi[3];
                    end
                64'd5:Ki[4] <= Ki[0]^outLB;
                64'd7:Ki[5] <= Ki[1]^outLB;
                64'd9:Ki[6] <= Ki[2]^outLB;
                64'd11:Ki[7] <= Ki[3]^outLB;
                64'd13:Ki[8] <= Ki[4]^outLB;
                64'd15:Ki[9] <= Ki[5]^outLB;
                64'd17:Ki[10] <= Ki[6]^outLB;
                64'd19:Ki[11] <= Ki[7]^outLB;
                64'd21:Ki[12] <= Ki[8]^outLB;
                64'd23:Ki[13] <= Ki[9]^outLB;
                64'd25:Ki[14] <= Ki[10]^outLB;
                64'd27:Ki[15] <= Ki[11]^outLB;
                64'd29:Ki[16] <= Ki[12]^outLB;
                64'd31:Ki[17] <= Ki[13]^outLB;
                64'd33:Ki[18] <= Ki[14]^outLB;
                64'd35:Ki[19] <= Ki[15]^outLB;
                64'd37:Ki[20] <= Ki[16]^outLB;
                64'd39:Ki[21] <= Ki[17]^outLB;
                64'd41:Ki[22] <= Ki[18]^outLB;
                64'd43:Ki[23] <= Ki[19]^outLB;
                64'd45:Ki[24] <= Ki[20]^outLB;
                64'd47:Ki[25] <= Ki[21]^outLB;
                64'd49:Ki[26] <= Ki[22]^outLB;
                64'd51:Ki[27] <= Ki[23]^outLB;
                64'd53:Ki[28] <= Ki[24]^outLB;
                64'd55:Ki[29] <= Ki[25]^outLB;
                64'd57:Ki[30] <= Ki[26]^outLB;
                64'd59:Ki[31] <= Ki[27]^outLB;
                64'd61:Ki[32] <= Ki[28]^outLB;
                64'd63:Ki[33] <= Ki[29]^outLB;
                64'd65:Ki[34] <= Ki[30]^outLB;
                64'd67:Ki[35] <= Ki[31]^outLB;
                default : begin
                    for(i=0;i<=35;i=i+1)
                    Ki[i]<=Ki[i];
                end
            endcase
        end


    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)
            crypto_rnd_key <= 0;
        else case(num)
               5'd0:crypto_rnd_key <= Ki[4];
               5'd1:crypto_rnd_key <= Ki[5];
               5'd2:crypto_rnd_key <= Ki[6];
               5'd3:crypto_rnd_key <= Ki[7];
               5'd4:crypto_rnd_key <= Ki[8];
               5'd5:crypto_rnd_key <= Ki[9];
               5'd6:crypto_rnd_key <= Ki[10];
               5'd7:crypto_rnd_key <= Ki[11];
               5'd8:crypto_rnd_key <= Ki[12];
               5'd9:crypto_rnd_key <= Ki[13];
               5'd10:crypto_rnd_key <= Ki[14];
               5'd11:crypto_rnd_key <= Ki[15];
               5'd12:crypto_rnd_key <= Ki[16];
               5'd13:crypto_rnd_key <= Ki[17];
               5'd14:crypto_rnd_key <= Ki[18];
               5'd15:crypto_rnd_key <= Ki[19];
               5'd16:crypto_rnd_key <= Ki[20];
               5'd17:crypto_rnd_key <= Ki[21];
               5'd18:crypto_rnd_key <= Ki[22];
               5'd19:crypto_rnd_key <= Ki[23];
               5'd20:crypto_rnd_key <= Ki[24];
               5'd21:crypto_rnd_key <= Ki[25];
               5'd22:crypto_rnd_key <= Ki[26];
               5'd23:crypto_rnd_key <= Ki[27];
               5'd24:crypto_rnd_key <= Ki[28];
               5'd25:crypto_rnd_key <= Ki[29];
               5'd26:crypto_rnd_key <= Ki[30];
               5'd27:crypto_rnd_key <= Ki[31];
               5'd28:crypto_rnd_key <= Ki[32];
               5'd29:crypto_rnd_key <= Ki[33];
               5'd30:crypto_rnd_key <= Ki[34];
               5'd31:crypto_rnd_key <= Ki[35];
               default:crypto_rnd_key <= 0;
           endcase
    

        
    reg [31:0]inbox;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            inbox <= 0;
                end
        else case(cnter)
            64'd4:inbox <= Ki[1]^Ki[2]^Ki[3]^CKi[0];
            64'd6:inbox <= Ki[2]^Ki[3]^Ki[4]^CKi[1];
            64'd8:inbox <= Ki[3]^Ki[4]^Ki[5]^CKi[2];
            64'd10:inbox <= Ki[4]^Ki[5]^Ki[6]^CKi[3];
            64'd12:inbox <= Ki[5]^Ki[6]^Ki[7]^CKi[4];
            64'd14:inbox <= Ki[6]^Ki[7]^Ki[8]^CKi[5];
            64'd16:inbox <= Ki[7]^Ki[8]^Ki[9]^CKi[6];
            64'd18:inbox <= Ki[8]^Ki[9]^Ki[10]^CKi[7];
            64'd20:inbox <= Ki[9]^Ki[10]^Ki[11]^CKi[8];
            64'd22:inbox <= Ki[10]^Ki[11]^Ki[12]^CKi[9];
            64'd24:inbox <= Ki[11]^Ki[12]^Ki[13]^CKi[10];
            64'd26:inbox <= Ki[12]^Ki[13]^Ki[14]^CKi[11];
            64'd28:inbox <= Ki[13]^Ki[14]^Ki[15]^CKi[12];
            64'd30:inbox <= Ki[14]^Ki[15]^Ki[16]^CKi[13];
            64'd32:inbox <= Ki[15]^Ki[16]^Ki[17]^CKi[14];
            64'd34:inbox <= Ki[16]^Ki[17]^Ki[18]^CKi[15];
            64'd36:inbox <= Ki[17]^Ki[18]^Ki[19]^CKi[16];
            64'd38:inbox <= Ki[18]^Ki[19]^Ki[20]^CKi[17];
            64'd40:inbox <= Ki[19]^Ki[20]^Ki[21]^CKi[18];
            64'd42:inbox <= Ki[20]^Ki[21]^Ki[22]^CKi[19];
            64'd44:inbox <= Ki[21]^Ki[22]^Ki[23]^CKi[20];
            64'd46:inbox <= Ki[22]^Ki[23]^Ki[24]^CKi[21];
            64'd48:inbox <= Ki[23]^Ki[24]^Ki[25]^CKi[22];
            64'd50:inbox <= Ki[24]^Ki[25]^Ki[26]^CKi[23];
            64'd52:inbox <= Ki[25]^Ki[26]^Ki[27]^CKi[24];
            64'd54:inbox <= Ki[26]^Ki[27]^Ki[28]^CKi[25];
            64'd56:inbox <= Ki[27]^Ki[28]^Ki[29]^CKi[26];
            64'd58:inbox <= Ki[28]^Ki[29]^Ki[30]^CKi[27];
            64'd60:inbox <= Ki[29]^Ki[30]^Ki[31]^CKi[28];
            64'd62:inbox <= Ki[30]^Ki[31]^Ki[32]^CKi[29];
            64'd64:inbox <= Ki[31]^Ki[32]^Ki[33]^CKi[30];
            64'd66:inbox <= Ki[32]^Ki[33]^Ki[34]^CKi[31];
            64'd68:inbox <= Ki[33]^Ki[34]^Ki[35]^CKi[32];
            64'd70:inbox <= Ki[34]^Ki[35]^Ki[36]^CKi[33];
            64'd72:inbox <= Ki[35]^Ki[36]^Ki[37]^CKi[34];
            64'd74:inbox <= Ki[36]^Ki[37]^Ki[38]^CKi[35]; 
        endcase
    
    S_box S_box1(inbox[7:0],outbox[7:0]);
    S_box S_box2(inbox[15:8],outbox[15:8]);
    S_box S_box3(inbox[23:16],outbox[23:16]);
    S_box S_box4(inbox[31:24],outbox[31:24]);
    LB_func LB_func(outbox,outLB);

    integer j;
    reg [31:0]FKi[3:0];
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            for(j=0;j<=3;j=j+1)
                FKi[j]<=0;
                end
        else
            begin
            FKi[0] <= 32'hA3B1BAC6;
            FKi[1] <= 32'h56AA3350;
            FKi[2] <= 32'h677D9197;
            FKi[3] <= 32'hB27022DC;
            end

    reg[31:0]CKi[31:0];
    integer k;
    always@(posedge clk_sys or negedge reset_sys_n)
        if(!reset_sys_n)begin
            for(k=0;k<=31;k=k+1)
                CKi[k]<=0;
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