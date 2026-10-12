module tb_mux_4to1_8bit;

    // Sinyal tanımlamaları
    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y;

    // Modülü örnekleme (Instantiation)
    mux_4to1_8bit uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Dalga formu (waveform) çıktısı için gerekli komutlar (EDA Playground için)
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_mux_4to1_8bit);

        // Giriş değerlerini belirleyelim
        d0 = 8'hAA; // 10101010
        d1 = 8'h55; // 01010101
        d2 = 8'hCC; // 11001100
        d3 = 8'h33; // 00110011

        // Test senaryoları
        sel = 2'b00; #10;
        $display("Sel = %b | Çıkış = %h (Beklenen: AA)", sel, y);

        sel = 2'b01; #10;
        $display("Sel = %b | Çıkış = %h (Beklenen: 55)", sel, y);

        sel = 2'b10; #10;
        $display("Sel = %b | Çıkış = %h (Beklenen: CC)", sel, y);

        sel = 2'b11; #10;
        $display("Sel = %b | Çıkış = %h (Beklenen: 33)", sel, y);

        $finish;
    end

endmodule
