//Traffic light control
//Data flow Modelling
//16CO238
//16CO224
//The project shows how a 4-way junction traffic light works and the lights at every junction change colours with time (depending on clock cycles). The north and south lights are in sync with each other and opposite to the east and west lights.



//The Outputs taken are the Lights.

module clk_div(clk_in,clk_out);
input clk_in;
output clk_out;
reg [26:0] count=27'd0;

always @(posedge clk_in)
begin
    count=count+27'd1;
end
assign clk_out=count[26];
endmodule

module VerilogBM_224_238(n_lights,s_lights,e_lights,w_lights,clk_in,rst_a);

   output reg [2:0] n_lights,s_lights,e_lights,w_lights; 
   input      clk_in;
   input      rst_a;
 
   reg [2:0] state;
 
   parameter [2:0] north=3'b000;
   parameter [2:0] north_y=3'b001;
   parameter [2:0] south=3'b010;
   parameter [2:0] south_y=3'b011;
   parameter [2:0] east=3'b100;
   parameter [2:0] east_y=3'b101;
   parameter [2:0] west=3'b110;
   parameter [2:0] west_y=3'b111;

   reg [2:0] count;
   wire clk;
   
   clk_div CD(clk_in,clk);
   
 // The code determines the current state of the traffic signal so that it can proceed to the next state.

   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state=north;
                count =3'b000;
            end
        else
            begin
                case (state)
                north :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b000;
                            state=north_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north;
                            end
                    end

                south :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b000;
                            state=south_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=south;
                        end
                    end

               north_y :
                    begin
                        if (count==3'b001)
                            begin
                            count=3'b0;
                            state=east;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north_y;
                        end
                    end

            south_y :
                begin
                    if (count==3'b001)
                        begin
                        count=3'b0;
                        state=west;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=south_y;
                        end
                    end

            east :
                begin
                    if (count==3'b111)
                        begin
                        count=3'b0;
                        state=east_y;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east;
                        end
                    end

            east_y :
                begin
                    if (count==3'b001)
                        begin
                        count=3'b0;
                        state=south;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east_y;
                        end
                    end

            west :
                begin
                    if (count==3'b111)
                        begin
                        state=west_y;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west;
                        end
                    end

            west_y :
                begin
                    if (count==3'b001)
                        begin
                        state=north;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west_y;
                        end
                    end
            endcase // case (state)
        end // always @ (state)
    end 

// The following code changes the lights to next state according the current state.

always @(state)
     begin
         case (state)
            north :
                begin
                    n_lights = 3'b001;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: north

            north_y:
                begin
                    n_lights = 3'b010;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: north_y

            south :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b001;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: north

            south_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b010;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end
                
            west :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b001;
                end // case: north

            west_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b010;
                end
                
            east :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b001;
                    w_lights = 3'b100;
                end // case: north

            east_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b010;
                    w_lights = 3'b100;
                end

            
            endcase // case (state)
     end // always @ (state)
endmodule
// END OF PROGRAM
