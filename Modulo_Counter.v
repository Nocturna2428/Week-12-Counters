module modulo_counter(
    input clk,
    input reset,
    output [2:0] state, // led[3:5]
    output reg out // led[6]
);
    wire [2:0] next_state;
    reg [2:0] count;
    wire max_count;

    // Check if we reached 5 (binary 101)
    assign max_count = (count == 3'd5);

    // Next state logic
    assign next_state = max_count ? 3'd0 : (count + 1'b1);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 3'd0;
            out <= 0;
        end else begin
            count <= next_state;
            if (max_count)
                out <= ~out; // toggle on overflow
        end
    end

    assign state = count;

endmodule

