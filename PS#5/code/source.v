`timescale 1ns / 1ns

module source(z, stateReg, nextStateReg, w, rst, clk);

output reg [0:0]z;
input wire w;
input wire rst;
input wire clk;
parameter S0 = 2'b00,
	S1 = 2'b01,
	S2 = 2'b10,
	S3 = 2'b11;
	
output reg [1:0] stateReg;
output reg [1:0] nextStateReg;

always@(w, stateReg) begin
	case(stateReg)
		S0: begin
			if(w == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S3;
			end
			z <= 1'b0;
		end
		S1: begin
			if(w == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S0;
			end
			z <= 1'b0;
		end
		S2: begin
			if(w == 0) begin
				nextStateReg <= S3;
			end
			else begin
				nextStateReg <= S0;
			end
			z <= 1'b0;
		end
		S3: begin
			if(w == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S1;
			end
			z <= 1'b1;
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
	