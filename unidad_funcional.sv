module unidad_funcional(input logic [3:0]a,
								input logic [3:0]b,
								input logic [3:0]alu_ctrl,
								input logic [3:0]sh_ctrl,
								input logic mf,
								output logic [3:0]flags,
								output logic [3:0]out);
	logic [3:0]alu_out, sh_out;
	alu al(alu_ctrl, a, b, flags, alu_out);
	shifter sh(b, sh_ctrl, sh_out);
	always_comb begin
		out = mf ? sh_out : alu_out;
	end
endmodule