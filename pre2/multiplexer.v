`timescale 1ns / 1ns
module multiplexer81(
	output reg Y,
	input [0:7] X,
	input [2:0] S
);

always @(*) begin
	case(S)
		3'b000: Y <= X[0];
		3'b001: Y <= X[1];
		3'b010: Y <= X[2];
		3'b011: Y <= X[3];
		3'b100: Y <= X[4];
		3'b101: Y <= X[5];
		3'b110: Y <= X[6];

		default: Y <= X[7];
	endcase
end

endmodule