`timescale 1ns / 1ns
module TestBench();

wire OutputMux;
reg [2:0] SelectionMux;


reg [1:0] inputDecoder;
wire [3:0] outputDecoder;


decoder24 decoder24(outputDecoder, inputDecoder);
wire zeroInput;
wire threeOutput;
wire zeroOneInput;
wire twoOutput;
wire notThreeOutput;
not(zeroInput,inputDecoder[1]);
or(threeOutput,inputDecoder[0],inputDecoder[1]);
not(notThreeOutput,threeOutput);
not(twoOutput,outputDecoder[1]);
xnor(zeroOneInput,inputDecoder[1],inputDecoder[0]);



multiplexer81 multiplexer81(OutputMux, {1'b0,zeroInput,twoOutput,notThreeOutput,inputDecoder[1],notThreeOutput,threeOutput,zeroOneInput}, SelectionMux);



initial begin
	$dumpfile("test.vcd");
	$dumpvars(0, OutputMux, inputDecoder, SelectionMux);
	
	inputDecoder = 2'b00; SelectionMux = 3'b000;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b000;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b000;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b000;
	#20;
    inputDecoder = 2'b00; SelectionMux = 3'b001;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b001;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b001;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b001;
	#20;
	inputDecoder = 2'b00; SelectionMux = 3'b010;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b010;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b010;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b010;
	#20;
    inputDecoder = 2'b00; SelectionMux = 3'b011;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b011;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b011;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b011;
	#20;
	
    inputDecoder = 2'b00; SelectionMux = 3'b100;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b100;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b100;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b100;
	#20;
    inputDecoder = 2'b00; SelectionMux = 3'b101;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b101;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b101;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b101;
	#20;
	inputDecoder = 2'b00; SelectionMux = 3'b110;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b110;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b110;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b110;
	#20;
    inputDecoder = 2'b00; SelectionMux = 3'b111;
	#20;
    inputDecoder = 2'b01; SelectionMux = 3'b111;
	#20;
    inputDecoder = 2'b10; SelectionMux = 3'b111;
	#20;
    inputDecoder = 2'b11; SelectionMux = 3'b111;
	#20;


	$finish;
end

endmodule