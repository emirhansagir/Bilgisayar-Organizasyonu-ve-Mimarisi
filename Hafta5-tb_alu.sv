module tb_alu;

    logic [3:0] A;
    logic [3:0] B;
    logic [1:0] ALU_Sel;
    logic [3:0] ALU_Out;
    logic       CarryOut;
    logic       Zero;

   
    alu uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu);

        $display("-----------------------------------------------------");
        $display(" Time | A    B    | Sel | Operation | Out  | Carry | Zero");
        $display("-----------------------------------------------------");

       
        ALU_Sel = 2'b00; A = 4'b0101; B = 4'b0011; #10;
        $display("%4t | %b %b | %b  | ADD       | %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

        
        ALU_Sel = 2'b00; A = 4'b1100; B = 4'b0101; #10;
        $display("%4t | %b %b | %b  | ADD (Ovf) | %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

        
        ALU_Sel = 2'b01; A = 4'b1010; B = 4'b0100; #10;
        $display("%4t | %b %b | %b  | SUB       | %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

       
        ALU_Sel = 2'b01; A = 4'b0111; B = 4'b0111; #10;
        $display("%4t | %b %b | %b  | SUB (Zero)| %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

        
        ALU_Sel = 2'b10; A = 4'b1100; B = 4'b1010; #10;
        $display("%4t | %b %b | %b  | AND       | %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

       
        ALU_Sel = 2'b11; A = 4'b1100; B = 4'b1010; #10;
        $display("%4t | %b %b | %b  | OR        | %b |   %b   |  %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

        $display("-----------------------------------------------------");
        $finish;
    end

endmodule
