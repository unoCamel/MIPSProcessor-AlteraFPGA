/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: ALU_Control_TB.v
--
-----------------------------------------------------------------*/

module ALU_Control_TB;
	reg[5:0] opcodeToALU;
	reg[1:0] ALUOpF;
	wire[5:0] ALUControlOpcode;
	
	
	ALU_Control uut(
	.opcodeToALU(opcodeToALU),
	.ALUOpF(ALUOpF),
	.ALUControlOpcode(ALUControlOpcode)
	);
	
	
	
	initial begin 
	$display("-----------------------------------------------------------");
	$display("!!!!!!!!!!!!!!!!!!!!!!ALU CONTROL !!!!!!!!!!!!!!!!!!!!!!! ");
	$display("-----------------------------------------------------------");
	end
	
	initial begin
	$display("\n	#####ALUControlOpcode==opcodeToALU######");
	ALUOpF <=2'b10;
	opcodeToALU<=0;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b10;
	opcodeToALU<=5;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b10;
	opcodeToALU<=9;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b10;
	opcodeToALU<=(2**6)-1;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	$display("\n	#####ALUControlOpcode==100000######");
	ALUOpF <=2'b00;
	opcodeToALU<=9;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b00;
	opcodeToALU<=(2**6)-1;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b00;
	opcodeToALU<=13;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	$display("\n	#####ALUControlOpcode==100010######");
	ALUOpF <=2'b01;
	opcodeToALU<=9;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b01;
	opcodeToALU<=(2**6)-1;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b01;
	opcodeToALU<=12;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	$display("\n	#####ALUControlOpcode==000000######");
	ALUOpF <=2'b11;
	opcodeToALU<=9;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b11;
	opcodeToALU<=(2**6)-1;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	ALUOpF <=2'b11;
	opcodeToALU<=(2**6)-1;
	#1 $display("opcodeToALU=(%b) ALUOpF=(%b) ALUControlOpcode=(%b)", opcodeToALU, ALUOpF, ALUControlOpcode);
	end
endmodule