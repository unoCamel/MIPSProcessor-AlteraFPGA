/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: EX_Control_TB.v
--
-----------------------------------------------------------------*/

module EX_Control_TB;
	reg[31:0] incrPC;
	reg[31:0] outRegA;
	reg[31:0] outRegB;
	reg[31:0] extendedImmediate;
	reg[31:0] target; //32 or 26
	reg[5:0] opcodeToALU;
	reg[1:0] ALUOpF;
	reg ALUSrcF;
	reg branchF;
	reg jumpF;
	wire[31:0] toPC;
	wire[31:0] ALUResult;

	EX_Control uut(
		.incrPC(incrPC),
		.outRegA(outRegA),
		.outRegB(outRegB),
		.extendedImmediate(extendedImmediate),
		.target(target),
		.opcodeToALU(opcodeToALU),
		.ALUOpF(ALUOpF),
		.ALUSrcF(ALUSrcF),
		.branchF(branchF),
		.jumpF(jumpF),
		.toPC(toPC),
		.ALUResult(ALUResult)
	);

	
	initial begin 
	$display("-------------------------------------------");
	$display("Initializing values for EX Stage");
	$display("-------------------------------------------");
	//uut.Instruction_Memory1.InstMem[0]=2**2;
	incrPC = 0;
	outRegA = 0;
	outRegB = 0;
	extendedImmediate = 0;
	target = 0;
	opcodeToALU = 0;
	ALUOpF = 0;
	ALUSrcF = 0;
	branchF = 0;
	jumpF = 0;
	end

	initial begin
	#2 $display("ALUOpF(%b) ALUSrcF(%b), branchF(%b) jumpF(%b), opcodeToALU(%b)", ALUOpF, ALUSrcF, branchF, jumpF, opcodeToALU);
	$display("-> incrPC(%b) outRegA(%b), outRegB(%b) extendedImmediate(%b) target(%b)", incrPC, outRegA, outRegB, extendedImmediate, target);
	$display("-> toPC(%b) ALUResult(%b)", toPC, ALUResult);
	$display("-------------------------------------------");
	outRegA = 32'b0000_0000_0000_0000_0000_0000_0000_0011; // 3
	outRegB = 32'b0000_0000_0000_0000_0000_0000_0000_1000; // 8
	extendedImmediate = 32'b0000_0000_0000_0000_0000_0000_0010_0000; //add r1 r2 r3
	opcodeToALU = 6'b10_00_00;
	target = 26'b00_0000_0000_0000_0000_0010_0000;
	incrPC = 32'b0000_0000_0000_0000_0000_0000_0000_0100; //4
	ALUOpF = 2'b10;
	#2 $display("ALUOpF(%b) ALUSrcF(%b), branchF(%b) jumpF(%b), opcodeToALU(%b)", ALUOpF, ALUSrcF, branchF, jumpF, opcodeToALU);
	$display("-> incrPC(%b) outRegA(%b), outRegB(%b) extendedImmediate(%b) target(%b)", incrPC, outRegA, outRegB, extendedImmediate, target);
	$display("-> toPC(%b) ALUResult(%b)", toPC, ALUResult);
	$display("-------------------------------------------");
	extendedImmediate = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
	opcodeToALU = 6'b00_01_00;
	outRegA = 32'b0000_0000_0000_0000_0000_0000_0000_0011; // 3
	target = 26'b00_0000_0000_0000_0000_0000_0100;
	ALUOpF = 2'b01;
	branchF = 1; // bez 3 3
	#2 $display("ALUOpF(%b) ALUSrcF(%b), branchF(%b) jumpF(%b), opcodeToALU(%b)", ALUOpF, ALUSrcF, branchF, jumpF, opcodeToALU);
	$display("-> incrPC(%b) outRegA(%b), outRegB(%b) extendedImmediate(%b) target(%b)", incrPC, outRegA, outRegB, extendedImmediate, target);
	$display("-> toPC(%b) ALUResult(%b)", toPC, ALUResult);
	$display("-------------------------------------------");
	extendedImmediate = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
	opcodeToALU = 6'b00_01_00;
	outRegA = 32'b0000_0000_0000_0000_0000_0000_0000_1000; // 8
	target = 26'b00_0000_0000_0000_0000_0000_0100; //branching
	ALUOpF = 2'b01;
	branchF = 1;
	#2 $display("ALUOpF(%b) ALUSrcF(%b), branchF(%b) jumpF(%b), opcodeToALU(%b)", ALUOpF, ALUSrcF, branchF, jumpF, opcodeToALU);
	$display("-> incrPC(%b) outRegA(%b), outRegB(%b) extendedImmediate(%b) target(%b)", incrPC, outRegA, outRegB, extendedImmediate, target);
	$display("-> toPC(%b) ALUResult(%b)", toPC, ALUResult);
	$display("-------------------------------------------");
	branchF = 0;
	jumpF = 1;
	extendedImmediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100;
	opcodeToALU = 6'b00_11_00;
	target = 26'b00_0000_0000_0000_0000_0000_1110; //jump 52 //answer should be 4 more for whenever you started
	ALUOpF = 2'b01;
	#2 $display("ALUOpF(%b) ALUSrcF(%b), branchF(%b) jumpF(%b), opcodeToALU(%b)", ALUOpF, ALUSrcF, branchF, jumpF, opcodeToALU);
	$display("-> incrPC(%b) outRegA(%b), outRegB(%b) extendedImmediate(%b) target(%b)", incrPC, outRegA, outRegB, extendedImmediate, target);
	$display("-> toPC(%b) ALUResult(%b)", toPC, ALUResult);
	$display("-------------------------------------------");
	
	
	end
endmodule