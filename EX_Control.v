/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: EX_Control.v
--
-----------------------------------------------------------------*/

module EX_Control(
	input[31:0] incrPC,
	input[31:0] outRegA,
	input[31:0] outRegB,
	input[31:0] extendedImmediate,
	input[25:0] target,
	input[5:0] opcodeToALU,
	input[1:0] ALUOpF,
	input ALUSrcF,
	input branchF,
	input jumpF,
	input jumpRF,
	output[31:0] toPC,
	output[31:0] ALUResult
	); 

//Temp Flags
wire zeroF;
//Reroute Later

//temp wires
wire[31:0] shiftedExtendedImmediate;
wire[27:0] shiftedTarget;

wire[31:0] addPCResult;
wire[31:0] branchResult;

wire[31:0] postALUMUX;

wire[31:0] newWire;
wire[31:0] toJumpR;

wire[5:0] ALUControlOpcode;


Mux_2to1 ALUMUX(
	.genericValue1(extendedImmediate),
	.genericValue2(outRegB),
	.genericF(ALUSrcF),
	.genericOutput(postALUMUX)
	);

Shift_Left2_Small shiftTargetMod(
	.genericInput(target),
	.shiftedGenericOutput(shiftedTarget)
	);

assign newWire = {incrPC[31:28], shiftedTarget}; 

Shift_Left2 shiftImmediateMod(
	.genericInput(extendedImmediate),
	.shiftedGenericOutput(shiftedExtendedImmediate)
	);

ALU_Control ALU_Control1(
	.opcodeToALU(opcodeToALU),
	.ALUOpF(ALUOpF),
	.ALUControlOpcode(ALUControlOpcode)
	);

ALU ALU1(
	.outRegA(outRegA),
	.outRegB(postALUMUX),
	.ALUControlOpcode(ALUControlOpcode),
	.ALUResult(ALUResult),
	.zeroF(zeroF)
	);

PC_Jump_Adder PC_Jump_Adder1(
	.shiftedExtendedImmediate(shiftedExtendedImmediate),
	.incrPC(incrPC),
	.addPCResult(addPCResult)
	);

Mux_2to1 branchMUX(
	.genericValue1(addPCResult),
	.genericValue2(incrPC),
	.genericF(branchF & ~zeroF),
	.genericOutput(branchResult)
	);

Mux_2to1 jumpMUX(
	.genericValue1(newWire),
	.genericValue2(branchResult),
	.genericF(jumpF),
	.genericOutput(toJumpR)
	);

Mux_2to1 jumpRMUX(
	.genericValue1(outRegA),
	.genericValue2(toJumpR),
	.genericF(jumpRF),
	.genericOutput(toPC)
	);

endmodule