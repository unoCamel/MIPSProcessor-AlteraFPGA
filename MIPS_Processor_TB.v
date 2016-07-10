/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: MIPS_Processor_TB.v
--
-----------------------------------------------------------------*/

module MIPS_Processor_TB;
	reg clock;
	reg[31:0] PC;
	reg[9:0] SW;
	reg[3:0] KEY;
	wire[9:0] LEDR;
	wire[7:0] HEX0;
	wire[7:0] HEX1;
	wire[7:0] HEX2;
	wire[7:0] HEX3;
	wire[7:0] HEX4;
	wire[7:0] HEX5;
	reg CYCLES;
	integer i; 


	MIPS_Processor uut(
		.SW(SW),
		.KEY(KEY),
		.CLOCK_50(clock),
		//.PC(PC),
		.LEDR(LEDR),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5)
	);

	task PrintValues;
		begin	
			#100 //$display("writeData(%b) Reg9(%b) Reg12(%b) \n reset(%b) PL(%b) reg13(%b) reg14(%b) \n fullInstruction(%b)", uut.WB_Control1.writeData, uut.ID_Control1.Registers1.registerFile[9],
						 //uut.ID_Control1.Registers1.registerFile[12], uut.IF_Control1.reset, uut.IF_Control1.programLoaded, uut.ID_Control1.Registers1.registerFile[13], uut.ID_Control1.Registers1.registerFile[14],
						//  uut.IF_Control1.fullInstruction);
			$display("writeData(%d) isntr(%b)", uut.WB_Control1.writeData, uut.fullInstruction);
			$display("cOpCode(%b) aOpcode(%b) ALUResult(%d)", uut.Main_Control_Unit1.controlOpcode, uut.EX_Control1.ALUControlOpcode, uut.EX_Control1.ALUResult);
			$display("PC: wirePC(%d) incrPC(%d) toPC(%d) fromPC(%d)", uut.wirePC, uut.incrPC, uut.EX_Control1.toPC, uut.IF_Control1.fromPC);
			$display("MUX: branchResult(%d) newWire(%d) shiftedTarget(%d) target(%d)", uut.EX_Control1.branchResult, uut.EX_Control1.newWire, uut.EX_Control1.shiftedTarget, uut.EX_Control1.target);
			$display("REG:inRegA(%b) inRegB(%b) outRegA(%d) outRegB(%d)", uut.ID_Control1.Registers1.inRegA, uut.ID_Control1.Registers1.inRegB, uut.ID_Control1.Registers1.outRegA, uut.ID_Control1.Registers1.outRegB);
			$display("ALU:outRegA(%d) outRegB(%d) OP(%b)", uut.EX_Control1.ALU1.outRegA, uut.EX_Control1.ALU1.outRegB, uut.EX_Control1.ALU1.ALUControlOpcode);
			$display("EXImmediate(%d) afterMUX(%d)", uut.EX_Control1.extendedImmediate, uut.EX_Control1.postALUMUX);			
			$display("Flags: zeroF(%b) branchF(%b) jumpF(%b) jumpRF(%b) regWriteF(%b) regDestF(%b) PL(%b) PF(%b)", uut.EX_Control1.ALU1.zeroF, uut.EX_Control1.branchF, uut.EX_Control1.jumpF, uut.EX_Control1.jumpRF, uut.Main_Control_Unit1.regWriteF, uut.Main_Control_Unit1.regDestF, uut.IF_Control1.programLoaded, uut.programFinished);			
			$display("$ra(%d) $sp(%d) $fp(%d) $0(%d)", uut.ID_Control1.Registers1.registerFile[31], uut.ID_Control1.Registers1.registerFile[29], uut.ID_Control1.Registers1.registerFile[30], uut.ID_Control1.Registers1.registerFile[0]);
			$display("$so(%d) $s1(%d) $s2(%d)", uut.ID_Control1.Registers1.registerFile[16], uut.ID_Control1.Registers1.registerFile[17], uut.ID_Control1.Registers1.registerFile[18]);
			$display("$t0(%d) $t1(%d) $t2(%d) $t3(%d)", uut.ID_Control1.Registers1.registerFile[8], uut.ID_Control1.Registers1.registerFile[9], uut.ID_Control1.Registers1.registerFile[10], uut.ID_Control1.Registers1.registerFile[11]);	
			$display("STATE(%b) START(%b) EXECUTE(%b) programStart(%b) programFinished(%b)", uut.SYSTEM_STATE, uut.START, uut.EXECUTE, uut.programStart, uut.programFinished);
			$display("FinalAnswer(%d), h(%d)t(%d)o(%d)", uut.number, uut.hundreds, uut.tens, uut.ones);
			$display("\n\t\t\tREADING FROM MEMORY\n");
			for(i=0; i<=300; i=i+1) begin 
				if(uut.MEM_Control1.Data_Memory1.DATA_RAM[i] != 0) begin
					$display("MEMORY(%d) = (%d)", i, uut.MEM_Control1.Data_Memory1.DATA_RAM[i]);				
				end
			end
			$display("END CYCLE----------------------------------------------------------------------------------------------------------------------\n");
		end

	endtask
	
	initial begin 
	$display("-------------------------------------------");
	$display("Initializing values for... the whole processor");
	$display("-------------------------------------------");
	//uut.Instruction_Memory1.InstMem[0]=2**2;
	SW[0] = 1;
	SW[1] = 1;
	clock = 0;
	PC = 0;
	#100; //reset finished
	SW[0] = 0;
	//KEY[1] = 0;
	SW[3] = 1;
	SW[2] = 1;
	//uut.ID_Control1.Registers1.registerFile[10] = 0;
	//uut.ID_Control1.Registers1.registerFile[9] = 0;
//uut.ID_Control1.Registers1.registerFile[9]
	//uut.ID_Control1.Registers1.registerFile[9] = 6;
//	uut.ID_Control1.Registers1.registerFile[10] = 4;

	//uut.MIPS_Processor.PC = 0;

	end

	always begin

		#50 clock = !clock;
		//PrintValues;
	end

	// always begin
	// 	#100 uut.temp_incrPC = uut.wirePC;
	// 	uut.temp_incrPC = uut.IF_Control1.incrPC;

	// end


	initial begin
	//#10 %display(programLoaded(
	PrintValues; //0
	end

	//always begin
//		if(uut.incrPC == 172) begin
//			PrintValues;
//			$stop;
//		end
//	end

always begin

#100 if(uut.MEM_Control1.Data_Memory1.DATA_RAM[36] == 144) begin
PrintValues;
#100 $stop;
end

	end
endmodule