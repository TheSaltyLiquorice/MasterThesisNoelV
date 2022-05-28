package pmp_pkg;
	`ifndef pmpaddrbits
	`define pmpaddrbits 54
	`endif

	`ifndef pmp_entries
	`define pmp_entries 16
	`endif

	typedef reg[`pmpaddrbits-1:0] pmpaddr_type;
	typedef pmpaddr_type [0:`pmp_entries-1] pmpaddr_vec_type;  
	typedef reg[63:0] word64;

endpackage
