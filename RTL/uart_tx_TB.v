`timescale 1 ns/10 ps
module uart_tx_TB;
	reg 		tb_clock, tb_rst, tb_send;
	reg [1:0]	tb_buad_rate;
	reg [7:0]       tb_data_in; 
	reg [1:0]       tb_parity_type; 	 
	reg 		tb_stop_bits;		
	reg 		tb_data_length; 	
	
	wire  	        tb_data_out; 		
	wire   	        tb_p_parity_out; 	
	wire  	        tb_tx_active; 		
	wire   	        tb_tx_done;


localparam t=20; // because we work at 50MHz frequency

// instantiation
uart_tx UART_TB(
.clock(tb_clock),
.rst(tb_rst),
.send(tb_send),
.buad_rate(tb_buad_rate),
.data_in(tb_data_in), 
.parity_type(tb_parity_type), 	
.stop_bits(tb_stop_bits),
.data_length(tb_data_length), 	
.data_out(tb_data_out), 		
.p_parity_out(tb_p_parity_out), 	
.tx_active(tb_tx_active), 		
.tx_done(tb_tx_done)	
);

// clock
always
begin
tb_clock= 1'b0;
#(t/2);
tb_clock= 1'b1;
#(t/2);
end

// simulation cases
initial
begin
$monitor ("time=%2t , send_control=%b , data_out=%b , parity_out=%b , tx_done=%b/n",$time,tb_send,tb_data_out,tb_p_parity_out,tb_tx_done);

tb_rst= 1'b0;
# (t*10);
tb_rst= 1'b1;

tb_buad_rate=2'b00;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b001_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b00;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1101_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0011;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b100_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b01;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1110_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0111;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b001_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b10;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1001_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b111_0100;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b101_0001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b00;
tb_parity_type=2'b11;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0101_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_rst= 1'b0;
# (t*10);
tb_rst= 1'b1;

tb_buad_rate=2'b01;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b001_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b00;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1001_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b111_0011;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b100_0111;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b01;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0110_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b001_0011;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b001_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b10;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1011_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b110_0100;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b001_0001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b01;
tb_parity_type=2'b11;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1101_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_rst= 1'b0;
# (t*10);
tb_rst= 1'b1;

tb_buad_rate=2'b10;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b100_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b101_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b00;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0101_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_1011;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b110_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b01;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0110_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0110;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b011_0001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b10;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1101_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b110_1100;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b101_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b10;
tb_parity_type=2'b11;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0101_1100;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_rst= 1'b0;
# (t*10);
tb_rst= 1'b1;

tb_buad_rate=2'b11;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b100_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b00;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b011_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b00;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1001_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b01;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b101_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b01;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0110_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b10;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b011_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b10;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b1001_0101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b0;	
tb_data_in=7'b101_1100;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b11;
tb_data_length=1'b0;
tb_stop_bits=1'b1;	
tb_data_in=7'b101_1001;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);

tb_buad_rate=2'b11;
tb_parity_type=2'b11;
tb_data_length=1'b1;
tb_stop_bits=1'b0;	
tb_data_in=8'b0100_1101;
tb_send=1'b0;
# (t*3);
tb_send=1'b1;
@(negedge tb_tx_done);
	
tb_rst=1'b0;
# (t*10);
$stop;
end

endmodule