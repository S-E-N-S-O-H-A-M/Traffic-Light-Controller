module traffic_light_controller(input clk,
                                input rst,
                                output reg [1:0] NS_light, 
                                output reg [1:0] EW_light  
);

parameter S_0=3'b000;
parameter S_1=3'b001;
parameter S_2=3'b010;
parameter S_3=3'b011;
parameter S_4=3'b100;
parameter S_5=3'b101;

parameter RED=2'b00;
parameter YELLOW=2'b01;
parameter GREEN=2'b10;

reg [2:0] state;
integer count=0; 

always @(posedge clk or negedge rst) 
begin
    if(rst==1'b0)
    begin
        state<=S_0;
        NS_light<=GREEN;
        EW_light<=RED;   
    end
    else
    begin
        case(state)
        S_0:begin
            if(count=='d15)
            begin
                state<=S_1;
                NS_light<=YELLOW;
                EW_light<=RED;
                count<='d0;
            end
            else
            begin
                count<=count+1;
                state<=S_0;
            end
            end
        S_1:begin
            if(count=='d1)
            begin
                state<=S_2;
                NS_light<=RED;
                EW_light<=RED;
                count<='d0;
            end
            else
            begin
                count<=count+1;
                state<=S_1;
            end
            end
        S_2:begin
            if(count=='d1)
            begin
                state<=S_3;
                NS_light<=RED;
                EW_light<=GREEN;
                count<='d0;
            end
            else
            begin
                count<=count+1;
                state<=S_2;
            end
            end
        S_3:begin
            if(count=='d5)
            begin
                state<=S_4;
                NS_light<=YELLOW;
                EW_light<=RED;
                count<='d0;
            end
            else
            begin
                count<=count+1;
                state<=S_3;
            end
            end
        S_4:begin
            if(count=='d1)
            begin
                state<=S_5;
                NS_light<=RED;
                EW_light<=YELLOW;
                count<='d0;
            end
            else
            begin
                count<=count+1; 
                state<=S_4;
            end
            end
        S_5:begin
            if(count=='d1)
            begin
                state<=S_0;
                NS_light<=RED;
                EW_light<=RED;
                count<='d0;
            end
            else
            begin
                count<=count+1;
                state<=S_5;
            end
            end
        default:begin
                count=0;
                state<=S_0;
                NS_light<=GREEN; 
                EW_light<=RED; 
                end    
        endcase 
    end
end

endmodule
