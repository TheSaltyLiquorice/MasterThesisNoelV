`define pmpaddrbits 54
//typedef reg[pmpaddrbits:0] pmpaddr_type;
//typedef pmpaddr_type [0:pmp_entries-1] pmpaddr_vec_type;  
//typedef reg[63:0] word64;
import pmp_pkg::*;

module pmp_wrapper

	#(	
	parameter pmp_check = 1 ,  
    parameter pmp_no_tor = 0, 
    parameter pmp_entries = 16,
    parameter pmp_g = 10,
    parameter pmp_msb = 55)

	(
	input bit clk300p,
	input bit rstn  ,
	input pmpaddr_vec_type pmpaddr,
	input word64 pmpcfg0 ,
	input word64 pmpcfg2,
	input bit[pmp_msb:0] address,
	input bit [1:0] acc  ,
	input bit [1:0] prv ,
	input bit mprv ,
	input bit[1:0] mpp ,
	input bit valid ,
	output bit ok
	);
	\gaisler.pmp96   #(.pmp_check    (pmp_check),
			  .pmp_no_tor   (pmp_no_tor),
			  .pmp_entries  (pmp_entries),
			  .pmp_g        (pmp_g),
			  .pmp_msb      (pmp_msb)
			 )
	 pmp_dut(
			  .clk300p      (clk300p),
			  .rstn        (rstn),
			  .pmpaddr     (pmpaddr),
			  .pmpcfg0		(pmpcfg0),
			  .pmpcfg2		(pmpcfg2),
			  .address     (address),
			  .acc         (acc),
			  .prv         (prv),
			  .mprv        (mprv),
			  .mpp         (mpp),
			  .valid       (valid),
			  .ok          (ok)
			);
endmodule
