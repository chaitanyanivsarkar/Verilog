module Test_counter;
  reg clk, reset;
  wire [3:0] q;

  //module to be tested
  Ripple_counter rc (q, clk, reset);

  initial begin
    clk = 1'b0;
  end
  always begin
    #5 clk = ~clk;
  end

  initial begin
    reset = 1'b1;
    #10 reset = 1'b0;
    #185 reset = 1'b1;
    #10 reset = 1'b0;
    #20 $finish;
  end

  initial begin
    $monitor($time, " Output q = %d", q);
  end
endmodule //Testbench for Ripple counter
