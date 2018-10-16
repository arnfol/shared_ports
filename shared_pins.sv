module shared_pins (
	// internal signals
	output logic can1_rx_i,
	input        can1_tx_o,
	output logic can2_rx_i,
	input        can2_tx_o,
	input        [11:4] gpio_o,
	input        [11:4] gpio_oe,
	output logic [11:4] gpio_i,
	input        [43:16] gpio_o,
	input        [43:16] gpio_oe,
	output logic [43:16] gpio_i,
	input        i2c1_scl_o,
	input        i2c1_scl_oe,
	output logic i2c1_scl_i,
	input        i2c1_sda_o,
	input        i2c1_sda_oe,
	output logic i2c1_sda_i,
	input        i2c2_scl_o,
	input        i2c2_scl_oe,
	output logic i2c2_scl_i,
	input        i2c2_sda_o,
	input        i2c2_sda_oe,
	output logic i2c2_sda_i,
	input        jtagmst_tck_o,
	output logic jtagmst_tdi_i,
	input        jtagmst_tdo_o,
	input        jtagmst_tms_o,
	input        spi1_miso_o,
	input        spi1_miso_oe,
	output logic spi1_miso_i,
	input        spi1_mosi_o,
	input        spi1_mosi_oe,
	output logic spi1_mosi_i,
	input        spi1_sck_o,
	input        spi1_sck_oe,
	output logic spi1_sck_i,
	output logic spi1_sel_i,
	input        spi2_miso_o,
	input        spi2_miso_oe,
	output logic spi2_miso_i,
	input        spi2_mosi_o,
	input        spi2_mosi_oe,
	output logic spi2_mosi_i,
	input        spi2_sck_o,
	input        spi2_sck_oe,
	output logic spi2_sck_i,
	output logic spi2_sel_i,
	output logic uart1_rx_i,
	input        uart1_tx_o,
	output logic uart2_rx_i,
	input        uart2_tx_o,


	// peripherial signals
	output logic [7:0] cmn_port_o,
	output logic [7:0] cmn_port_oe,
	input        [7:0] cmn_port_i,
	output logic [35:12] cmn_port_o,
	output logic [35:12] cmn_port_oe,
	input        [35:12] cmn_port_i,
	output logic [1:1] extended_addr_o,
	output logic [1:1] extended_addr_oe,
	input        [1:1] extended_addr_i,
	output logic [2:2] ext_cen_o,
	output logic [2:2] ext_cen_oe,
	input        [2:2] ext_cen_i,
	output logic sp_pin0_o,
	output logic sp_pin0_oe,
	input        sp_pin0_i,
	output logic sp_pin1_o,
	output logic sp_pin1_oe,
	input        sp_pin1_i,


	input [35:0][1:0] port_mode
);

	logic [35:0][1:0] matr_o ;
	logic [35:0][1:0] matr_oe;
	logic [35:0][1:0] matr_ie;

	/*------------------------------------------------------------------------------
	--  MUX CONTROL
	------------------------------------------------------------------------------*/


	assign cmn_port_o[0] = matr_o[0][port_mode[0]]; 
	assign cmn_port_oe[0] = matr_oe[0][port_mode[0]]; 
	always_comb begin 
		matr_ie[0] = '0;
		matr_ie[0][port_mode[0]] = 1;
	end

	assign cmn_port_o[1] = matr_o[1][port_mode[1]]; 
	assign cmn_port_oe[1] = matr_oe[1][port_mode[1]]; 
	always_comb begin 
		matr_ie[1] = '0;
		matr_ie[1][port_mode[1]] = 1;
	end

	assign cmn_port_o[2] = matr_o[2][port_mode[2]]; 
	assign cmn_port_oe[2] = matr_oe[2][port_mode[2]]; 
	always_comb begin 
		matr_ie[2] = '0;
		matr_ie[2][port_mode[2]] = 1;
	end

	assign cmn_port_o[3] = matr_o[3][port_mode[3]]; 
	assign cmn_port_oe[3] = matr_oe[3][port_mode[3]]; 
	always_comb begin 
		matr_ie[3] = '0;
		matr_ie[3][port_mode[3]] = 1;
	end

	assign cmn_port_o[4] = matr_o[4][port_mode[4]]; 
	assign cmn_port_oe[4] = matr_oe[4][port_mode[4]]; 
	always_comb begin 
		matr_ie[4] = '0;
		matr_ie[4][port_mode[4]] = 1;
	end

	assign cmn_port_o[5] = matr_o[5][port_mode[5]]; 
	assign cmn_port_oe[5] = matr_oe[5][port_mode[5]]; 
	always_comb begin 
		matr_ie[5] = '0;
		matr_ie[5][port_mode[5]] = 1;
	end

	assign cmn_port_o[6] = matr_o[6][port_mode[6]]; 
	assign cmn_port_oe[6] = matr_oe[6][port_mode[6]]; 
	always_comb begin 
		matr_ie[6] = '0;
		matr_ie[6][port_mode[6]] = 1;
	end

	assign cmn_port_o[7] = matr_o[7][port_mode[7]]; 
	assign cmn_port_oe[7] = matr_oe[7][port_mode[7]]; 
	always_comb begin 
		matr_ie[7] = '0;
		matr_ie[7][port_mode[7]] = 1;
	end

	assign cmn_port_o[12] = matr_o[8][port_mode[8]]; 
	assign cmn_port_oe[12] = matr_oe[8][port_mode[8]]; 
	always_comb begin 
		matr_ie[8] = '0;
		matr_ie[8][port_mode[8]] = 1;
	end

	assign cmn_port_o[13] = matr_o[9][port_mode[9]]; 
	assign cmn_port_oe[13] = matr_oe[9][port_mode[9]]; 
	always_comb begin 
		matr_ie[9] = '0;
		matr_ie[9][port_mode[9]] = 1;
	end

	assign cmn_port_o[14] = matr_o[10][port_mode[10]]; 
	assign cmn_port_oe[14] = matr_oe[10][port_mode[10]]; 
	always_comb begin 
		matr_ie[10] = '0;
		matr_ie[10][port_mode[10]] = 1;
	end

	assign cmn_port_o[15] = matr_o[11][port_mode[11]]; 
	assign cmn_port_oe[15] = matr_oe[11][port_mode[11]]; 
	always_comb begin 
		matr_ie[11] = '0;
		matr_ie[11][port_mode[11]] = 1;
	end

	assign cmn_port_o[16] = matr_o[12][port_mode[12]]; 
	assign cmn_port_oe[16] = matr_oe[12][port_mode[12]]; 
	always_comb begin 
		matr_ie[12] = '0;
		matr_ie[12][port_mode[12]] = 1;
	end

	assign cmn_port_o[17] = matr_o[13][port_mode[13]]; 
	assign cmn_port_oe[17] = matr_oe[13][port_mode[13]]; 
	always_comb begin 
		matr_ie[13] = '0;
		matr_ie[13][port_mode[13]] = 1;
	end

	assign cmn_port_o[18] = matr_o[14][port_mode[14]]; 
	assign cmn_port_oe[18] = matr_oe[14][port_mode[14]]; 
	always_comb begin 
		matr_ie[14] = '0;
		matr_ie[14][port_mode[14]] = 1;
	end

	assign cmn_port_o[19] = matr_o[15][port_mode[15]]; 
	assign cmn_port_oe[19] = matr_oe[15][port_mode[15]]; 
	always_comb begin 
		matr_ie[15] = '0;
		matr_ie[15][port_mode[15]] = 1;
	end

	assign cmn_port_o[20] = matr_o[16][port_mode[16]]; 
	assign cmn_port_oe[20] = matr_oe[16][port_mode[16]]; 
	always_comb begin 
		matr_ie[16] = '0;
		matr_ie[16][port_mode[16]] = 1;
	end

	assign cmn_port_o[21] = matr_o[17][port_mode[17]]; 
	assign cmn_port_oe[21] = matr_oe[17][port_mode[17]]; 
	always_comb begin 
		matr_ie[17] = '0;
		matr_ie[17][port_mode[17]] = 1;
	end

	assign cmn_port_o[22] = matr_o[18][port_mode[18]]; 
	assign cmn_port_oe[22] = matr_oe[18][port_mode[18]]; 
	always_comb begin 
		matr_ie[18] = '0;
		matr_ie[18][port_mode[18]] = 1;
	end

	assign cmn_port_o[23] = matr_o[19][port_mode[19]]; 
	assign cmn_port_oe[23] = matr_oe[19][port_mode[19]]; 
	always_comb begin 
		matr_ie[19] = '0;
		matr_ie[19][port_mode[19]] = 1;
	end

	assign cmn_port_o[24] = matr_o[20][port_mode[20]]; 
	assign cmn_port_oe[24] = matr_oe[20][port_mode[20]]; 
	always_comb begin 
		matr_ie[20] = '0;
		matr_ie[20][port_mode[20]] = 1;
	end

	assign cmn_port_o[25] = matr_o[21][port_mode[21]]; 
	assign cmn_port_oe[25] = matr_oe[21][port_mode[21]]; 
	always_comb begin 
		matr_ie[21] = '0;
		matr_ie[21][port_mode[21]] = 1;
	end

	assign cmn_port_o[26] = matr_o[22][port_mode[22]]; 
	assign cmn_port_oe[26] = matr_oe[22][port_mode[22]]; 
	always_comb begin 
		matr_ie[22] = '0;
		matr_ie[22][port_mode[22]] = 1;
	end

	assign cmn_port_o[27] = matr_o[23][port_mode[23]]; 
	assign cmn_port_oe[27] = matr_oe[23][port_mode[23]]; 
	always_comb begin 
		matr_ie[23] = '0;
		matr_ie[23][port_mode[23]] = 1;
	end

	assign cmn_port_o[28] = matr_o[24][port_mode[24]]; 
	assign cmn_port_oe[28] = matr_oe[24][port_mode[24]]; 
	always_comb begin 
		matr_ie[24] = '0;
		matr_ie[24][port_mode[24]] = 1;
	end

	assign cmn_port_o[29] = matr_o[25][port_mode[25]]; 
	assign cmn_port_oe[29] = matr_oe[25][port_mode[25]]; 
	always_comb begin 
		matr_ie[25] = '0;
		matr_ie[25][port_mode[25]] = 1;
	end

	assign cmn_port_o[30] = matr_o[26][port_mode[26]]; 
	assign cmn_port_oe[30] = matr_oe[26][port_mode[26]]; 
	always_comb begin 
		matr_ie[26] = '0;
		matr_ie[26][port_mode[26]] = 1;
	end

	assign cmn_port_o[31] = matr_o[27][port_mode[27]]; 
	assign cmn_port_oe[31] = matr_oe[27][port_mode[27]]; 
	always_comb begin 
		matr_ie[27] = '0;
		matr_ie[27][port_mode[27]] = 1;
	end

	assign cmn_port_o[32] = matr_o[28][port_mode[28]]; 
	assign cmn_port_oe[32] = matr_oe[28][port_mode[28]]; 
	always_comb begin 
		matr_ie[28] = '0;
		matr_ie[28][port_mode[28]] = 1;
	end

	assign cmn_port_o[33] = matr_o[29][port_mode[29]]; 
	assign cmn_port_oe[33] = matr_oe[29][port_mode[29]]; 
	always_comb begin 
		matr_ie[29] = '0;
		matr_ie[29][port_mode[29]] = 1;
	end

	assign cmn_port_o[34] = matr_o[30][port_mode[30]]; 
	assign cmn_port_oe[34] = matr_oe[30][port_mode[30]]; 
	always_comb begin 
		matr_ie[30] = '0;
		matr_ie[30][port_mode[30]] = 1;
	end

	assign cmn_port_o[35] = matr_o[31][port_mode[31]]; 
	assign cmn_port_oe[35] = matr_oe[31][port_mode[31]]; 
	always_comb begin 
		matr_ie[31] = '0;
		matr_ie[31][port_mode[31]] = 1;
	end

	assign extended_addr_o[1] = matr_o[32][port_mode[32]]; 
	assign extended_addr_oe[1] = matr_oe[32][port_mode[32]]; 
	always_comb begin 
		matr_ie[32] = '0;
		matr_ie[32][port_mode[32]] = 1;
	end

	assign ext_cen_o[2] = matr_o[33][port_mode[33]]; 
	assign ext_cen_oe[2] = matr_oe[33][port_mode[33]]; 
	always_comb begin 
		matr_ie[33] = '0;
		matr_ie[33][port_mode[33]] = 1;
	end

	assign sp_pin0_o = matr_o[34][port_mode[34]]; 
	assign sp_pin0_oe = matr_oe[34][port_mode[34]]; 
	always_comb begin 
		matr_ie[34] = '0;
		matr_ie[34][port_mode[34]] = 1;
	end

	assign sp_pin1_o = matr_o[35][port_mode[35]]; 
	assign sp_pin1_oe = matr_oe[35][port_mode[35]]; 
	always_comb begin 
		matr_ie[35] = '0;
		matr_ie[35][port_mode[35]] = 1;
	end


	/*------------------------------------------------------------------------------
	--  MUX CONNECTIONS
	------------------------------------------------------------------------------*/

	always_comb begin
		can1_rx_i = 0;
		can2_rx_i = 0;
		gpio_i[4] = 0;
		gpio_i[5] = 0;
		gpio_i[6] = 0;
		gpio_i[7] = 0;
		gpio_i[8] = 0;
		gpio_i[9] = 0;
		gpio_i[10] = 0;
		gpio_i[11] = 0;
		gpio_i[16] = 0;
		gpio_i[17] = 0;
		gpio_i[18] = 0;
		gpio_i[19] = 0;
		gpio_i[20] = 0;
		gpio_i[21] = 0;
		gpio_i[22] = 0;
		gpio_i[23] = 0;
		gpio_i[24] = 0;
		gpio_i[25] = 0;
		gpio_i[26] = 0;
		gpio_i[27] = 0;
		gpio_i[28] = 0;
		gpio_i[29] = 0;
		gpio_i[30] = 0;
		gpio_i[31] = 0;
		gpio_i[32] = 0;
		gpio_i[33] = 0;
		gpio_i[34] = 0;
		gpio_i[35] = 0;
		gpio_i[36] = 0;
		gpio_i[37] = 0;
		gpio_i[38] = 0;
		gpio_i[39] = 0;
		gpio_i[40] = 0;
		gpio_i[41] = 0;
		gpio_i[42] = 0;
		gpio_i[43] = 0;
		i2c1_scl_i = 0;
		i2c1_sda_i = 0;
		i2c2_scl_i = 0;
		i2c2_sda_i = 0;
		jtagmst_tdi_i = 0;
		spi1_miso_i = 0;
		spi1_mosi_i = 0;
		spi1_sck_i = 0;
		spi1_sel_i = 0;
		spi2_miso_i = 0;
		spi2_mosi_i = 0;
		spi2_sck_i = 0;
		spi2_sel_i = 0;
		uart1_rx_i = 0;
		uart2_rx_i = 0;


		matr_o[0] = {gpio_o[4], can1_tx_o, i2c1_scl_o, 1'b0};
		matr_oe[0] = {gpio_oe[4], 1'b1, i2c1_scl_oe, 1'b0};
		if(matr_ie[0][0]) gpio_i[4] = cmn_port_i[0];
		if(matr_ie[0][2]) i2c1_scl_i = cmn_port_i[0];
		if(matr_ie[0][3]) uart1_rx_i = cmn_port_i[0];

		matr_o[1] = {gpio_o[5], 1'b0, i2c1_sda_o, uart1_tx_o};
		matr_oe[1] = {gpio_oe[5], 1'b0, i2c1_sda_oe, 1'b1};
		if(matr_ie[1][0]) gpio_i[5] = cmn_port_i[1];
		if(matr_ie[1][1]) can1_rx_i = cmn_port_i[1];
		if(matr_ie[1][2]) i2c1_sda_i = cmn_port_i[1];

		matr_o[2] = {gpio_o[6], can1_tx_o, i2c2_scl_o, 1'b0};
		matr_oe[2] = {gpio_oe[6], 1'b1, i2c2_scl_oe, 1'b0};
		if(matr_ie[2][0]) gpio_i[6] = cmn_port_i[2];
		if(matr_ie[2][2]) i2c2_scl_i = cmn_port_i[2];
		if(matr_ie[2][3]) uart2_rx_i = cmn_port_i[2];

		matr_o[3] = {gpio_o[7], 1'b0, i2c2_sda_o, uart2_tx_o};
		matr_oe[3] = {gpio_oe[7], 1'b0, i2c2_sda_oe, 1'b1};
		if(matr_ie[3][0]) gpio_i[7] = cmn_port_i[3];
		if(matr_ie[3][1]) can1_rx_i = cmn_port_i[3];
		if(matr_ie[3][2]) i2c2_sda_i = cmn_port_i[3];

		matr_o[4] = {gpio_o[8], can2_tx_o, i2c2_scl_o, 1'b0};
		matr_oe[4] = {gpio_oe[8], 1'b1, i2c2_scl_oe, 1'b0};
		if(matr_ie[4][0]) gpio_i[8] = cmn_port_i[4];
		if(matr_ie[4][2]) i2c2_scl_i = cmn_port_i[4];
		if(matr_ie[4][3]) uart1_rx_i = cmn_port_i[4];

		matr_o[5] = {gpio_o[9], 1'b0, i2c2_sda_o, uart1_tx_o};
		matr_oe[5] = {gpio_oe[9], 1'b0, i2c2_sda_oe, 1'b1};
		if(matr_ie[5][0]) gpio_i[9] = cmn_port_i[5];
		if(matr_ie[5][1]) can2_rx_i = cmn_port_i[5];
		if(matr_ie[5][2]) i2c2_sda_i = cmn_port_i[5];

		matr_o[6] = {gpio_o[10], can2_tx_o, i2c1_scl_o, 1'b0};
		matr_oe[6] = {gpio_oe[10], 1'b1, i2c1_scl_oe, 1'b0};
		if(matr_ie[6][0]) gpio_i[10] = cmn_port_i[6];
		if(matr_ie[6][2]) i2c1_scl_i = cmn_port_i[6];
		if(matr_ie[6][3]) uart2_rx_i = cmn_port_i[6];

		matr_o[7] = {gpio_o[11], 1'b0, i2c1_sda_o, uart2_tx_o};
		matr_oe[7] = {gpio_oe[11], 1'b0, i2c1_sda_oe, 1'b1};
		if(matr_ie[7][0]) gpio_i[11] = cmn_port_i[7];
		if(matr_ie[7][1]) can2_rx_i = cmn_port_i[7];
		if(matr_ie[7][2]) i2c1_sda_i = cmn_port_i[7];

		matr_o[8] = {gpio_o[16], i2c2_scl_o, 1'b0, 1'b0};
		matr_oe[8] = {gpio_oe[16], i2c2_scl_oe, 1'b0, 1'b0};
		if(matr_ie[8][0]) gpio_i[16] = cmn_port_i[12];
		if(matr_ie[8][1]) i2c2_scl_i = cmn_port_i[12];
		if(matr_ie[8][2]) uart2_rx_i = cmn_port_i[12];
		if(matr_ie[8][3]) spi2_sel_i = cmn_port_i[12];

		matr_o[9] = {gpio_o[17], i2c2_sda_o, uart2_tx_o, spi2_miso_o};
		matr_oe[9] = {gpio_oe[17], i2c2_sda_oe, 1'b1, spi2_miso_oe};
		if(matr_ie[9][0]) gpio_i[17] = cmn_port_i[13];
		if(matr_ie[9][1]) i2c2_sda_i = cmn_port_i[13];
		if(matr_ie[9][3]) spi2_miso_i = cmn_port_i[13];

		matr_o[10] = {gpio_o[18], i2c1_scl_o, 1'b0, spi2_mosi_o};
		matr_oe[10] = {gpio_oe[18], i2c1_scl_oe, 1'b0, spi2_mosi_oe};
		if(matr_ie[10][0]) gpio_i[18] = cmn_port_i[14];
		if(matr_ie[10][1]) i2c1_scl_i = cmn_port_i[14];
		if(matr_ie[10][2]) jtagmst_tdi_i = cmn_port_i[14];
		if(matr_ie[10][3]) spi2_mosi_i = cmn_port_i[14];

		matr_o[11] = {gpio_o[19], i2c1_sda_o, jtagmst_tdo_o, spi2_sck_o};
		matr_oe[11] = {gpio_oe[19], i2c1_sda_oe, 1'b1, spi2_sck_oe};
		if(matr_ie[11][0]) gpio_i[19] = cmn_port_i[15];
		if(matr_ie[11][1]) i2c1_sda_i = cmn_port_i[15];
		if(matr_ie[11][3]) spi2_sck_i = cmn_port_i[15];

		matr_o[12] = {gpio_o[20], 1'b0, jtagmst_tck_o, 1'b0};
		matr_oe[12] = {gpio_oe[20], 1'b0, 1'b1, 1'b0};
		if(matr_ie[12][0]) gpio_i[20] = cmn_port_i[16];
		if(matr_ie[12][1]) spi2_sel_i = cmn_port_i[16];
		if(matr_ie[12][3]) spi1_sel_i = cmn_port_i[16];

		matr_o[13] = {gpio_o[21], spi2_miso_o, jtagmst_tms_o, spi1_miso_o};
		matr_oe[13] = {gpio_oe[21], spi2_miso_oe, 1'b1, spi1_miso_oe};
		if(matr_ie[13][0]) gpio_i[21] = cmn_port_i[17];
		if(matr_ie[13][1]) spi2_miso_i = cmn_port_i[17];
		if(matr_ie[13][3]) spi1_miso_i = cmn_port_i[17];

		matr_o[14] = {gpio_o[22], spi2_mosi_o, 1'b0, spi1_mosi_o};
		matr_oe[14] = {gpio_oe[22], spi2_mosi_oe, 1'b0, spi1_mosi_oe};
		if(matr_ie[14][0]) gpio_i[22] = cmn_port_i[18];
		if(matr_ie[14][1]) spi2_mosi_i = cmn_port_i[18];
		if(matr_ie[14][2]) uart1_rx_i = cmn_port_i[18];
		if(matr_ie[14][3]) spi1_mosi_i = cmn_port_i[18];

		matr_o[15] = {gpio_o[23], spi2_sck_o, uart1_tx_o, spi1_sck_o};
		matr_oe[15] = {gpio_oe[23], spi2_sck_oe, 1'b1, spi1_sck_oe};
		if(matr_ie[15][0]) gpio_i[23] = cmn_port_i[19];
		if(matr_ie[15][1]) spi2_sck_i = cmn_port_i[19];
		if(matr_ie[15][3]) spi1_sck_i = cmn_port_i[19];

		matr_o[16] = {gpio_o[24], 1'b0, 1'b0, gpio_o[4]};
		matr_oe[16] = {gpio_oe[24], 1'b0, 1'b0, gpio_oe[4]};
		if(matr_ie[16][0]) gpio_i[24] = cmn_port_i[20];
		if(matr_ie[16][1]) uart1_rx_i = cmn_port_i[20];
		if(matr_ie[16][2]) spi2_sel_i = cmn_port_i[20];
		if(matr_ie[16][3]) gpio_i[4] = cmn_port_i[20];

		matr_o[17] = {gpio_o[25], uart1_tx_o, spi2_miso_o, gpio_o[5]};
		matr_oe[17] = {gpio_oe[25], 1'b1, spi2_miso_oe, gpio_oe[5]};
		if(matr_ie[17][0]) gpio_i[25] = cmn_port_i[21];
		if(matr_ie[17][2]) spi2_miso_i = cmn_port_i[21];
		if(matr_ie[17][3]) gpio_i[5] = cmn_port_i[21];

		matr_o[18] = {gpio_o[26], can1_tx_o, spi2_mosi_o, gpio_o[6]};
		matr_oe[18] = {gpio_oe[26], 1'b1, spi2_mosi_oe, gpio_oe[6]};
		if(matr_ie[18][0]) gpio_i[26] = cmn_port_i[22];
		if(matr_ie[18][2]) spi2_mosi_i = cmn_port_i[22];
		if(matr_ie[18][3]) gpio_i[6] = cmn_port_i[22];

		matr_o[19] = {gpio_o[27], 1'b0, spi2_sck_o, gpio_o[7]};
		matr_oe[19] = {gpio_oe[27], 1'b0, spi2_sck_oe, gpio_oe[7]};
		if(matr_ie[19][0]) gpio_i[27] = cmn_port_i[23];
		if(matr_ie[19][1]) can1_rx_i = cmn_port_i[23];
		if(matr_ie[19][2]) spi2_sck_i = cmn_port_i[23];
		if(matr_ie[19][3]) gpio_i[7] = cmn_port_i[23];

		matr_o[20] = {gpio_o[28], 1'b0, 1'b0, gpio_o[8]};
		matr_oe[20] = {gpio_oe[28], 1'b0, 1'b0, gpio_oe[8]};
		if(matr_ie[20][0]) gpio_i[28] = cmn_port_i[24];
		if(matr_ie[20][1]) uart2_rx_i = cmn_port_i[24];
		if(matr_ie[20][2]) spi1_sel_i = cmn_port_i[24];
		if(matr_ie[20][3]) gpio_i[8] = cmn_port_i[24];

		matr_o[21] = {gpio_o[29], uart2_tx_o, spi1_miso_o, gpio_o[9]};
		matr_oe[21] = {gpio_oe[29], 1'b1, spi1_miso_oe, gpio_oe[9]};
		if(matr_ie[21][0]) gpio_i[29] = cmn_port_i[25];
		if(matr_ie[21][2]) spi1_miso_i = cmn_port_i[25];
		if(matr_ie[21][3]) gpio_i[9] = cmn_port_i[25];

		matr_o[22] = {gpio_o[30], can2_tx_o, spi1_mosi_o, gpio_o[10]};
		matr_oe[22] = {gpio_oe[30], 1'b1, spi1_mosi_oe, gpio_oe[10]};
		if(matr_ie[22][0]) gpio_i[30] = cmn_port_i[26];
		if(matr_ie[22][2]) spi1_mosi_i = cmn_port_i[26];
		if(matr_ie[22][3]) gpio_i[10] = cmn_port_i[26];

		matr_o[23] = {gpio_o[31], 1'b0, spi1_sck_o, gpio_o[11]};
		matr_oe[23] = {gpio_oe[31], 1'b0, spi1_sck_oe, gpio_oe[11]};
		if(matr_ie[23][0]) gpio_i[31] = cmn_port_i[27];
		if(matr_ie[23][1]) can2_rx_i = cmn_port_i[27];
		if(matr_ie[23][2]) spi1_sck_i = cmn_port_i[27];
		if(matr_ie[23][3]) gpio_i[11] = cmn_port_i[27];

		matr_o[24] = {gpio_o[32], i2c1_scl_o, 1'b0, gpio_o[16]};
		matr_oe[24] = {gpio_oe[32], i2c1_scl_oe, 1'b0, gpio_oe[16]};
		if(matr_ie[24][0]) gpio_i[32] = cmn_port_i[28];
		if(matr_ie[24][1]) i2c1_scl_i = cmn_port_i[28];
		if(matr_ie[24][2]) jtagmst_tdi_i = cmn_port_i[28];
		if(matr_ie[24][3]) gpio_i[16] = cmn_port_i[28];

		matr_o[25] = {gpio_o[33], i2c1_sda_o, jtagmst_tdo_o, gpio_o[17]};
		matr_oe[25] = {gpio_oe[33], i2c1_sda_oe, 1'b1, gpio_oe[17]};
		if(matr_ie[25][0]) gpio_i[33] = cmn_port_i[29];
		if(matr_ie[25][1]) i2c1_sda_i = cmn_port_i[29];
		if(matr_ie[25][3]) gpio_i[17] = cmn_port_i[29];

		matr_o[26] = {gpio_o[34], 1'b0, jtagmst_tck_o, gpio_o[18]};
		matr_oe[26] = {gpio_oe[34], 1'b0, 1'b1, gpio_oe[18]};
		if(matr_ie[26][0]) gpio_i[34] = cmn_port_i[30];
		if(matr_ie[26][3]) gpio_i[18] = cmn_port_i[30];

		matr_o[27] = {gpio_o[35], 1'b0, jtagmst_tms_o, gpio_o[19]};
		matr_oe[27] = {gpio_oe[35], 1'b0, 1'b1, gpio_oe[19]};
		if(matr_ie[27][0]) gpio_i[35] = cmn_port_i[31];
		if(matr_ie[27][3]) gpio_i[19] = cmn_port_i[31];

		matr_o[28] = {gpio_o[36], 1'b0, 1'b0, 1'b0};
		matr_oe[28] = {gpio_oe[36], 1'b0, 1'b0, 1'b0};
		if(matr_ie[28][0]) gpio_i[36] = cmn_port_i[32];
		if(matr_ie[28][2]) jtagmst_tdi_i = cmn_port_i[32];

		matr_o[29] = {gpio_o[37], 1'b0, jtagmst_tdo_o, 1'b0};
		matr_oe[29] = {gpio_oe[37], 1'b0, 1'b1, 1'b0};
		if(matr_ie[29][0]) gpio_i[37] = cmn_port_i[33];

		matr_o[30] = {gpio_o[38], i2c2_scl_o, jtagmst_tck_o, 1'b0};
		matr_oe[30] = {gpio_oe[38], i2c2_scl_oe, 1'b1, 1'b0};
		if(matr_ie[30][0]) gpio_i[38] = cmn_port_i[34];
		if(matr_ie[30][1]) i2c2_scl_i = cmn_port_i[34];

		matr_o[31] = {gpio_o[39], i2c2_sda_o, jtagmst_tms_o, 1'b0};
		matr_oe[31] = {gpio_oe[39], i2c2_sda_oe, 1'b1, 1'b0};
		if(matr_ie[31][0]) gpio_i[39] = cmn_port_i[35];
		if(matr_ie[31][1]) i2c2_sda_i = cmn_port_i[35];

		matr_o[32] = {gpio_o[40], i2c1_scl_o, 1'b0, 1'b0};
		matr_oe[32] = {gpio_oe[40], i2c1_scl_oe, 1'b0, 1'b0};
		if(matr_ie[32][0]) gpio_i[40] = extended_addr_i[1];
		if(matr_ie[32][1]) i2c1_scl_i = extended_addr_i[1];

		matr_o[33] = {gpio_o[41], i2c1_sda_o, 1'b0, 1'b0};
		matr_oe[33] = {gpio_oe[41], i2c1_sda_oe, 1'b0, 1'b0};
		if(matr_ie[33][0]) gpio_i[41] = ext_cen_i[2];
		if(matr_ie[33][1]) i2c1_sda_i = ext_cen_i[2];

		matr_o[34] = {gpio_o[42], i2c2_scl_o, 1'b0, 1'b0};
		matr_oe[34] = {gpio_oe[42], i2c2_scl_oe, 1'b0, 1'b0};
		if(matr_ie[34][0]) gpio_i[42] = sp_pin0_i;
		if(matr_ie[34][1]) i2c2_scl_i = sp_pin0_i;

		matr_o[35] = {gpio_o[43], i2c2_sda_o, 1'b0, 1'b0};
		matr_oe[35] = {gpio_oe[43], i2c2_sda_oe, 1'b0, 1'b0};
		if(matr_ie[35][0]) gpio_i[43] = sp_pin1_i;
		if(matr_ie[35][1]) i2c2_sda_i = sp_pin1_i;


	end 

endmodule