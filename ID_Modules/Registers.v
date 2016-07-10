module Registers(
	input regWriteF,
	input[31:0] writeData,
	input[4:0] inRegA,
	input[4:0] inRegB,
	input[4:0] writeReg,
	input clock,
	output reg[31:0] outRegA,
	output reg[31:0] outRegB
	// output[31:0] t0,
	// output[31:0] t1,
	// output[31:0] t3,
	// output[31:0] stacP
	//output reg[7:0] finalAnswer
	);

	reg [31:0] registerFile [0:31];

	always@(posedge clock)
	  	begin
	  		//registerFile[10] <= 0; //this is temporary
	  		//registerFile[31] <= 0; 
       	    if(regWriteF) registerFile[writeReg] <= writeData;
       	    //finalAnswer = registerFile[8][7:0];
	  	end
   
   always@(*)
    	begin
    		if(inRegA == 5'd0)begin
    			outRegA = 32'd0;
    		end else begin
    			outRegA = registerFile[inRegA];
    		end
    		if(inRegB == 5'd0)begin
    			outRegB = 32'd0;
    		end else begin
    			outRegB = registerFile[inRegB];
    		end
			//outRegB = registerFile[inRegB];
			// /finalAnswer = registerFile[8];
     	end

     	// assign t0 = registerFile[8];
     	// assign t1 = registerFile[9];
     	// assign t3 = registerFile[11];
     	// assign stacP = registerFile[29];

endmodule