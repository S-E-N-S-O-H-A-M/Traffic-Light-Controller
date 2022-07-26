`include "traffic_light_controller.v"
module traffic_light_controller_test;
//Inputs
reg clk;
reg rst;

//Outputs
wire [1:0] NS_light;
wire [1:0] EW_light;
//Instantiate the Unit Under Test
traffic_light_controller uut(
    .clk(clk),
    .rst(rst),
    .NS_light(NS_light),
    .EW_light(EW_light)
);

always #3 clk=~clk;
initial begin

    $dumpfile("traffic_light_controller_test.vcd");
    $dumpvars(0,traffic_light_controller_test);

    //Initialize Inputs

    clk=0;rst=0;

    //Wait for 10 ns for global reset to finish

    #10 rst=1;
    #200;
    //$stop();
    $finish();
    
    //Add stimulus here

end

endmodule
