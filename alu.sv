module alu(input logic [3:0]alu_ctrl,
           input logic [3:0]a,
           input logic [3:0]b,
			  output logic [3:0]flags,
           output logic [3:0]f);
	 logic s0, s1, s2, cin, cout;
	 logic ovf, neg, zero, carr;
	 assign cin = alu_ctrl[0];
	 assign s0 = alu_ctrl[1];
	 assign s1 = alu_ctrl[2];
	 assign s2 = alu_ctrl[3];
    always_comb begin
        case({s2,s1,s0,cin})
            4'b0000 : {cout, f} = a;
            4'b0001 : {cout, f} = a + 1'b1;
            4'b0010 : {cout, f} = a + b;
            4'b0011 : {cout, f} = a + b + 1'b1;
            4'b0100 : {cout, f} = a + ~b;
            4'b0101 : {cout, f} = a - b;
            4'b0110 : {cout, f} = a - 1'b1;
            4'b0111 : {cout, f} = a;
            4'b1000 : {cout, f} = a & b;
            4'b1010 : {cout, f} = a | b;
            4'b1100 : {cout, f} = a ^ b;
            4'b1110 : {cout, f} = ~a;
            default : {cout, f} = 4'b0000;
        endcase
    end 
    // Hacer logica de flags
	 assign neg = f[3];
	 assign zero = (f == 4'b0000) ? 1'b1 : 1'b0;
	 assign carr = (alu_ctrl[3] == 1) & cout;
	 assign ovf = (alu_ctrl[3]==1'b0) & ~(a[3] ^ b[3] ^ alu_ctrl[0]) & (a[3] ^ f[3]); 
	 
	 assign flags = {ovf,neg,zero,carr};
 
endmodule 