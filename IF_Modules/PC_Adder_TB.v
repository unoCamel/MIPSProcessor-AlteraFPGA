/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: PC_Adder_TB.v
--
-----------------------------------------------------------------*/

module tb_PC_Adder;
	reg[31:0] fromPC;
	wire[31:0] incrPC;

	PC_Adder uut(
		.fromPC(fromPC),
		.incrPC(incrPC)
	);

	initial begin 
	$display("-------------------------------------------");
	$display("Initializing values!!!!!!!!!!!!!!!! ");
	$display("-------------------------------------------");
	end

	initial begin
	fromPC = 0;
	#1 $display("fromPC(%b) incrPC(%b)", fromPC, incrPC);
	fromPC = 4;
	#1 $display("fromPC(%b) incrPC(%b)", fromPC, incrPC);
	fromPC = 60;
	#1 $display("fromPC(%b) incrPC(%b)", fromPC, incrPC);
	fromPC = 28;
	#1 $display("fromPC(%b) incrPC(%b)", fromPC, incrPC);
	end


endmodule