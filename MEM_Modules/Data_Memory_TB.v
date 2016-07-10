/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: Data_Memory_TB.v
--
-----------------------------------------------------------------*/

module Data_Memory_TB;
	reg[31:0] address;
	reg[31:0] writeData;
	reg memWriteF, memReadF, clock;
	wire[31:0] readData;


Data_Memory uut (
	.address(address),
	.writeData(writeData),
	.memWriteF(memWriteF),
	.memReadF(memReadF),
	.clock(clock),
	.readData(readData)
	);

initial begin
	clock <= 0;
	memWriteF <= 0;
	memReadF <= 0;
	address <= 0;
	writeData <= 0;
end

always begin 
	#1 clock = !clock;
end

initial begin 
$display("-----------------------------------------------------------");
$display("!!!!!!!!!!!!!!!!!!!!!!DATA MEMORY!!!!!!!!!!!!!!!!!!!!!!! ");
$display("-----------------------------------------------------------");
end

initial begin
#2 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);
#1 writeData <= 10;
#1 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);
#1 memWriteF <= 1;
#1 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);
#1 memWriteF <= 0;
#1 address <= 5;
#1 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);
#1 writeData <= 1000;
#1 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);
#1 memWriteF <= 1;
#1 $display("writeF(%b) readF(%b) address(%b) writeData(%b) readData(%b)", memWriteF, memReadF, address, writeData, readData);

end

endmodule