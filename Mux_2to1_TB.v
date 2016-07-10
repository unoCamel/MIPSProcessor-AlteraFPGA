/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Mux_2to1_TB.v
--
-----------------------------------------------------------------*/

module Mux_2to1_TB;
	reg[31:0] genericValue1;
	reg[31:0] genericValue2;
	reg genericF;
	wire[31:0] genericOutput;
	
	
	
	Mux_2to1 uut(
		.genericValue1(genericValue1),
		.genericValue2(genericValue2),
		.genericF(genericF),
		.genericOutput(genericOutput)
	);
	
	
	
	initial begin 
	$display("-------------------------------------------");
	$display("!!!!!!!!!!!!FLAG=TRUE!!!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	genericF=1;
	end
	
	initial begin
	
	genericValue1 <= 0;
	genericValue2 <= 1;
	#1 $display("GV1=(%b) GV2=(%b), GO=(%b)", genericValue1, genericValue2, genericOutput);
	genericValue1 <= 1;
	genericValue2 <= 0;
	#1 $display("GV1=(%b) GV2=(%b), GO=(%b)", genericValue1, genericValue2, genericOutput);
	$display("-------------------------------------------");
	$display("!!!!!!!!!!!!FLAG=FALSE!!!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	genericF<=0;
	genericValue1 <= 0;
	genericValue2 <= 1;
	#1 $display("GV1=(%b) GV2=(%b), GO=(%b)", genericValue1, genericValue2, genericOutput);
	genericValue1 <= 1;
	genericValue2 <= 0;
	#1 $display("GV1=(%b) GV2=(%b), GO=(%b)", genericValue1, genericValue2, genericOutput);
	end
endmodule