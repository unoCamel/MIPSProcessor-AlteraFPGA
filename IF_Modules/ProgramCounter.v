/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: ProgramCounter.v
--
-----------------------------------------------------------------*/

module ProgramCounter(
	input[31:0] toPC,
	input reset,
	input clock,
	output reg[31:0] fromPC
);
reg doneOnce = 0;

always@(posedge clock)begin
	if(reset && !doneOnce)begin
		fromPC <= 0;
		doneOnce <= 1;
	end 
	else begin
		fromPC <= toPC;
	end
end

endmodule