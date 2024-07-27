module baudgen 
#(parameter CLK_FREQ=50000000)(
    input clk,        
    input rst,       
    input [1:0] baud_rate, 
    output reg baud_tick  
);

    // information
    // CLK_FREQ = 50MHz.
    // used equation => [ (clock freq)/(req freq * 16) ] - 1.

    localparam integer width= (CLK_FREQ/(2400*16))-1;

    
    //hold the counter value
    reg [$clog2(width)-1:0] current_counter, next_counter;
    reg [$clog2(width)-1:0] TOTAL_COUNTS;

    
always @(posedge clk, negedge rst)
begin
if (!rst)
current_counter<= 11'd0;
else
current_counter<= next_counter;
end


always @(*)
begin
next_counter= current_counter;
baud_tick= 1'b0;
case (baud_rate)
2'b00:begin
         TOTAL_COUNTS= ($ceil( (CLK_FREQ)/(2400*16) ) - 1);
         if (current_counter== TOTAL_COUNTS)
            begin
               next_counter= 11'd0;
               baud_tick= 1'b1;
            end
         else
            next_counter= current_counter+1 ;
      end

2'b01:begin
         TOTAL_COUNTS= (( $ceil(CLK_FREQ)/(4800*16) ) - 1);
         if (current_counter== TOTAL_COUNTS)
            begin
               next_counter= 11'd0;
               baud_tick= 1'b1;
            end
         else
            next_counter= current_counter+1 ;
      end

2'b10:begin
         TOTAL_COUNTS= (( $ceil(CLK_FREQ)/(9600*16) ) - 1);
         if (current_counter== TOTAL_COUNTS)
            begin
               next_counter= 11'd0;
               baud_tick= 1'b1;
            end
         else
            next_counter= current_counter+1 ;
      end

2'b11:begin
         TOTAL_COUNTS= (( $ceil(CLK_FREQ)/(19200*16) ) - 1);
         if (current_counter== TOTAL_COUNTS)
            begin
               next_counter= 11'd0;
               baud_tick= 1'b1;
            end
         else
            next_counter= current_counter+1 ;
      end
default: next_counter= current_counter;
endcase
end

endmodule