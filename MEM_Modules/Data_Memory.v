/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Data_Memory.v
--
-----------------------------------------------------------------*/

module Data_Memory(
	input[31:0] address,
	input[31:0] writeData,
	input memWriteF,
	input memReadF,
	input clock,
	output reg[7:0] finalAnswer,
	output[31:0] readData //ReadToWriteMux
	);

parameter RAM_SIZE = 300;
reg [31:0] DATA_RAM [RAM_SIZE:0];

always@(posedge clock)begin
	
	if(memWriteF)begin
	
		DATA_RAM[address] <= writeData;

		end
end

assign readData = memWriteF ?  writeData : DATA_RAM[address][31:0];
always@(posedge clock) begin
	finalAnswer = DATA_RAM[36][7:0];
end
//assign finalAnswer = DATA_RAM[31][7:0];
endmodule