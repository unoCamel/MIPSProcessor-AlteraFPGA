/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Instruction_Memory.v
--
-----------------------------------------------------------------*/
module Instruction_Memory(
	input[31:0] fromPC,
	input clock,
	input reset,
	input startProgramLoading,
	output reg[31:0] fullInstruction,
	output reg programLoaded,
	output reg[31:0] resetPC
	);
	
	parameter numbInstructions = 46;
	reg[31:0] numberInstructionLoads = 0;
	reg[31:0] INSTR_RAM [0:numbInstructions*4];
	//HARDCODE INSTRUCTIONS
	//&& numberInstructionLoads != numbInstructions+1
	always@(posedge clock)begin
		case(numberInstructionLoads)
			0: begin
				if(startProgramLoading)begin
					programLoaded <= 0;
					//INSTR_RAM[0] <= 32'h21490006; //addi $9, $10, 6
					INSTR_RAM[0] <= 32'h201d0100; //fib
					//INSTR_RAM[0] <= 32'h201d0100;
					numberInstructionLoads <= numberInstructionLoads + 1;
					end
				else begin
					programLoaded <= 0;
				end
				end
			1: begin
				//INSTR_RAM[4] <= 32'h212c0004; // addi $12, $9, 4
				INSTR_RAM[4] <= 32'h2010000c; //fib 12
				//INSTR_RAM[4] <= 32'h200d0002;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			2: begin
				//INSTR_RAM[8] <= 32'h012c6820; //add $13, $9, $12
				INSTR_RAM[8] <= 32'hafb00000; //fib
				//INSTR_RAM[8] <= 32'h20040008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			3: begin
				//INSTR_RAM[12] <= 32'h152c000c; //bneq $12, $9, 52
				INSTR_RAM[12] <= 32'h23bdfffc;//fib
				//INSTR_RAM[12] <= 32'h0c000006;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			4: begin
				//INSTR_RAM[64] <= 32'h01ac7020;  //add $14, $13, $12
				INSTR_RAM[16] <= 32'h0c000009;//fib
				//INSTR_RAM[16] <= 32'h00409020;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			5: begin
				//INSTR_RAM[68] <= 32'h0c000012;  //jal 72
				INSTR_RAM[20] <= 32'h23bd0004;//fib
				//INSTR_RAM[20] <= 32'h0800001f;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			6: begin
				//INSTR_RAM[72] <= 32'h012c7820;  //add $15, $9, $12 
				INSTR_RAM[24] <= 32'h8fb10000; //fib
				//INSTR_RAM[24] <= 32'h23bdffec;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			7: begin
				//INSTR_RAM[76] <= 32'h03e00008;  //jr $31 
				INSTR_RAM[28] <= 32'hac110024;//fib
				//INSTR_RAM[28] <= 32'hafb00000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			8: begin
				INSTR_RAM[32] <= 32'h0800002b;
				//INSTR_RAM[32] <= 32'hafb10004;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			9: begin
				INSTR_RAM[36] <= 32'hafbf0000;
				//INSTR_RAM[36] <= 32'hafb20008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			10: begin
				INSTR_RAM[40] <= 32'h23bdfffc;
				//INSTR_RAM[40] <= 32'hafb3000c;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			11: begin
				INSTR_RAM[44] <= 32'hafbe0000;
				//INSTR_RAM[44] <= 32'hafbf0010;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			12: begin
				INSTR_RAM[48] <= 32'h23bdfffc;
				//INSTR_RAM[48] <= 32'h00808020;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			13: begin
				INSTR_RAM[52] <= 32'h23be000c;
				//INSTR_RAM[52] <= 32'h020d402a;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			14: begin
				INSTR_RAM[56] <= 32'h8fc80000;
				//INSTR_RAM[56] <= 32'h15000008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			15: begin
				INSTR_RAM[60] <= 32'h20090002;
				//INSTR_RAM[60] <= 32'h2204ffff;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			16: begin
				INSTR_RAM[64] <= 32'h00005820;
				//INSTR_RAM[64] <= 32'h0c000006;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			17: begin
				INSTR_RAM[68] <= 32'h0128582a;
				//INSTR_RAM[68] <= 32'h00409820;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			18: begin
				INSTR_RAM[72] <= 32'h15600002;
				//INSTR_RAM[72] <= 32'h2204fffe;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			19: begin
				INSTR_RAM[76] <= 32'h20080001;
				//INSTR_RAM[76] <= 32'h0c000006;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			20: begin
				INSTR_RAM[80] <= 32'h08000023;
				//INSTR_RAM[80] <= 32'h00409020;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			21: begin
				INSTR_RAM[84] <= 32'h2108ffff;
				//INSTR_RAM[84] <= 32'h2204fffe;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			22: begin
				INSTR_RAM[88] <= 32'hafa80000;
				//INSTR_RAM[88] <= 32'h02531020;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			23: begin
				INSTR_RAM[92] <= 32'h23bdfffc;
				//INSTR_RAM[92] <= 32'h08000018;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			24: begin
				INSTR_RAM[96] <= 32'h0c000009;
				//INSTR_RAM[96] <= 32'h20020001;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			25: begin
				INSTR_RAM[100] <= 32'h8fc80000;
				//INSTR_RAM[100] <= 32'h8fb00000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			26: begin
				INSTR_RAM[104] <= 32'h2108fffe;
				//INSTR_RAM[104] <= 32'h8fb10004;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			27: begin
				INSTR_RAM[108] <= 32'hafa80000;
				//INSTR_RAM[108] <= 32'h8fb20008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			28: begin
				INSTR_RAM[112] <= 32'h23bdfffc;
				///INSTR_RAM[112] <= 32'h8fb3000c;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			29: begin
				INSTR_RAM[116] <= 32'h0c000009;
				//INSTR_RAM[116] <= 32'h8fbf0010;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			30: begin
				INSTR_RAM[120] <= 32'h23bd0004;
				//INSTR_RAM[120] <= 32'h23bd0014;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			31: begin
				INSTR_RAM[124] <= 32'h8fa80000;
				//INSTR_RAM[124] <= 32'h03e00008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			32: begin
				INSTR_RAM[128] <= 32'h23bd0004;
				//INSTR_RAM[128] <= 32'h2002000a;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			33: begin
				INSTR_RAM[132] <= 32'h8fa90000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			34: begin
				INSTR_RAM[136] <= 32'h01094020;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			35: begin
				INSTR_RAM[140] <= 32'h23bd0004;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			36: begin
				INSTR_RAM[144] <= 32'h8fbe0000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			37: begin
				INSTR_RAM[148] <= 32'h23bd0004;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			38: begin
				INSTR_RAM[152] <= 32'h8fbf0000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			39: begin
				INSTR_RAM[156] <= 32'h23bd0004;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			40: begin
				INSTR_RAM[160] <= 32'hafa80000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			41: begin
				INSTR_RAM[164] <= 32'h23bdfffc;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			42: begin
				INSTR_RAM[168] <= 32'h03e00008;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			43: begin
				INSTR_RAM[172] <= 32'h200f0024;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			44: begin
				INSTR_RAM[176] <= 32'hade80000;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			45: begin
				INSTR_RAM[180] <= 32'h1408fffd;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			numbInstructions: begin
				programLoaded <= 1;
				resetPC <= 0;
				numberInstructionLoads <= numberInstructionLoads + 1;
				end
			default: begin
				programLoaded <= 1;
				resetPC <= fromPC;
				end
		endcase
	end
	
