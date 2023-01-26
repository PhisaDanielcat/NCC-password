`timescale 1ns / 1ps



module S_box_tb();

reg [7:0]inbox;
wire [7:0]outbox;
initial begin
inbox=8'hef;
#20;
inbox=32'h83c;
#20;
inbox=32'hd67;
#20;
$stop;
end


S_box S_box(inbox,outbox);
endmodule
