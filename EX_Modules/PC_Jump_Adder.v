/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: PC_Jump_Adder.v
--
-----------------------------------------------------------------*/

module PC_Jump_Adder(
	input[31:0] shiftedExtendedImmediate,
	input[31:0] incrPC,
	output[31:0] addPCResult
	);


assign addPCResult = shiftedExtendedImmediate + incrPC;

endmodule