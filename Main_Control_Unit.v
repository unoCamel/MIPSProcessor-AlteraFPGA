/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Main_Control_Unit.v
--
-----------------------------------------------------------------*/


module Main_Control_Unit(
	input[5:0] controlOpcode,
	input[5:0] lowerOpcode,
	input clock,
	output reg[1:0] regDestF,
	output reg jumpF,
	output reg jumpRF,
	output reg branchF,
	output reg memReadF,
	output reg[1:0] memToRegF,
	output reg memWriteF,
	output reg regWriteF,
	output reg ALUSrcF,
	output reg[1:0] ALUOpF
	);


parameter[5:0] 		RFORMAT = 6'b00_00_00,
					LW      = 6'b10_00_11,
					SW      = 6'b10_10_11,
					BEQ     = 6'b00_01_00,
					BNE     = 6'b00_01_01,
					JUMP    = 6'b00_00_10,
					JAL		= 6'b00_00_11,
					JR		= 6'b00_10_00,
					ADDI    = 6'b00_10_00;

always@(*)begin
	
	case(controlOpcode)
		RFORMAT: begin 
			if(lowerOpcode == JR) begin
				 regDestF  <= 2'bxx;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'bxx;
				 regWriteF <= 0;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 jumpF 	   <= 0;
				 jumpRF	   <= 1;
				 ALUOpF    <= 2'bxx;
				 end
			else begin
				 regDestF  <= 2'b01;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'b00;
				 regWriteF <= 1;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b10;
				 end
			end	
		LW: begin 
				 regDestF  <= 2'b00;
				 ALUSrcF   <= 1;
				 memToRegF <= 2'b01;
				 regWriteF <= 1;
				 memReadF  <= 1;
				 memWriteF <= 0;
				 branchF   <= 0;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b00;
				 end
		SW: begin 
				 regDestF  <= 2'b00;
				 ALUSrcF   <= 1;
				 memToRegF <= 2'b00; //changed from 01
				 regWriteF <= 0;
				 memReadF  <= 0;
				 memWriteF <= 1;
				 branchF   <= 0;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b00;
				 end
		BEQ: begin 
				 regDestF  <= 2'bxx;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'bxx;
				 regWriteF <= 0;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 1;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b01;
				 end
		BNE: begin 
				 regDestF  <= 2'bxx;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'bxx;
				 regWriteF <= 0;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 1;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b11;
				 end
		JUMP: begin 
				 regDestF  <= 2'bxx;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'bxx;
				 regWriteF <= 0;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 ALUOpF    <= 2'b10;
				 jumpF 	   <= 1;
				 jumpRF	   <= 0;
				 end
		JAL: begin 
				 regDestF  <= 2'b10;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'b10;
				 regWriteF <= 1;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 ALUOpF    <= 2'bxx;
				 jumpF 	   <= 1;
				 jumpRF	   <= 0;
				 end
		ADDI: begin 
				 regDestF  <= 2'b00;
				 ALUSrcF   <= 1;
				 memToRegF <= 2'b00;
				 regWriteF <= 1;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 ALUOpF    <= 2'b00;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 end			
		default: begin 
				 regDestF  <= 2'b01;
				 ALUSrcF   <= 0;
				 memToRegF <= 2'b00;
				 regWriteF <= 1;
				 memReadF  <= 0;
				 memWriteF <= 0;
				 branchF   <= 0;
				 jumpF 	   <= 0;
				 jumpRF	   <= 0;
				 ALUOpF    <= 2'b10; //This should never hit, and will not exist in ALU
				 end

	endcase


end

endmodule