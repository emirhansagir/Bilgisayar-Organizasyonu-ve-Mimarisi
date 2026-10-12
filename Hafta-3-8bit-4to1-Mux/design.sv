module mux_4to1_8bit (
    input  logic [7:0] d0,    // 1. Veri girişi (8-bit)
    input  logic [7:0] d1,    // 2. Veri girişi (8-bit)
    input  logic [7:0] d2,    // 3. Veri girişi (8-bit)
    input  logic [7:0] d3,    // 4. Veri girişi (8-bit)
    input  logic [1:0] sel,   // Seçici sinyal (2-bit)
    output logic [7:0] y      // Çıkış (8-bit)
);

    // Sürekli atama (Continuous Assignment) ile Mux tasarımı
    always_comb begin
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
            default: y = 8'b0;
        endcase
    end

endmodule
