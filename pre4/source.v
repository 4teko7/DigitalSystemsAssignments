`timescale 1ns / 1ns

module source(y, stateReg, nextStateReg, x, rst, clk);

output reg [1:0]y;
input wire x;
input wire rst;
input wire clk;
parameter S0 = 4'b0000,
	S1 = 4'b0001,
	S2 = 4'b0010,
	S3 = 4'b0011,
	S4 = 4'b0100,
	S5 = 4'b0101,
	S6 = 4'b0110,
	S7 = 4'b0111,
	S8 = 4'b1000;
	
output reg [3:0] stateReg;
output reg [3:0] nextStateReg;

always@(x, stateReg) begin
	case(stateReg)
		S0: begin
			if(x == 0) begin
				nextStateReg <= S0;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b00;
		end
		S1: begin
			if(x == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b00;
		end
		S2: begin
			if(x == 0) begin
				nextStateReg <= S3;
			end
			else begin
				nextStateReg <= S6;
			end
			y <= 2'b00;
		end
		S3: begin
			if(x == 0) begin
				nextStateReg <= S4;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b00;
		end
		S4: begin
			if(x == 0) begin
				nextStateReg <= S0;
			end
			else begin
				nextStateReg <= S5;
			end
			y <= 2'b00;
		end
		S5: begin
			if(x == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b01;
		end
		S6: begin
			if(x == 0) begin
				nextStateReg <= S7;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b00;
		end
		S7: begin
			if(x == 0) begin
				nextStateReg <= S3;
			end
			else begin
				nextStateReg <= S8;
			end
			y <= 2'b00;
		end
		S8: begin
			if(x == 0) begin
				nextStateReg <= S7;
			end
			else begin
				nextStateReg <= S1;
			end
			y <= 2'b11;
		end
	endcase
end
		
always@(posedge clk) begin
	if(rst) begin
		stateReg <= S0;
	end
	else begin
		stateReg <= nextStateReg;
	end
end

endmodule
	