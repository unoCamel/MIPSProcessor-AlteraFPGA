/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: WB_Control.v
--
-----------------------------------------------------------------*/

module WB_Control(
	input[31:0] ALUResult,
	input[31:0] readData,
	input[31:0] incrPC,
	input[1:0] memToRegF,
	output[31:0] writeData
	);

Mux_3to1 WBMUX(
	.genericValue1(readData),
	.genericValue2(ALUResult),
	.genericValue3(incrPC),
	.genericF(memToRegF),
	.genericOutput(writeData)
	);




endmodule