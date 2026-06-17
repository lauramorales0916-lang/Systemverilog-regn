module tb_reg_n;
  parameter WIDTH_TB = 8;
  logic clk_tb=0;
  logic rst_tb;
  logic en_tb;
  logic [WIDTH_TB-1:0] d_tB, q_tb;
   
  reg_n #(.WIDTH(TB_WIDTH) dut (
    .clk(clk_tb)
    .rst(rst_tb)
    .d(d_tb)
    .q(q_tb)
  );
   
  initial begin
    forever #5 clk_tb = ~clk_tb;
  end 
    
  initial begin           
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_reg_n);
    
    //-----
    rst_tb = 0; 
    en_tb = 0;
    d_tb = ´0;
    
    #15 rst_tb = 1

    // test 1
    #10 rst_tb = 0;
    d_tb = 8´hAA;
    en_tb = 1;

    // test 2
    #10 rst_tb = 0;
    d_tb = 8´h55;
    en_tb = 1;
    
s
    
    // test 3 
    $finish;
  end 
  
endmodule 
    