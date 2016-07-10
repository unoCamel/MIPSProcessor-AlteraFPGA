/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: IF_Control_TB.v
--
-----------------------------------------------------------------*/

module IF_Control_TB;
	reg[31:0] toPC;
	reg clock, programLoaded;
	wire[31:0] incrPC;
	wire[31:0] fullInstruction;
	
	IF_Control uut(
		.toPC(toPC),
		.incrPC(incrPC),
		.clock(clock),
		.fullInstruction(fullInstruction)
	);
	
	always begin
	#1 clock = !clock;
	end
	
	initial begin 
	$display("-------------------------------------------");
	$display("Initializing values!!!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	//uut.Instruction_Memory1.InstMem[0]=2**2;
	toPC = 0;
	clock = 0;
	uut.Instruction_Memory1.programLoaded = 0;
	end

	initial begin
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	#2 $display("toPC(%b) incrPC(%b), fullInstruction(%b) programLoaded(%b)", toPC, incrPC, fullInstruction, uut.Instruction_Memory1.programLoaded);
	end
endmodule