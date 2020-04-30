`timescale 1ns / 1ns

module FSM_After(Y, X, reset, clk);

output reg [0:0]Y;
input wire X;
input wire reset;
input wire clk;

parameter S0 = 2'b00,
	S1S2 = 2'b01,
	S3 = 2'b11;
	
reg [1:0] currentState;
reg [1:0] nextState;

initial begin
	currentState <= S0;
end

always@(X, currentState) begin
	case(currentState)
		S0: begin
			if(X == 0) begin
				nextState <= S0;
				Y <= 1'b0;
			end
			else begin
				nextState <= S1S2;
				Y <= 1'b1;
			end
		end
		S1S2: begin
			if(X == 0) begin
				nextState <= S3;
				Y <= 1'b1;
			end
			else begin
				nextState <= S1S2;
				Y <= 1'b0;
			end
		end
		S3: begin
			if(X == 0) begin
				nextState <= S0;
				Y <= 1'b1;
			end
			else begin
				nextState <= S3;
				Y <= 1'b0;
			end
		end
	endcase
end
		
always@(posedge clk) begin
	if(reset) begin
		currentState <= S0;
	end
	else begin
		currentState <= nextState;
	end
end

endmodule
	