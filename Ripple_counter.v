module T_flip_flop(
     if (reset)
    Q <= 0;
  else
    Q <= ~Q;
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
