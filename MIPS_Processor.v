/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: MIPS_Processor.v
--
-- Description: Synthesizable on a Altera Cyclone V FPGA. Supports  
-- many MIPS instructions. Currently, this is a single-cycle 
-- implementation.
-----------------------------------------------------------------*/

module MIPS_Processor(
	input[9:0] SW,
	input[3:0] KEY,
	input CLOCK_50,
	output[9:0] LEDR,
	output[7:0] HEX0,
	output[7:0] HEX1,
	output[7:0] HEX2,
	output[7:0] HEX3,
	output[7:0] HEX4,
	output[7:0] HEX5
	);

//assign LEDR = SW;


//assign reset = KEY[0];
//******************CLOCK**********************//
//assign clock = CLOCK_50;

//******************PROGRAM LOADER**********************//
//outputs
wire[31:0] wirePC;

//******************IF**********************//

//outputs
wire[31:0] incrPC;
wire[31:0] fullInstruction;

//******************CONTROL_BLOCK***********//

//outputs
wire regWriteF;
wire jumpF, branchF, jumpRF;
wire memReadF, memWriteF;
wire[1:0] memToRegF, regDestF;
wire ALUSrcF;
wire[1:0] ALUOpF;


reg programFinished, startLoading, programStart;
wire programLoaded;
wire START, EXECUTE, RESET;
assign RESET = SW[0];
assign START = SW[1];
assign EXECUTE = SW[2];
reg[3:0] FUTURE_SYSTEM_STATE;

//******************ID**********************//

//outputs
wire[5:0] opcodeToALU;
wire[31:0] outRegA;
wire[31:0] outRegB;
wire[31:0] extendedImmediate;
wire[25:0] target;

//******************EX**********************//

//outputs
wire[31:0] ALUResult;

//******************MEM*********************//

//outputs
wire[31:0] readData;

//******************WB**********************//

//outputs
wire[31:0] writeData;


reg[7:0] led_HEX_0;
reg[7:0] led_HEX_1;
reg[7:0] led_HEX_2;
reg[7:0] led_HEX_3;
reg[7:0] led_HEX_4;
reg[7:0] led_HEX_5;

//****************ASSIGNMENTS****************//
//Seperate from processor, for 7-Segment Output on Cyclone V
LED_7seg led_7SEG_HEX0(
		.BCD(led_HEX_0),
		.segA(HEX0[0]),
		.segB(HEX0[1]),
		.segC(HEX0[2]),
		.segD(HEX0[3]),
		.segE(HEX0[4]),
		.segF(HEX0[5]),
		.segG(HEX0[6]),
		.segDP(HEX0[7])
	);
LED_7seg led_7SEG_HEX1(
		.BCD(led_HEX_1),
		.segA(HEX1[0]),
		.segB(HEX1[1]),
		.segC(HEX1[2]),
		.segD(HEX1[3]),
		.segE(HEX1[4]),
		.segF(HEX1[5]),
		.segG(HEX1[6]),
		.segDP(HEX1[7])
	);
LED_7seg led_7SEG_HEX2(
		.BCD(led_HEX_2),
		.segA(HEX2[0]),
		.segB(HEX2[1]),
		.segC(HEX2[2]),
		.segD(HEX2[3]),
		.segE(HEX2[4]),
		.segF(HEX2[5]),
		.segG(HEX2[6]),
		.segDP(HEX2[7])
	);
LED_7seg led_7SEG_HEX3(
		.BCD(led_HEX_3),
		.segA(HEX3[0]),
		.segB(HEX3[1]),
		.segC(HEX3[2]),
		.segD(HEX3[3]),
		.segE(HEX3[4]),
		.segF(HEX3[5]),
		.segG(HEX3[6]),
		.segDP(HEX3[7])
	);
LED_7seg led_7SEG_HEX4(
		.BCD(led_HEX_4),
		.segA(HEX4[0]),
		.segB(HEX4[1]),
		.segC(HEX4[2]),
		.segD(HEX4[3]),
		.segE(HEX4[4]),
		.segF(HEX4[5]),
		.segG(HEX4[6]),
		.segDP(HEX4[7])
	);
LED_7seg led_7SEG_HEX5(
		.BCD(led_HEX_5),
		.segA(HEX5[0]),
		.segB(HEX5[1]),
		.segC(HEX5[2]),
		.segD(HEX5[3]),
		.segE(HEX5[4]),
		.segF(HEX5[5]),
		.segG(HEX5[6]),
		.segDP(HEX5[7])
	);

wire[3:0] hundreds, tens, ones;
wire[7:0] number;


bcd bcd1(
	.number(number),
	.hundreds(hundreds),
	.tens(tens),
	.ones(ones)
	);


parameter[3:0] PROGRAMLOADING   = 4'b00_00,
			   PROGRAMLOADED    = 4'b00_01,
			   PROGRAMEXECUTING = 4'b01_00,
			   PROGRAMFINISHED  = 4'b10_00;

reg[3:0] SYSTEM_STATE = PROGRAMLOADING; 


