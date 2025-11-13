module top(
    input btnC, // manual clock
    input btnU, // reset
    output [6:0] led
);
    // Ripple counter signals
    wire [2:0] ripple_out;

    // Modulo counter signals
    wire [2:0] mod_state;
    wire mod_out;

    // Instantiate Ripple Counter (divide by 8)
    ripple_counter RC (
        .clk(btnC),
        .reset(btnU),
        .stage(ripple_out)
    );

    // Instantiate Modulo Counter (divide by 12)
    modulo_counter MC (
        .clk(btnC),
        .reset(btnU),
        .state(mod_state),
        .out(mod_out)
    );

    // LED mapping
    assign led[0] = ripple_out[0];
    assign led[1] = ripple_out[1];
    assign led[2] = ripple_out[2];
    assign led[3] = mod_state[0];
    assign led[4] = mod_state[1];
    assign led[5] = mod_state[2];
    assign led[6] = mod_out;

endmodule
