`timescale 1ns / 1ps 
module DS1620_INTERFACE_tb(); 
 
    reg CLR; 
    reg CLK_IN = 0; 
    reg DQ_IN = 0; 
 
    wire [8:0] TEMP; 
    wire CLK_OUT; 
    wire RST; 
    wire TRI_EN; 
    wire DQ_OUT; 
 
    DS1620_INTERFACE uut ( 
        .CLR(CLR), 
        .CLK_IN(CLK_IN), 
        .DQ_IN(DQ_IN), 
        .TEMP(TEMP), 
        .CLK_OUT(CLK_OUT), 
        .RST(RST), 
        .TRI_EN(TRI_EN), 
        .DQ_OUT(DQ_OUT) 
    ); 
 
    initial begin 
        forever #5 CLK_IN = ~CLK_IN;   
    end 
 
    initial begin 
        CLR = 1; 
        #100; 
        CLR = 0; 
 
        #200; DQ_IN = 1; 
#10; DQ_IN = 0; 
#10; DQ_IN = 1; 
#10; DQ_IN = 0; 
#10; DQ_IN = 1; 
repeat (4) begin 
#10; DQ_IN = ~DQ_IN; 
end 
end 
initial begin 
#500; // Run simulation for enough time to observe the behavior 
$stop; 
end 
always @(posedge CLK_OUT) begin 
$display("Temperature reading at %t: %d", $time, TEMP); 
end 
endmodule
