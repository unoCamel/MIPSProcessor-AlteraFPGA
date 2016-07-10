/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Instruction_Memory_TB.v
--
-----------------------------------------------------------------*/

module Instruction_Memory_TB;
	reg[31:0] fromPC;
	reg clock;
	wire[31:0] fullInstruction;


Instruction_Memory uut (
	.fromPC(fromPC),
	.clock(clock),
	.fullInstruction(fullInstruction)
	);

initial begin
	clock <= 0;
	fromPC <= 0;
end

always begin 
	#1 clock = !clock;
end

initial begin 
$display("-----------------------------------------------------------");
$display("!!!!!!!!!!!!!!!!!!!!!!INSTRUCTION MEMORY!!!!!!!!!!!!!!!!!!!!!!! ");
$display("-----------------------------------------------------------");
end

initial begin
#2 $display("PC(%b) fullInstruction(%b)", fromPC, fullInstruction);
#1 fromPC <= 1;
#2 $display("PC(%b) fullInstruction(%b)", fromPC, fullInstruction);

#10 $stop;

end

endmodule