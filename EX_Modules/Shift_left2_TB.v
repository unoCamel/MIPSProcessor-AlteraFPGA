/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Shift_Left2_TB.v
--
-----------------------------------------------------------------*/

module Shift_Left2_TB;
	reg[31:0] genericInput;
	wire[31:0] shiftedGenericOutput;
	
	
	
	Shift_Left2 uut(
		.genericInput(genericInput),
		.shiftedGenericOutput(shiftedGenericOutput)
	
	);
	
	
	
	initial begin 
	$display("-------------------------------------------");
	$display("!!!!!!!!!!!!!!SHIFTED LEFT!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	end
	
	initial begin
	
	genericInput <= 0;
	#1 $display("GI=(%b) SGO=(%b)", genericInput, shiftedGenericOutput);
	genericInput <= 1;
	#1 $display("GI=(%b) SGO=(%b)", genericInput, shiftedGenericOutput);
	genericInput <= (2**32)-1;
	#1 $display("GI=(%b) SGO=(%b)", genericInput, shiftedGenericOutput);
	genericInput <= 02**29;
	#1 $display("GI=(%b) SGO=(%b)", genericInput, shiftedGenericOutput);
	end
endmodule