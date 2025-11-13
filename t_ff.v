module t_ff(
    input clk,
    input reset,
    input T,
    output Q
);
    wire D;
    wire Q_int;

    // T flip-flop logic: D = T XOR Q
    assign D = T ^ Q_int;

    // D-FF instantiation
    d_ff dff_inst(
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q_int)
    );

    assign Q = Q_int;

endmodule
