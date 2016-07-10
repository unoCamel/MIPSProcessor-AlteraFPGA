/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: PC_Jump_Adder_TB.v
--
-----------------------------------------------------------------*/

module PC_Jump_Adder_TB;
	reg[31:0] shiftedExtendedImmediate;
	reg[31:0] incrPC;
	wire[31:0] addPCResult;
	
	
	PC_Jump_Adder uut(
	.shiftedExtendedImmediate(shiftedExtendedImmediate),
	.incrPC(incrPC),
	.addPCResult(addPCResult)
	);
	
	
	
	initial begin 
	$display("-------------------------------------------");
	$display("!!!!!!!!!!!!!!PC JUMP ADDER!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	end
	
	initial begin
	
	shiftedExtendedImmediate <= 0;
	incrPC <= 0;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	shiftedExtendedImmediate <= 4;
	incrPC <= 8;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	shiftedExtendedImmediate <= (2**30)-1;
	incrPC <= 1;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	shiftedExtendedImmediate <= 4;
	incrPC <= 4;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	shiftedExtendedImmediate <= (2**32)-3;
	incrPC <= 1;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	shiftedExtendedImmediate <= 178;
	incrPC <= 690;
	#1 $display("SEI=(%b) incrPC=(%b) addPCResult=(%b)", shiftedExtendedImmediate, incrPC, addPCResult);
	end
endmodule