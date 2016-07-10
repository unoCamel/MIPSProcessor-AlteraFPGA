/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Shift_Left2.v
--
-----------------------------------------------------------------*/

module Shift_Left2(
		input[31:0] genericInput,
		output[31:0] shiftedGenericOutput
		);

assign shiftedGenericOutput = {genericInput[29:0], 2'b0};
//assign shiftedGenericOutput = genericInput << 2;

endmodule