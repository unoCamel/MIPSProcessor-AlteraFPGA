/*------------------------------------------------------------------ 
-- Haley Whitman & Andrew Hill
-- May 2016
-- CAES: Computer Architecture and Embedded Systems Laboratory
-- University of Oregon
-- Eugene, OR
-- 
--  
-- Filename: MIPS_Processor.v
--
-- Description: Synthesizable on a Altera Cyclone V FPGA. Supports  
-- many MIPS instructions. Currently, this is a single-cycle 
-- implementation.
-----------------------------------------------------------------*/

module LED_7seg(
	input[7:0] BCD,
	output segA,segB,segC,segD,segE,segF,segG,segDP
	);

	/****************************************
	

			        __0__
			       |     |
			       5     1
					 |__6__|
					 |     |
					 4     2
					 |__3__| [P]

					 
					 
	Key: 8'bP6543210  (0 == LIT UP,  1 == OFF)

	*****************************************/
	
	reg[7:0] SevenSeg;
	always@(*)
		case (BCD)
			4'h0:   SevenSeg = 8'b01000000; // '0'
			4'h1:   SevenSeg = 8'b01111001; // '1'
			4'h2:   SevenSeg = 8'b00100100; // '2'
			4'h3:   SevenSeg = 8'b00110000; // '3'
			4'h4:   SevenSeg = 8'b00011001; // '4'
			4'h5:   SevenSeg = 8'b00010010; // '5'
			4'h6:   SevenSeg = 8'b00000010; // '6'
			4'h7:   SevenSeg = 8'b01111000; // '7'
			4'h8:   SevenSeg = 8'b00000000; // '8'
			4'h9:   SevenSeg = 8'b00010000; // '9'
			4'ha:   SevenSeg = 8'b01111111; // ' '
			4'hb:   SevenSeg = 8'b00001100; // 'P'
			4'hc:   SevenSeg = 8'b01000111; // 'L'
			4'hd:   SevenSeg = 8'b00000110; // 'E'
			4'he:   SevenSeg = 8'b00010010; // 'S'
			4'hf:   SevenSeg = 8'b00001110; // 'F'
			default:SevenSeg = 8'b01111111; // ' ' *
		endcase
	assign {segDP,segG,segF,segE,segD,segC,segB,segA}=SevenSeg;
endmodule
