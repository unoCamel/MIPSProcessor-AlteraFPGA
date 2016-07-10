/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: PC_Adder.v
--
-----------------------------------------------------------------*/

module PC_Adder(
	input[31:0] fromPC,
	input programLoaded,
	input programStart,
	//input programFinished,
	output reg[31:0] incrPC
	);


always@(*)begin
	case(programLoaded)
		1'b0: incrPC = fromPC;
		1'b1: 
		//begin if(programFinished == 0)
				incrPC = fromPC + 4;
				//else if(programFinished)
				//	incrPC = fromPC;
				//end
		default: incrPC = fromPC + 100;

	endcase

end


endmodule