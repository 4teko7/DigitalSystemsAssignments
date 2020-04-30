`timescale 1ns/1ns
module testbench();
wire [1:0] y;
wire [3:0] cs;
wire [3:0] ns;
reg x;
reg rst;
reg clk;


parameter myInput0 =32'b10001000110001000110101011010101;
parameter myInput1 =32'b10101011010101100010001100010001;
parameter myInput2 =32'b10101011000100011010101100010001;
parameter myInput3 =32'b10001000110101011010101100010001;
parameter myInput4 =32'b11111111111111111111111111111111;

integer i;
integer j;

source s(y, cs, ns, x, rst, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, y, cs, ns, x, rst, clk);
    
    rst = 1;
    x = 0;
    #20;
    rst = 0;
    
        for (i=31; i>=0; i--) begin
            x = myInput0[i];
            #40;
        end


	rst = 1;
	x = 0;
	#50
	rst = 0;

    	for (i=31; i>=0; i--) begin
            x = myInput1[i];
            #40;
        end

    rst = 1;
	x = 0;
	#50
	rst = 0;

    	for (i=31; i>=0; i--) begin
            x = myInput2[i];
            #40;
        end

    rst = 1;
	x = 0;
	#50
	rst = 0;

    	for (i=31; i>=0; i--) begin
            x = myInput3[i];
            #40;
        end




    rst = 1;
	x = 0;
	#50
	rst = 0;

    	for (i=31; i>=0; i--) begin
            x = myInput4[i];
            #40;
        end

    //
    
    $finish;
end

always begin	
	clk = 1;
	#20;
	clk = 0;
	#20;
    end

endmodule
