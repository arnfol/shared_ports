
/*
    This is an automatically generated file.

    Date: 2019-01-17 01:27
    Author: arnfo

    Usage:
    MUX->cmn_port1_0 = cmn_port1_0_opt.gpio_14;

*/

// shared_pins address
#define SHARED_PINS_ADDR 0x00000000

// ----------------------------------------------------------------
// Register types
// ----------------------------------------------------------------

enum { gpio_14, can1_tx, i2c1_scl, uart1_rx } cmn_port1_0_opt;
enum { gpio_15, can1_rx, i2c1_sda, uart1_tx } cmn_port1_1_opt;
enum { gpio_12, can1_tx, i2c2_scl, uart2_rx } cmn_port1_2_opt;
enum { gpio_13, can1_rx, i2c2_sda, uart2_tx } cmn_port1_3_opt;
enum { gpio_8, can2_tx, i2c2_scl, uart1_rx } cmn_port1_4_opt;
enum { gpio_9, can2_rx, i2c2_sda, uart1_tx } cmn_port1_5_opt;
enum { gpio_10, can2_tx, i2c1_scl, uart2_rx } cmn_port1_6_opt;
enum { gpio_11, can2_rx, i2c1_sda, uart2_tx } cmn_port1_7_opt;
enum { gpio_16, i2c2_scl, uart2_rx, spi2_sel } cmn_port_12_opt;
enum { gpio_17, i2c2_sda, uart2_tx, spi2_miso } cmn_port_13_opt;
enum { gpio_18, i2c1_scl, jtagmst_tdi, spi2_mosi } cmn_port_14_opt;
enum { gpio_19, i2c1_sda, jtagmst_tdo, spi2_sck } cmn_port_15_opt;
enum { gpio_20, spi2_sel, jtagmst_tck, spi1_sel } cmn_port_16_opt;
enum { gpio_21, spi2_miso, jtagmst_tms, spi1_miso } cmn_port_17_opt;
enum { gpio_22, spi2_mosi, uart1_rx, spi1_mosi } cmn_port_18_opt;
enum { gpio_23, spi2_sck, uart1_tx, spi1_sck } cmn_port_19_opt;
enum { gpio_24, uart1_rx, spi2_sel, gpio_4 } cmn_port_20_opt;
enum { gpio_25, uart1_tx, spi2_miso, gpio_5 } cmn_port_21_opt;
enum { gpio_26, can1_tx, spi2_mosi, gpio_6 } cmn_port_22_opt;
enum { gpio_27, can1_rx, spi2_sck, gpio_7 } cmn_port_23_opt;
enum { gpio_28, uart2_rx, spi1_sel, gpio_8 } cmn_port_24_opt;
enum { gpio_29, uart2_tx, spi1_miso, gpio_9 } cmn_port_25_opt;
enum { gpio_30, can2_tx, spi1_mosi, gpio_10 } cmn_port_26_opt;
enum { gpio_31, can2_rx, spi1_sck, gpio_11 } cmn_port_27_opt;
enum { gpio_32, i2c1_scl, jtagmst_tdi, gpio_16 } cmn_port_28_opt;
enum { gpio_33, i2c1_sda, jtagmst_tdo, gpio_17 } cmn_port_29_opt;
enum { gpio_34, jtagmst_tck, gpio_18 } cmn_port_30_opt;
enum { gpio_35, jtagmst_tms, gpio_19 } cmn_port_31_opt;
enum { gpio_36, jtagmst_tdi } cmn_port_32_opt;
enum { gpio_37, jtagmst_tdo } cmn_port_33_opt;
enum { gpio_38, i2c2_scl, jtagmst_tck } cmn_port_34_opt;
enum { gpio_39, i2c2_sda, jtagmst_tms } cmn_port_35_opt;
enum { gpio_40, i2c1_scl } extended_addr_1_opt;
enum { gpio_41, i2c1_sda } ext_cen_2_opt;
enum { gpio_42, i2c2_scl } sp_pin0_opt;
enum { gpio_43, i2c2_sda } sp_pin1_opt;

// ----------------------------------------------------------------
// Registers
// ----------------------------------------------------------------

typedef struct mux_type {

	unsigned char cmn_port1_0;
	unsigned char cmn_port1_1;
	unsigned char cmn_port1_2;
	unsigned char cmn_port1_3;
	unsigned char cmn_port1_4;
	unsigned char cmn_port1_5;
	unsigned char cmn_port1_6;
	unsigned char cmn_port1_7;
	unsigned char cmn_port_12;
	unsigned char cmn_port_13;
	unsigned char cmn_port_14;
	unsigned char cmn_port_15;
	unsigned char cmn_port_16;
	unsigned char cmn_port_17;
	unsigned char cmn_port_18;
	unsigned char cmn_port_19;
	unsigned char cmn_port_20;
	unsigned char cmn_port_21;
	unsigned char cmn_port_22;
	unsigned char cmn_port_23;
	unsigned char cmn_port_24;
	unsigned char cmn_port_25;
	unsigned char cmn_port_26;
	unsigned char cmn_port_27;
	unsigned char cmn_port_28;
	unsigned char cmn_port_29;
	unsigned char cmn_port_30;
	unsigned char cmn_port_31;
	unsigned char cmn_port_32;
	unsigned char cmn_port_33;
	unsigned char cmn_port_34;
	unsigned char cmn_port_35;
	unsigned char extended_addr_1;
	unsigned char ext_cen_2;
	unsigned char sp_pin0;
	unsigned char sp_pin1;
} mux_type;

#define MUX ((mux_type*)SHARED_PINS_ADDR)
