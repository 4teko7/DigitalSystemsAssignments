module Controller(
    output reg [31:0] minOutputOfController,
    output reg [31:0] maxOutputOfController,
    output reg minOutputOfControllerAndInputOfDp,
    output reg maxOutputOfControllerAndInputOfDp,
    output reg rstOutputOfControllerAndInputOfDp,
    input wire [31:0] minInputOfControllerAndOutputOfDp, 
    input wire [31:0] maxInputOfControllerAndOutputOfDp,  
    input wire rst,
    input wire clk
);




parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;





reg [1:0] current_state;
reg [1:0] next_state;


initial begin
    current_state = S0;
end

// Outputs
always @(*) begin
    case(current_state)
    S0: begin
        minOutputOfControllerAndInputOfDp <= 1;
        maxOutputOfControllerAndInputOfDp <= 1;
        minOutputOfController <= minInputOfControllerAndOutputOfDp;  // minInput
        maxOutputOfController <= maxInputOfControllerAndOutputOfDp;// maxInput
    end
    S1: begin
        minOutputOfControllerAndInputOfDp <= 1;
        maxOutputOfControllerAndInputOfDp <= 1;
        minOutputOfController <= minInputOfControllerAndOutputOfDp;
        maxOutputOfController <= maxInputOfControllerAndOutputOfDp;
    end
    S2: begin
        minOutputOfControllerAndInputOfDp <= 1;
        maxOutputOfControllerAndInputOfDp <= 1;
        minOutputOfController <= minInputOfControllerAndOutputOfDp;
        maxOutputOfController <= maxInputOfControllerAndOutputOfDp;
    end
    S3: begin
        minOutputOfControllerAndInputOfDp <= 1;
        maxOutputOfControllerAndInputOfDp <= 1;
        minOutputOfController <= minInputOfControllerAndOutputOfDp;
        maxOutputOfController <= maxInputOfControllerAndOutputOfDp;
    end
    endcase
end


// state transitions
always @(*) begin
    case(current_state)
    S0: begin
        next_state = S1;
    end
    S1: begin
        
        if(rst == 1) 
            begin
                rstOutputOfControllerAndInputOfDp = 1;
                next_state = S0;
            end
        else if(minInputOfControllerAndOutputOfDp <= minOutputOfController) next_state = S3;
        else if(maxInputOfControllerAndOutputOfDp >= maxOutputOfController) next_state = S2;
        else next_state = S1;
        if(rst == 0) rstOutputOfControllerAndInputOfDp = 0;
        // $display("nextState : " + next_state);
    end
    S2: begin
       
        if(rst == 1) 
            begin
                rstOutputOfControllerAndInputOfDp = 1;
                next_state = S0;
            end
        else if(minInputOfControllerAndOutputOfDp <= minOutputOfController) next_state = S2;
        else if(maxInputOfControllerAndOutputOfDp >= maxOutputOfController) next_state = S3;
        else next_state = S1;
         if(rst == 0) rstOutputOfControllerAndInputOfDp = 0;
        // $display("nextState : " + next_state);
    end
    S3: begin
        
        if(rst == 1) 
            begin
                rstOutputOfControllerAndInputOfDp = 1;
                next_state = S0;
            end
        else if(minInputOfControllerAndOutputOfDp <= minOutputOfController) next_state = S2;
        else if(maxInputOfControllerAndOutputOfDp >= maxOutputOfController) next_state = S3;
        else next_state = S1;
        if(rst == 0) rstOutputOfControllerAndInputOfDp = 0;
    end
    default: begin
        next_state = S0;
    end
    endcase
end


always @(posedge clk) begin
    current_state <= next_state; 
end

endmodule