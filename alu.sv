module alu (
    input  logic        clk,
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    input  logic [2:0]  ALU_Sel,
    output logic [7:0]  ALU_Out,
    output logic        Zero_Flag
);

    logic [7:0] result_comb;
    logic [7:0] result_reg;

    // ------------------------
    // COMBINATIONAL BLOCK
    // ------------------------
    always_comb begin
        case (ALU_Sel)
            3'b000: result_comb = A + B;      // Add
            3'b001: result_comb = A - B;      // Sub
            3'b010: result_comb = A & B;      // AND
            3'b011: result_comb = A | B;      // OR
            3'b100: result_comb = A ^ B;      // XOR
            3'b101: result_comb = ~(A);       // NOT
            3'b110: result_comb = A << 1;     // Shift Left
            3'b111: result_comb = A >> 1;     // Shift Right
            default: result_comb = 8'd0;
        endcase
    end

    // ------------------------
    // PIPELINE STAGE (Register output)
    // ------------------------
    always_ff @(posedge clk) begin
        result_reg <= result_comb;
    end

    assign ALU_Out = result_reg;
    assign Zero_Flag = (result_reg == 8'd0);

endmodule
