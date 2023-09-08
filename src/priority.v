

module tt_um_priority_decoder_Juan_Garcial(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
	    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
	    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
	    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
	    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
	    input  wire       ena,      // will go high when the design is enabled
	    input  wire       clk,      // clock
	    input  wire       rst_n     // reset_n - low to reset 
);


 assign data_in = ui_in;
 assign uo_out[2:0] = data_out;
 assign uo_out[3] = Valid;
 assign uo_out[7:4] = 0;
 assign uio_oe = 0;
 assign uo_out = 0;
 assign uio_out = 0;
 
wire [7:0] data_in;
reg [2:0] data_out;
reg Valid;

    always @(*)
    begin
        case (data_in)
            8'b00000001: data_out = 0; // 0
            8'b00000010: data_out = 1; // 1
            8'b00000100: data_out = 2; // 2
            8'b00001000: data_out = 3; // 3
            8'b00010000: data_out = 4; // 4
            8'b00100000: data_out = 5; // 5
            8'b01000000: data_out = 6; // 6
            8'b10000000: data_out = 7; // 7
            default: data_out = 0; // Display nothing or error
        endcase
        
	    if(data_out == 1 || data_out == 2 || data_out == 4 || data_out == 8 || data_out == 16 || data_out == 32 || data_out == 64 || data_out == 128) Valid = 1;
        else Valid = 0;
    end

endmodule
