if (reset)
  count <= 0;
else if (count == 5) begin  // divide by 12 ⇒ toggle every 6 counts
  count <= 0;
  toggle <= ~toggle;
end else
  count <= count + 1;
