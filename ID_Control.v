/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: ID_Control.v
--
-----------------------------------------------------------------*/

module ID_Control(
	input[31:0] fullInstruction, //to be split
	input regWriteF,
	input[1:0] regDestF,
	input[31:0] writeData,
	input clock,
	output[5:0] opcodeToALU,
	output[31:0] outRegA,
	output[31:0] outRegB,
	output[31:0] extendedImmediate,
	output[25:0] target
	// output[31:0] t0,
	// output[31:0] t1,
	// output[31:0] t3,
	// output[31:0] stacP

	//output[7:0] finalAnswer
	);

	wire[4:0] postIDMUX;

	assign opcodeToALU = fullInstruction[5:0];
	assign target = fullInstruction[25:0];

Mux_2to1_smallBit ID_MUX(
	.genericValue1(fullInstruction[15:11]),
	.genericValue2(fullInstruction[20:16]),
	.genericF(regDestF),
	.genericOutput(postIDMUX)
	);

Sign_Extend_16to32 extendImmediateMod(
	.immediate(fullInstruction[15:0]),
	.extendedImmediate(extendedImmediate)
	);


Registers Registers1(
	.regWriteF(regWriteF),
	.writeData(writeData),
	.inRegA(fullInstruction[25:21]),
	.inRegB(fullInstruction[20:16]),
	.writeReg(postIDMUX),
	.clock(clock),
	.outRegA(outRegA),
	.outRegB(outRegB)
	// .t0(t0),
	// .t1(t1),
	// .t3(t3),
	// .stacP(stacP)
	//.finalAnswer(finalAnswer)
	);


endmodule
