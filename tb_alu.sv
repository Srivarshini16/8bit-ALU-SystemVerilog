`timescale 1ns/1ps

module tb_alu;

    logic clk;
    logic [7:0] A, B;
    logic [2:0] ALU_Sel;
    logic [7:0] ALU_Out;
    logic Zero_Flag;

    // Instantiate ALU
    alu uut (
        .clk(clk),
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Zero_Flag(Zero_Flag)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 100 MHz clock
    end

    // Stimulus block
    initial begin
        // Monitor outputs
        $monitor("Time=%0t | A=%d B=%d Sel=%b | Out=%d | Zero=%b",
                 $time, A, B, ALU_Sel, ALU_Out, Zero_Flag);

        // Apply test vectors
        A = 8'd10;  B = 8'd5;

        ALU_Sel = 3'b000;  #10;   // Add
        ALU_Sel = 3'b001;  #10;   // Sub
        ALU_Sel = 3'b010;  #10;   // AND
        ALU_Sel = 3'b011;  #10;   // OR
        ALU_Sel = 3'b100;  #10;   // XOR
        
        A = 8'd0;               // For zero flag test
        ALU_Sel = 3'b000; #10;  // Add

        ALU_Sel = 3'b101;  #10; // NOT
        ALU_Sel = 3'b110;  #10; // Shift Left
        ALU_Sel = 3'b111;  #10; // Shift Right

        #20;
        $finish;
    end

endmodule
