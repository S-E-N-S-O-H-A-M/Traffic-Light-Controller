module traffic_light_controller(input clk,
                                input v_detect,//vehicle detection sensor
                                input rst,
                                output reg [3:0] NS_light, 
                                output reg [3:0] EW_light  
);

parameter S_0='d0;
parameter S_1='d1;
parameter S_2='d2;
parameter S_3='d3;
parameter S_4='d4;
parameter S_5='d5;

parameter RED='d6;
parameter YELLOW='d7;
parameter GREEN='d8;

reg [2:0] state;
integer i=0; //delay

always @(posedge clk )  
begin
    if(rst)
    begin
        state<=S_0;
        NS_light<=GREEN; 
        EW_light<=RED;   
    end
    else
    begin
        if(v_detect==1)
        begin
        case(state)
        S_0:begin
            if(i=='d15)
            begin
                state<=S_1;
                NS_light<=YELLOW;
                EW_light<=RED;
                i<='d0;
            end
            else
            begin
                i=i+1;
                state<=S_0;
            end
            end
        S_1:begin
            if(i=='d1)
            begin
                state<=S_2;
                NS_light<=RED;
                EW_light<=RED;
                i<='d0;
            end
            else
            begin
                i=i+1;
                state<=S_1;
            end
            end
        S_2:begin
            if(i=='d1)
            begin
                state<=S_3;
                NS_light<=RED;
                EW_light<=GREEN;
                i<='d0;
            end
            else
            begin
                i=i+1;
                state<=S_2;
            end
            end
        S_3:begin
            if(i=='d5)
            begin
                state<=S_4;
                NS_light<=YELLOW;
                EW_light<=RED;
                i<='d0;
            end
            else
            begin
                i=i+1;
                state<=S_3;
            end
            end
        S_4:begin
            if(i=='d1)
            begin
                state<=S_5;
                NS_light<=RED;
                EW_light<=YELLOW;
                i<='d0;
            end
            else
            begin
                i=i+1; 
                state<=S_4;
            end
            end
        S_5:begin
            if(i=='d1)
            begin
                state<=S_0;
                NS_light<=RED;
                EW_light<=RED;
                i<='d0;
            end
            else
            begin
                i=i+1;
                state<=S_5;
            end
            end
        default:begin
                i=0;
                state<=S_0;
                NS_light<=GREEN; 
                EW_light<=RED; 
                end    
        endcase 
        end
        else
        begin
            state<=S_0;
            NS_light<=GREEN; 
            EW_light<=RED;   
        end
    end
end

endmodule
