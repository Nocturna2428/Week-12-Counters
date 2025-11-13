module T_flip_flop(
     if (reset)
    Q <= 0;
  else
    Q <= ~Q;
    );
end
TFF stage0(.clk(btnC), .reset(btnU), .Q(led[0]));
TFF stage1(.clk(led[0]), .reset(btnU), .Q(led[1]));
TFF stage2(.clk(led[1]), .reset(btnU), .Q(led[2]));
     
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
