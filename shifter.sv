module shifter(input logic [3:0]in,
					input logic [2:0]sh_ctrl,
					output logic [3:0]out);
	always_comb begin
		case(sh_ctrl)
			3'b000 : out = in;
			3'b001 : out = {in[2:0], 1'b0};
			3'b010 : out = {in[3], in[3:1]};
			3'b011 : out = 4'b0000;
			3'b100 : out = in;
			3'b101 : out = {in[2:0],in[3]};
			3'b110 : out = {in[0], in[3:1]};
			3'b111 : out = in;
		endcase
	end
endmodule