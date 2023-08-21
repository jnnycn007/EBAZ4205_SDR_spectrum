-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Fri Aug 18 19:24:15 2023
-- Host        : guido-Neptune-series-i9 running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DivideBy2N_0_0_sim_netlist.vhdl
-- Design      : design_1_DivideBy2N_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DivideBy2N is
  port (
    clk_out : out STD_LOGIC;
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DivideBy2N;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DivideBy2N is
  signal \^clk_out\ : STD_LOGIC;
  signal clk_track_i_1_n_0 : STD_LOGIC;
  signal clk_track_i_2_n_0 : STD_LOGIC;
  signal clk_track_i_3_n_0 : STD_LOGIC;
  signal r_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \r_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal r_reg_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_track_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_reg[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_reg[0]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_reg[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_reg[7]_i_2\ : label is "soft_lutpair2";
begin
  clk_out <= \^clk_out\;
clk_track_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0040"
    )
        port map (
      I0 => clk_track_i_3_n_0,
      I1 => r_reg(4),
      I2 => r_reg(3),
      I3 => r_reg(1),
      I4 => \^clk_out\,
      O => clk_track_i_1_n_0
    );
clk_track_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => clk_track_i_2_n_0
    );
clk_track_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_reg(6),
      I1 => r_reg(7),
      I2 => r_reg(2),
      I3 => r_reg(5),
      I4 => r_reg(0),
      O => clk_track_i_3_n_0
    );
clk_track_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => clk_track_i_1_n_0,
      Q => \^clk_out\
    );
\r_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00F7"
    )
        port map (
      I0 => r_reg(4),
      I1 => r_reg(3),
      I2 => r_reg(1),
      I3 => r_reg(0),
      I4 => \r_reg[0]_i_2_n_0\,
      O => r_reg_0(0)
    );
\r_reg[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => r_reg(5),
      I1 => r_reg(2),
      I2 => r_reg(7),
      I3 => r_reg(6),
      O => \r_reg[0]_i_2_n_0\
    );
\r_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_reg(0),
      I1 => r_reg(1),
      O => r_reg_0(1)
    );
\r_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => r_reg(1),
      I1 => r_reg(0),
      I2 => r_reg(2),
      O => r_reg_0(2)
    );
\r_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFC0001111C000"
    )
        port map (
      I0 => r_reg(4),
      I1 => r_reg(1),
      I2 => r_reg(0),
      I3 => r_reg(2),
      I4 => r_reg(3),
      I5 => \r_reg[4]_i_2_n_0\,
      O => r_reg_0(3)
    );
\r_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800055558000"
    )
        port map (
      I0 => r_reg(3),
      I1 => r_reg(1),
      I2 => r_reg(0),
      I3 => r_reg(2),
      I4 => r_reg(4),
      I5 => \r_reg[4]_i_2_n_0\,
      O => r_reg_0(4)
    );
\r_reg[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FF55FFFFFFFFFE"
    )
        port map (
      I0 => r_reg(1),
      I1 => r_reg(6),
      I2 => r_reg(7),
      I3 => r_reg(2),
      I4 => r_reg(5),
      I5 => r_reg(0),
      O => \r_reg[4]_i_2_n_0\
    );
\r_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => r_reg(3),
      I1 => r_reg(4),
      I2 => r_reg(2),
      I3 => r_reg(0),
      I4 => r_reg(1),
      I5 => r_reg(5),
      O => r_reg_0(5)
    );
\r_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFF2000"
    )
        port map (
      I0 => r_reg(5),
      I1 => \r_reg[7]_i_2_n_0\,
      I2 => r_reg(4),
      I3 => r_reg(3),
      I4 => r_reg(6),
      O => r_reg_0(6)
    );
\r_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFFFF00800000"
    )
        port map (
      I0 => r_reg(6),
      I1 => r_reg(3),
      I2 => r_reg(4),
      I3 => \r_reg[7]_i_2_n_0\,
      I4 => r_reg(5),
      I5 => r_reg(7),
      O => r_reg_0(7)
    );
\r_reg[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => r_reg(2),
      I1 => r_reg(0),
      I2 => r_reg(1),
      O => \r_reg[7]_i_2_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(0),
      Q => r_reg(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(1),
      Q => r_reg(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(2),
      Q => r_reg(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(3),
      Q => r_reg(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(4),
      Q => r_reg(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(5),
      Q => r_reg(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(6),
      Q => r_reg(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => clk_track_i_2_n_0,
      D => r_reg_0(7),
      Q => r_reg(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    clk_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_DivideBy2N_0_0,DivideBy2N,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "DivideBy2N,Vivado 2022.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DivideBy2N
     port map (
      clk => clk,
      clk_out => clk_out,
      resetn => resetn
    );
end STRUCTURE;
