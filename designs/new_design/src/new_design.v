module new_design (clk, rst, a, q);
    input clk, rst;
    input a;
    output reg q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //Reset logic goes here.
            q <= 1'b0;
        end
        else begin
            //Sequential logic goes here.
            q <= !a;
        end
    end
endmodule
