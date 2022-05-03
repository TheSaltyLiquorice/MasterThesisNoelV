library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.riscv.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.noelv.all;
use gaisler.noelvint.all;


entity pmp96 is
  generic (
    pmp_check    : integer range 0  to 1   := 1;        -- Actually do PMP check?
    pmp_no_tor   : integer range 0  to 1   := 1;        -- Disable PMP TOR
    pmp_entries  : integer range 0  to 16  := 16;       -- Implemented PMP registers
    pmp_g        : integer range 1  to 32  := 1;        -- PMP grain is 2^(pmp_g + 2) bytes
    pmp_msb      : integer range 15 to 55  := 31        -- High bit for PMP checks
  );
  port (
    clk300p     : in  std_ulogic;       -- clk
    rstn        : in  std_ulogic;       -- active low reset
--    csr         : in  csr_reg_type;
	pmpaddr : in pmpaddr_vec_type;
	pmpcfg0 : in word64;
	pmpcfg2 : in word64;
    -- PMP check
    address     : in  std_logic_vector(pmp_msb downto 0);
    acc         : in  std_logic_vector(1 downto 0); -- read, write, execute
    prv         : in  std_logic_vector(PRIV_LVL_M'range); -- 00 U, 01 S, 11 M
    mprv        : in  std_ulogic;
    mpp         : in  std_logic_vector(PRIV_LVL_M'range); -- 00 U, 01 S, 11 M
    valid       : in  std_logic;
    ok          : out std_logic := '0'
  );  
end;

architecture rtl of pmp96 is
signal precalc_res_sig : pmp_precalc_vec(0 to pmp_entries -1 );
begin
  process (clk300p)
    variable xc     : std_logic;
    variable xc_tmp : std_logic;
  begin
    if rising_edge(clk300p) then

      if pmp_check = 1 then

        pmp_unit(prv,
                precalc_res_sig,
                pmpcfg0,
                pmpcfg2,
                mprv,
                mpp,
                address,
                acc,
                valid,
                xc,
                pmp_entries,
                pmp_no_tor,
                pmp_g,
                pmp_msb);
	--			hit_prio_var);
      end if;
   	  ok    <= not xc;
      if rstn = '0' then
        ok    <= '0';
      end if;
    end if;

  end process;
	process(pmpcfg0, pmpcfg2, pmpaddr)
	
	variable precalc_res : pmp_precalc_vec(0 to pmp_entries - 1);
	begin
      pmp_precalc(pmpaddr,
                    pmpcfg0,
                    pmpcfg2,
                    precalc_res,
                    pmp_entries,
                    pmp_no_tor,
                    pmp_g,
					pmp_msb);
	precalc_res_sig <= precalc_res;
	end process;
end rtl;






