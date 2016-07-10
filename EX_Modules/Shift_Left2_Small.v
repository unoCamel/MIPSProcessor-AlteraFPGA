/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Shift_Left2_Small.v
--
-----------------------------------------------------------------*/

module Shift_Left2_Small(
		input[25:0] genericInput,
		output[27:0] shiftedGenericOutput
		);

assign shiftedGenericOutput = {genericInput[23:0], 2'b0};
//assign shiftedGenericOutput = genericInput << 2;

endmodule