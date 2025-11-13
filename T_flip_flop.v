module T_flip_flop(
    input T,
    input C,
    output Q,
    output Qnot
    );
    
     D_Flip_Flop dflip(
    .D(inp),
    .C(C),
    .Q(Q),
    .Qnot(Qnot)
    );
    
    wire inp;
    
    multiplexer multi(
    .A(Q),
    .B(Qnot),
    .Sel(T),
    .Y(inp)
    );
endmodule
