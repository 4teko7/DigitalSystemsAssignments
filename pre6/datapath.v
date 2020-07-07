module Datapath(
    output reg signed [31:0] minOutputOfDpAndInputOfController = 32'd2147483647,
    output reg signed [31:0] maxOutputOfDpAndInputOfController = -32'd2147483648,
    input wire minInputOfDpAndOutputOfController,
    input wire maxInputOfDpAndOutputOfController,
    input wire rstOutputOfControllerAndInputOfDb,
    input wire signed [31:0] c,
    input wire clk
);




// eq!=1'b1 && gr!=1'b0 && lw!=1'b0


always @(posedge clk) begin
    if(rstOutputOfControllerAndInputOfDb == 1)
        begin
            minOutputOfDpAndInputOfController = 32'd2147483647;
            maxOutputOfDpAndInputOfController = -32'd2147483648;
        end
    else
        begin
            if(minOutputOfDpAndInputOfController > c) minOutputOfDpAndInputOfController = c;
            if(maxOutputOfDpAndInputOfController < c) maxOutputOfDpAndInputOfController = c;
        end
end

endmodule

// −2,147,483,648
// 2,147,483,647


//  begin
//             if(minInputOfDpAndOutputOfController == 1 && minOutputOfDpAndInputOfController > c) minOutputOfDpAndInputOfController <= c;
//             else minOutputOfDpAndInputOfController <= minOutputOfDpAndInputOfController;
//             if(maxInputOfDpAndOutputOfController == 1 && maxOutputOfDpAndInputOfController < c) maxOutputOfDpAndInputOfController <= c;
//             else maxOutputOfDpAndInputOfController <= maxOutputOfDpAndInputOfController;
//         end