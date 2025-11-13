module ripple_counter(
    input clk,
    input reset,
    output [2:0] stage // led[0:2]
);
    wire q0, q1, q2;

    // Each T flip-flop toggles its output (T=1)
    t_ff ff0 (.clk(clk), .reset(reset), .T(1'b1), .Q(q0));
    t_ff ff1 (.clk(q0), .reset(reset), .T(1'b1), .Q(q1));
    t_ff ff2 (.clk(q1), .reset(reset), .T(1'b1), .Q(q2));

    assign stage = {q2, q1, q0};

endmodule
