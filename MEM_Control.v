/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: MEM_Control.v
--
-----------------------------------------------------------------*/

module MEM_Control(
	input[31:0] ALUResult,
	input[31:0] outRegB,
	input memReadF,
	input memWriteF,
	input clock,
	output[31:0] readData,
	output[7:0] finalAnswer
	);


Data_Memory Data_Memory1(
	.address(ALUResult),
	.writeData(outRegB),
	.memWriteF(memWriteF),
	.memReadF(memReadF),
	.clock(clock),
	.readData(readData),
	.finalAnswer(finalAnswer)
	);



endmodule
