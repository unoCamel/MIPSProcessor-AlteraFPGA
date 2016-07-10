/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Mux_2to1_smallBit.v
--
-----------------------------------------------------------------*/

module Mux_2to1_smallBit(
	input[4:0] genericValue1,
	input[4:0] genericValue2,
	input[1:0] genericF,
	output reg[4:0] genericOutput
	);


always@(*)begin
	case(genericF)
		2'b01: genericOutput = genericValue1;
		2'b00: genericOutput = genericValue2;
		2'b10: genericOutput = 5'b11111;
		default: genericOutput = 0;
	endcase
end



endmodule
