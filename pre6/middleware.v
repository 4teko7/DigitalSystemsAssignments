module Middleware(
    output wire [31:0] minOutputOfController,
    output wire [31:0] maxOutputOfController,
    input wire rst,
    input wire [31:0] c,
    input wire clk
);

wire rstOutputOfControllerAndInputOfDb;
wire minInputToDpAndOutputOfController;
wire maxInputToDpAndOutputOfController;
wire [31:0] minInputOfControllerAndOutputOfDp = c;
wire [31:0] maxInputOfControllerAndOutputOfDp = c;





Datapath datapath(  .minOutputOfDpAndInputOfController(minInputOfControllerAndOutputOfDp),
                    .maxOutputOfDpAndInputOfController(maxInputOfControllerAndOutputOfDp),
                    .minInputOfDpAndOutputOfController(minInputToDpAndOutputOfController),
                    .maxInputOfDpAndOutputOfController(maxInputToDpAndOutputOfController),
                    .rstOutputOfControllerAndInputOfDb(rstOutputOfControllerAndInputOfDb),
                    .c(c),
                    .clk(clk)
                    );



Controller controller(.minOutputOfController(minOutputOfController),
                        .maxOutputOfController(maxOutputOfController),
                        .minOutputOfControllerAndInputOfDp(minInputToDpAndOutputOfController),
                        .maxOutputOfControllerAndInputOfDp(maxInputToDpAndOutputOfController),
                        .rstOutputOfControllerAndInputOfDp(rstOutputOfControllerAndInputOfDb),
                        .minInputOfControllerAndOutputOfDp(minInputOfControllerAndOutputOfDp),
                        .maxInputOfControllerAndOutputOfDp(maxInputOfControllerAndOutputOfDp),
                        .rst(rst),
                        .clk(clk)
                        );


endmodule