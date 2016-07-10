/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: IF_Control.v
--
-----------------------------------------------------------------*/

module IF_Control(
	input reset,
	input startProgramLoading,
	input programStart,
	input programFinished,
	input[31:0] toPC,
	input clock,
	output[31:0] incrPC,
	output[31:0] fullInstruction,
	output programLoaded
	);
	//wire programLoaded;
	wire[31:0] resetPC; //make sure works
	//wire programLoaded;
	wire[31:0] fromPC;
	

ProgramCounter ProgramCounter1(
	.toPC(toPC),
	.clock(clock),
	//.programFinished(programFinished),
	.reset(reset),
	.fromPC(fromPC)
	);
	
Instruction_Memory Instruction_Memory1(
	.fromPC(fromPC),
	.resetPC(resetPC),
	.startProgramLoading(startProgramLoading),
	.reset(reset),
	.clock(clock),
	.fullInstruction(fullInstruction),
	.programLoaded(programLoaded)
	);

PC_Adder PC_Adder1(
	.fromPC(resetPC),
	.programLoaded(programLoaded),
	.programStart(programStart),
	.incrPC(incrPC)
	);

endmodule