always@(posedge CLOCK_50)begin
	SYSTEM_STATE = FUTURE_SYSTEM_STATE;
	//RESET = 0;
	if(RESET == 1)begin
		SYSTEM_STATE = PROGRAMLOADING;
		// START = 0;
		// EXECUTE = 0;
		// RESET = 0;
	end
	else begin
	case(SYSTEM_STATE)
		PROGRAMLOADING: begin //print out LP load program
			programFinished = 0;
			led_HEX_0 = 4'ha;
			led_HEX_1 = 4'ha;
			led_HEX_2 = 4'ha;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hb;
			led_HEX_5 = 4'hc;

		if(START == 1)begin
			startLoading = 1;
			programStart = 0;
			programFinished = 0;
			if(programLoaded == 1)begin
				FUTURE_SYSTEM_STATE = PROGRAMLOADED;
				end
			end
		else begin
			FUTURE_SYSTEM_STATE = PROGRAMLOADING;
		end
		end
		PROGRAMLOADED: begin //print out PL program loaded
			led_HEX_0 = 4'ha;
			led_HEX_1 = 4'ha;
			led_HEX_2 = 4'ha;
			// led_HEX_0 = 4'ha;
			// led_HEX_1 = 4'ha;
			// led_HEX_2 = 4'ha;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hc;
			led_HEX_5 = 4'hb;
		if(EXECUTE == 1)begin
			programStart = 1;
			FUTURE_SYSTEM_STATE = PROGRAMEXECUTING;
		end else begin
			FUTURE_SYSTEM_STATE = PROGRAMLOADED;
		end
		end
		PROGRAMEXECUTING: begin //print out PE program executing
			// led_HEX_0 = 4'ha;
			// led_HEX_1 = 4'ha;
			// led_HEX_2 = 4'ha;
			led_HEX_0 = ones;
			led_HEX_1 = tens;
			led_HEX_2 = hundreds;
			led_HEX_3 = 4'hd;
			led_HEX_4 = 4'hd;
			led_HEX_5 = 4'hb;
			if(incrPC > 200 && SW[3])begin
				programFinished = 1;
				FUTURE_SYSTEM_STATE = PROGRAMFINISHED;
			end else begin
				FUTURE_SYSTEM_STATE = PROGRAMEXECUTING;
			end
		end
		PROGRAMFINISHED: begin //print out PF program finished and result from memory
			led_HEX_0 = ones;
			led_HEX_1 = tens;
			led_HEX_2 = hundreds;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hf;
			led_HEX_5 = 4'hb;
			FUTURE_SYSTEM_STATE = PROGRAMFINISHED;
		end
		default: begin
			FUTURE_SYSTEM_STATE = PROGRAMLOADING;
		end
	endcase
	end
end

// reg[31:0] temp_incrPC = 0;
wire[31:0] PC;

//always begin
// 	#100 temp_incrPC = wirePC;
// 	//temp_incrPC = IF_Control1.incrPC;

// end

IF_Control IF_Control1(
	.reset(SW[1]),
	.toPC(wirePC),
	.startProgramLoading(startLoading),
	.programStart(programStart),
	.programLoaded(programLoaded),
	.programFinished(programFinished),
	.incrPC(incrPC),
	.clock(CLOCK_50),
	.fullInstruction(fullInstruction)
	);


//assign PC = (programLoaded) ? temp_incrPC : 0;

Main_Control_Unit Main_Control_Unit1(
	.controlOpcode(fullInstruction[31:26]),
	.lowerOpcode(fullInstruction[5:0]),
	.clock(CLOCK_50),
	.regDestF(regDestF),
	.jumpF(jumpF),
	.jumpRF(jumpRF),
	.branchF(branchF),
	.memReadF(memReadF),
	.memToRegF(memToRegF),
	.memWriteF(memWriteF),
	.regWriteF(regWriteF),
	.ALUSrcF(ALUSrcF),
	.ALUOpF(ALUOpF)
	);

ID_Control ID_Control1(
	.fullInstruction(fullInstruction),
	.writeData(writeData),
	.regWriteF(regWriteF),
	.regDestF(regDestF),
	.clock(CLOCK_50),
	.opcodeToALU(opcodeToALU),
	.outRegA(outRegA),
	.outRegB(outRegB),
	//.finalAnswer(number),
	.extendedImmediate(extendedImmediate),
	.target(target)
	);

EX_Control EX_Control1(
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
	.jumpRF(jumpRF),
	.toPC(wirePC),
	.ALUResult(ALUResult)
	);
	
	//assign PC = wirePC;

MEM_Control MEM_Control1(
	.ALUResult(ALUResult),
	.outRegB(outRegB),
	.memReadF(memReadF),
	.memWriteF(memWriteF),
	.clock(CLOCK_50),
	.readData(readData),
	.finalAnswer(number)
	);

WB_Control WB_Control1(
	.ALUResult(ALUResult),
	.readData(readData),
	.incrPC(incrPC),
	.memToRegF(memToRegF),
	.writeData(writeData)
	);


endmodule