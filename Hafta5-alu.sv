module alu (
    input  logic [3:0] A,        // 4-bit Giriş A
    input  logic [3:0] B,        // 4-bit Giriş B
    input  logic [1:0] ALU_Sel,  // İşlem Seçici (Opcode)
    output logic [3:0] ALU_Out,  // 4-bit Sonuç Çıkışı
    output logic       CarryOut, // Elde / Borç Bayrağı
    output logic       Zero      // Sıfır Bayrağı
);

    logic [4:0] result_ext;

    always_comb begin
        CarryOut   = 1'b0;
        result_ext = 5'b0;

        case (ALU_Sel)
            2'b00: begin // TOPLAMA (ADD)
                result_ext = A + B;
                ALU_Out    = result_ext[3:0];
                CarryOut   = result_ext[4];
            end

            2'b01: begin // ÇIKARMA (SUB)
                result_ext = A - B;
                ALU_Out    = result_ext[3:0];
                CarryOut   = result_ext[4];
            end

            2'b10: begin // MANTIKSAL AND
                ALU_Out    = A & B;
                CarryOut   = 1'b0;
            end

            2'b11: begin // MANTIKSAL OR
                ALU_Out    = A | B;
                CarryOut   = 1'b0;
            end

            default: begin
                ALU_Out    = 4'b0000;
                CarryOut   = 1'b0;
            end
        endcase

        Zero = (ALU_Out == 4'b0000) ? 1'b1 : 1'b0;
    end

endmodule
