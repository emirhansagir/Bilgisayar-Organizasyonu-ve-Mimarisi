// --- TASARIM KODU ---
module mux_4to1_8bit (
    input  logic [7:0] d0,
    input  logic [7:0] d1,
    input  logic [7:0] d2,
    input  logic [7:0] d3,
    input  logic [1:0] sel,
    output logic [7:0] y
);
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

// --- TESTBENCH KODU ---
module tb_mux_4to1_8bit;
    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y;

    mux_4to1_8bit uut (
        .d0(d0), .d1(d1), .d2(d2), .d3(d3),
        .sel(sel), .y(y)
    );

    initial begin
        d0 = 8'hAA; 
        d1 = 8'h55; 
        d2 = 8'hCC; 
        d3 = 8'h33;

        sel = 2'b00; #10;
        $display("Sel = %b | Cikis = %h (Beklenen: AA)", sel, y);

        sel = 2'b01; #10;
        $display("Sel = %b | Cikis = %h (Beklenen: 55)", sel, y);

        sel = 2'b10; #10;
        $display("Sel = %b | Cikis = %h (Beklenen: CC)", sel, y);

        sel = 2'b11; #10;
        $display("Sel = %b | Cikis = %h (Beklenen: 33)", sel, y);

        $finish;
    end
endmodule
