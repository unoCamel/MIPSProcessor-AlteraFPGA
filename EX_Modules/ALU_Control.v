/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: ALU_Control.v
--
-----------------------------------------------------------------*/

module ALU_Control(
	input[5:0] opcodeToALU,
	input[1:0] ALUOpF,
	output reg[5:0] ALUControlOpcode
	);

	always@(*)begin
		case(ALUOpF)
			2'b00: ALUControlOpcode = 6'b10_00_00;
			2'b01: ALUControlOpcode = 6'b10_00_10;
			2'b11: ALUControlOpcode = 6'b00_01_01;
			2'b10: ALUControlOpcode = opcodeToALU;
			default: ALUControlOpcode = 0;
		endcase
	end

endmodule