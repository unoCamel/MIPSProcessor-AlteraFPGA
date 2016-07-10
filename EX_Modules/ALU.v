/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: ALU.v
--
-----------------------------------------------------------------*/

module ALU(
	input[31:0] outRegA,
	input[31:0] outRegB,
	input[5:0] ALUControlOpcode,

	output reg[31:0] ALUResult,
	output reg zeroF
	);
/*
SUPPORTS:
-AND
-OR
-ADD
-ADDI
-SUB
-SLT
-XOR
-BEQ
-BNE
-LW test
-SW test
-J
-JAL
JR
*/
wire signed [31:0] A_signed, B_signed;
assign A_signed = outRegA;
assign B_signed = outRegB;


always@(*)begin
	case(ALUControlOpcode)
	6'b10_01_00: ALUResult = outRegA & outRegB; //AND
	6'b10_01_01: ALUResult = outRegA | outRegB; //OR
	6'b10_00_00: ALUResult = A_signed + B_signed; //ADD
	6'b10_00_10: ALUResult = outRegA - outRegB; //SUB
	6'b10_10_10: begin //slt
             		if(A_signed < B_signed) ALUResult = 1;
            		else ALUResult = 0;
          		end


	//ALUResult = (outRegA < outRegB) ? 1:0; //SLT
	6'b10_01_11: ALUResult = ~(outRegA | outRegB); //XOR
	6'b00_01_01: begin //bne
					if(A_signed == B_signed) begin
					ALUResult = 0;
					zeroF = 1;
					end
					else begin 
					ALUResult = 1;
					zeroF = 0;
					end
				end
	//{carryF, ALUResult} = {1'b0, outRegA} - {1'b0, outRegB}; //SUB
	// begin
 //             		if(A_signed < B_signed) ALUResult = 1;
 //            		else ALUResult = 0;
 //          		end
	default: begin
	zeroF = 0;
	ALUResult = 0;
	end
	endcase
	if(ALUResult == 0) zeroF = 1;
	else zeroF = 0;
	
end

endmodule