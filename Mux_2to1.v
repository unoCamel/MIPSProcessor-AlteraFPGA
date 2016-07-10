/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Mux_2to1.v
--
-----------------------------------------------------------------*/

module Mux_2to1(
	input[31:0] genericValue1,
	input[31:0] genericValue2,
	input genericF,
	output[31:0] genericOutput
	);

assign genericOutput = (genericF) ? genericValue1 : genericValue2;

endmodule
