/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Sign_Extend_16to32_TB.v
--
-----------------------------------------------------------------*/

module Sign_Extend_16to32_TB;
	reg[15:0] immediate;
	wire[31:0] extendedImmediate;
	
	
	
	Sign_Extend_16to32 uut(
		.immediate(immediate),
		.extendedImmediate(extendedImmediate)
	
	);
	
	
	
	initial begin 
	$display("-------------------------------------------");
	$display("!!!!!!!!!!!!!!SIGN EXTENDED!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	end
	
	initial begin
	
	immediate <= 0;
	#1 $display("I=(%b) EI=(%b)", immediate, extendedImmediate);
	immediate <= (2**15)+1;
	#1 $display("I=(%b) EI=(%b)", immediate, extendedImmediate);
	immediate <= 69;
	#1 $display("I=(%b) EI=(%b)", immediate, extendedImmediate);
	immediate <= 1;
	#1 $display("I=(%b) EI=(%b)", immediate, extendedImmediate);
	immediate <= 100;
	#1 $display("I=(%b) EI=(%b)", immediate, extendedImmediate);
	end
endmodule