//wire[31:0] changePC;
//assign changePC = (programLoaded) ? toPC : initialPC;

	//always@(posedge clock)begin
	always@(negedge clock)begin

		if(programLoaded)begin
		fullInstruction = INSTR_RAM[resetPC];
		end

	end


	//initial INSTR_RAM[0] = 32'h012a4020;
	// FIBONACCI BINARY
//	initial INSTR_RAM[0] = 32'h201d0100;
//	initial INSTR_RAM[1] = 32'h2010000c;
//	initial INSTR_RAM[2] = 32'hafb00000;
//	initial INSTR_RAM[3] = 32'h23bdfffc;
//	initial INSTR_RAM[4] = 32'h0c000009;
//	initial INSTR_RAM[5] = 32'h23bd0004;
//	initial INSTR_RAM[6] = 32'h8fb10000;
//	initial INSTR_RAM[7] = 32'hac110024;
//	initial INSTR_RAM[8] = 32'h0800002b;
//	initial INSTR_RAM[9] = 32'hafbf0000;
//	initial INSTR_RAM[10] = 32'h23bdfffc;
//	initial INSTR_RAM[11] = 32'hafbe0000;
//	initial INSTR_RAM[12] = 32'h23bdfffc;
//	initial INSTR_RAM[13] = 32'h23be000c;
//	initial INSTR_RAM[14] = 32'h8fc80000;
//	initial INSTR_RAM[15] = 32'h20090002;
//	initial INSTR_RAM[16] = 32'h00005820;
//	initial INSTR_RAM[17] = 32'h0128582a;
//	initial INSTR_RAM[18] = 32'h15600002;
//	initial INSTR_RAM[19] = 32'h20080001;
//	initial INSTR_RAM[20] = 32'h08000023;
//	initial INSTR_RAM[21] = 32'h2108ffff;
//	initial INSTR_RAM[22] = 32'hafa80000;
//	initial INSTR_RAM[23] = 32'h23bdfffc;
//	initial INSTR_RAM[24] = 32'h0c000009;
//	initial INSTR_RAM[25] = 32'h8fc80000;
//	initial INSTR_RAM[26] = 32'h2108fffe;
//	initial INSTR_RAM[27] = 32'hafa80000;
//	initial INSTR_RAM[28] = 32'h23bdfffc;
//	initial INSTR_RAM[29] = 32'h0c000009;
//	initial INSTR_RAM[30] = 32'h23bd0004;
//	initial INSTR_RAM[31] = 32'h8fa80000;
//	initial INSTR_RAM[32] = 32'h23bd0004;
//	initial INSTR_RAM[33] = 32'h8fa90000;
//	initial INSTR_RAM[34] = 32'h01094020;
//	initial INSTR_RAM[35] = 32'h23bd0004;
//	initial INSTR_RAM[36] = 32'h8fbe0000;
//	initial INSTR_RAM[37] = 32'h23bd0004;
//	initial INSTR_RAM[38] = 32'h8fbf0000;
//	initial INSTR_RAM[39] = 32'h23bd0004;
//	initial INSTR_RAM[40] = 32'hafa80000;
//	initial INSTR_RAM[41] = 32'h23bdfffc;
//	initial INSTR_RAM[42] = 32'h03e00008;
//	initial INSTR_RAM[43] = 32'h20000000;

	//SIMPLE ADDITION MIPS BINARY
	// initial INSTR_RAM[0] = 32'h20000004;
	// initial INSTR_RAM[1] = 32'h20000006;
	// initial INSTR_RAM[2] = 32'h00000020;

	//END
	
endmodule