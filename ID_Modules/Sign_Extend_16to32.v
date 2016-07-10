/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Sign_Extend_16to32.v
--
-----------------------------------------------------------------*/

module Sign_Extend_16to32(
	input[15:0] immediate,
	output[31:0] extendedImmediate
	);

	assign extendedImmediate = {{16{immediate[15]}}, immediate};
	
endmodule