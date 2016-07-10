/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Mux_3to1.v
--
-----------------------------------------------------------------*/

module Mux_3to1(
	input[31:0] genericValue1,
	input[31:0] genericValue2,
	input[31:0] genericValue3,
	input[1:0] genericF,
	output reg[31:0] genericOutput
	);

always@(*)begin
	case(genericF)
		2'b00: genericOutput = genericValue2; 
		2'b01: genericOutput = genericValue1;
		2'b10: genericOutput = genericValue3;
		default: genericOutput = genericValue2;
	endcase
end

endmodule
