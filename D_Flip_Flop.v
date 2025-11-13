module D_Flip_Flop(
    input D,
    input C,
    output reg Q,
    output Qnot
    );
   
    always @(posedge C) begin
            Q <= D;
    end
    
    assign Qnot = ~Q;
   
endmodule
