/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: State_Machine.v
--
-- Description: Synthesizable on a Altera Cyclone V FPGA. Supports  
-- many MIPS instructions. Currently, this is a single-cycle 
-- implementation.
-----------------------------------------------------------------*/

module State_Machine(
	input START, EXECUTE, RESET,
	input[31:0] incrPC,
	input[7:0] number,
	input programLoaded,
	output[7:0] HEX_0,
	output[7:0] HEX_1,
	output[7:0] HEX_2,
	output[7:0] HEX_3,
	output[7:0] HEX_4,
	output[7:0] HEX_5,
	output reg startLoading,
	output reg programStart,
	output reg programFinished
);

wire[3:0] hundreds, tens, ones;


reg[7:0] led_HEX_0;
reg[7:0] led_HEX_1;
reg[7:0] led_HEX_2;
reg[7:0] led_HEX_3;
reg[7:0] led_HEX_4;
reg[7:0] led_HEX_5;

parameter[3:0] PROGRAMLOADING   = 4'b00_00,
			   PROGRAMLOADED    = 4'b00_01,
			   PROGRAMEXECUTING = 4'b01_00,
			   PROGRAMFINISHED  = 4'b10_00;

reg[3:0] FUTURE_SYSTEM_STATE; 
reg[3:0] SYSTEM_STATE; 

always@(*)begin
	if(RESET == 1)begin
		SYSTEM_STATE = PROGRAMLOADING;
	end
	else begin
		SYSTEM_STATE = FUTURE_SYSTEM_STATE;		
	end
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
		end
		PROGRAMLOADED: begin //print out PL program loaded
			led_HEX_0 = 4'ha;
			led_HEX_1 = 4'ha;
			led_HEX_2 = 4'ha;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hc;
			led_HEX_5 = 4'hb;
		if(EXECUTE == 1)begin
			programStart = 1;
			FUTURE_SYSTEM_STATE = PROGRAMEXECUTING;
		end
		end
		PROGRAMEXECUTING: begin //print out PE program executing
			led_HEX_0 = 4'ha;
			led_HEX_1 = 4'ha;
			led_HEX_2 = 4'ha;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hd;
			led_HEX_5 = 4'hb;
			if(incrPC > 172)begin
				programFinished = 1;
				FUTURE_SYSTEM_STATE = PROGRAMFINISHED;
			end
		end
		PROGRAMFINISHED: begin //print out PF program finished and result from $t0
			led_HEX_0 = ones;
			led_HEX_1 = tens;
			led_HEX_2 = hundreds;
			led_HEX_3 = 4'ha;
			led_HEX_4 = 4'hf;
			led_HEX_5 = 4'hb;

		end
	endcase
end

bcd bcd1(
	.number(number),
	.hundreds(hundreds),
	.tens(tens),
	.ones(ones)
	);

LED_7seg led_7SEG_HEX_0(
		.BCD(led_HEX_0),
		.segA(HEX_0[0]),
		.segB(HEX_0[1]),
		.segC(HEX_0[2]),
		.segD(HEX_0[3]),
		.segE(HEX_0[4]),
		.segF(HEX_0[5]),
		.segG(HEX_0[6]),
		.segDP(HEX_0[7])
	);
LED_7seg led_7SEG_HEX_1(
		.BCD(led_HEX_1),
		.segA(HEX_1[0]),
		.segB(HEX_1[1]),
		.segC(HEX_1[2]),
		.segD(HEX_1[3]),
		.segE(HEX_1[4]),
		.segF(HEX_1[5]),
		.segG(HEX_1[6]),
		.segDP(HEX_1[7])
	);
LED_7seg led_7SEG_HEX_2(
		.BCD(led_HEX_2),
		.segA(HEX_2[0]),
		.segB(HEX_2[1]),
		.segC(HEX_2[2]),
		.segD(HEX_2[3]),
		.segE(HEX_2[4]),
		.segF(HEX_2[5]),
		.segG(HEX_2[6]),
		.segDP(HEX_2[7])
	);
LED_7seg led_7SEG_HEX_3(
		.BCD(led_HEX_3),
		.segA(HEX_3[0]),
		.segB(HEX_3[1]),
		.segC(HEX_3[2]),
		.segD(HEX_3[3]),
		.segE(HEX_3[4]),
		.segF(HEX_3[5]),
		.segG(HEX_3[6]),
		.segDP(HEX_3[7])
	);
LED_7seg led_7SEG_HEX_4(
		.BCD(led_HEX_4),
		.segA(HEX_4[0]),
		.segB(HEX_4[1]),
		.segC(HEX_4[2]),
		.segD(HEX_4[3]),
		.segE(HEX_4[4]),
		.segF(HEX_4[5]),
		.segG(HEX_4[6]),
		.segDP(HEX_4[7])
	);
LED_7seg led_7SEG_HEX_5(
		.BCD(led_HEX_5),
		.segA(HEX_5[0]),
		.segB(HEX_5[1]),
		.segC(HEX_5[2]),
		.segD(HEX_5[3]),
		.segE(HEX_5[4]),
		.segF(HEX_5[5]),
		.segG(HEX_5[6]),
		.segDP(HEX_5[7])
	);

endmodule