module archivo_reg(input logic we,
						 input logic clk,
						 input logic [1:0]a1,
						 input logic [1:0]a2,
						 input logic [1:0]a3,
						 input logic [3:0]d3,
						 output logic [3:0]d1,
						 output logic [3:0]d2);
	logic [3:0] mem[3:0];

	assign d1 = mem[a1];
	assign d2 = mem[a2];
	always_ff @(posedge clk)
		if (we) begin
			mem[a3] <= d3;	
		end
endmodule 