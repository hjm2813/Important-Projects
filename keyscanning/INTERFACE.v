`timescale 1ns / 1ps 
module DS1620_INTERFACE( 
input wire CLR,          
input wire CLK_IN,       
input wire DQ_IN,        
output reg [8:0] TEMP = 0,   
output reg CLK_OUT = 0,      
output reg RST = 0,          
output reg TRI_EN = 0,       
output reg DQ_OUT = 0 
); 
localparam IDLE = 0, 
SEND_CMD = 1, 
WAIT_FOR_RESPONSE = 2, 
READ_DATA = 3; 
reg [1:0] state = IDLE; 
reg [3:0] bit_count = 0;   
always @(posedge CLK_IN) begin 
    if (CLR) begin 
        // Reset logic 
        state <= IDLE; 
        TEMP <= 0; 
        RST <= 1;   
        TRI_EN <= 0; 
        DQ_OUT <= 0; 
        CLK_OUT <= 0; 
        bit_count <= 0; 
    end else begin 
        case (state) 
            IDLE: begin 
                RST <= 0;   
                TRI_EN <= 1;   
                DQ_OUT <= 1;   
                CLK_OUT <= 1; 
                state <= SEND_CMD; 
            end 
            SEND_CMD: begin 
                CLK_OUT <= ~CLK_OUT;   
                state <= WAIT_FOR_RESPONSE; 
            end 
            WAIT_FOR_RESPONSE: begin 
                TRI_EN <= 0;  // Switch to input mode 
                state <= READ_DATA; 
            end 
            READ_DATA: begin 
                if (bit_count < 9) begin 
                    TEMP <= (TEMP << 1) | DQ_IN; 
                    bit_count <= bit_count + 1; 
                end else begin 
                    state <= IDLE; 
                    bit_count <= 0; 
                end 
            end 
            default: state <= IDLE; 
        endcase 
    end 
end 
 
endmodule
