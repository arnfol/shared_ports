
/*
    This is an automatically generated file.

    Date: 2019-01-22 22:17
    Author: arnfo

    Usage:
    MUX->CMN_PORT1_0 = CMN_PORT1_0_GPIO_14;

*/

// shared_pins address
#define SHARED_PINS_ADDR 0x00000000

// ----------------------------------------------------------------
// Register types
// ----------------------------------------------------------------
#define CMN_PORT1_0_GPIO_14            = 0;
#define CMN_PORT1_0_CAN1_TX            = 1;
#define CMN_PORT1_0_I2C1_SCL           = 2;
#define CMN_PORT1_0_UART1_RX           = 3;

#define CMN_PORT1_1_GPIO_15            = 0;
#define CMN_PORT1_1_CAN1_RX            = 1;
#define CMN_PORT1_1_I2C1_SDA           = 2;
#define CMN_PORT1_1_UART1_TX           = 3;

#define CMN_PORT1_2_GPIO_12            = 0;
#define CMN_PORT1_2_CAN1_TX            = 1;
#define CMN_PORT1_2_I2C2_SCL           = 2;
#define CMN_PORT1_2_UART2_RX           = 3;

#define CMN_PORT1_3_GPIO_13            = 0;
#define CMN_PORT1_3_CAN1_RX            = 1;
#define CMN_PORT1_3_I2C2_SDA           = 2;
#define CMN_PORT1_3_UART2_TX           = 3;

#define CMN_PORT1_4_GPIO_8             = 0;
#define CMN_PORT1_4_CAN2_TX            = 1;
#define CMN_PORT1_4_I2C2_SCL           = 2;
#define CMN_PORT1_4_UART1_RX           = 3;

#define CMN_PORT1_5_GPIO_9             = 0;
#define CMN_PORT1_5_CAN2_RX            = 1;
#define CMN_PORT1_5_I2C2_SDA           = 2;
#define CMN_PORT1_5_UART1_TX           = 3;

#define CMN_PORT1_6_GPIO_10            = 0;
#define CMN_PORT1_6_CAN2_TX            = 1;
#define CMN_PORT1_6_I2C1_SCL           = 2;
#define CMN_PORT1_6_UART2_RX           = 3;

#define CMN_PORT1_7_GPIO_11            = 0;
#define CMN_PORT1_7_CAN2_RX            = 1;
#define CMN_PORT1_7_I2C1_SDA           = 2;
#define CMN_PORT1_7_UART2_TX           = 3;

#define CMN_PORT_12_GPIO_16            = 0;
#define CMN_PORT_12_I2C2_SCL           = 1;
#define CMN_PORT_12_UART2_RX           = 2;
#define CMN_PORT_12_SPI2_SEL           = 3;

#define CMN_PORT_13_GPIO_17            = 0;
#define CMN_PORT_13_I2C2_SDA           = 1;
#define CMN_PORT_13_UART2_TX           = 2;
#define CMN_PORT_13_SPI2_MISO          = 3;

#define CMN_PORT_14_GPIO_18            = 0;
#define CMN_PORT_14_I2C1_SCL           = 1;
#define CMN_PORT_14_JTAGMST_TDI        = 2;
#define CMN_PORT_14_SPI2_MOSI          = 3;

#define CMN_PORT_15_GPIO_19            = 0;
#define CMN_PORT_15_I2C1_SDA           = 1;
#define CMN_PORT_15_JTAGMST_TDO        = 2;
#define CMN_PORT_15_SPI2_SCK           = 3;

#define CMN_PORT_16_GPIO_20            = 0;
#define CMN_PORT_16_SPI2_SEL           = 1;
#define CMN_PORT_16_JTAGMST_TCK        = 2;
#define CMN_PORT_16_SPI1_SEL           = 3;

#define CMN_PORT_17_GPIO_21            = 0;
#define CMN_PORT_17_SPI2_MISO          = 1;
#define CMN_PORT_17_JTAGMST_TMS        = 2;
#define CMN_PORT_17_SPI1_MISO          = 3;

#define CMN_PORT_18_GPIO_22            = 0;
#define CMN_PORT_18_SPI2_MOSI          = 1;
#define CMN_PORT_18_UART1_RX           = 2;
#define CMN_PORT_18_SPI1_MOSI          = 3;

#define CMN_PORT_19_GPIO_23            = 0;
#define CMN_PORT_19_SPI2_SCK           = 1;
#define CMN_PORT_19_UART1_TX           = 2;
#define CMN_PORT_19_SPI1_SCK           = 3;

#define CMN_PORT_20_GPIO_24            = 0;
#define CMN_PORT_20_UART1_RX           = 1;
#define CMN_PORT_20_SPI2_SEL           = 2;
#define CMN_PORT_20_GPIO_4             = 3;

#define CMN_PORT_21_GPIO_25            = 0;
#define CMN_PORT_21_UART1_TX           = 1;
#define CMN_PORT_21_SPI2_MISO          = 2;
#define CMN_PORT_21_GPIO_5             = 3;

#define CMN_PORT_22_GPIO_26            = 0;
#define CMN_PORT_22_CAN1_TX            = 1;
#define CMN_PORT_22_SPI2_MOSI          = 2;
#define CMN_PORT_22_GPIO_6             = 3;

#define CMN_PORT_23_GPIO_27            = 0;
#define CMN_PORT_23_CAN1_RX            = 1;
#define CMN_PORT_23_SPI2_SCK           = 2;
#define CMN_PORT_23_GPIO_7             = 3;

#define CMN_PORT_24_GPIO_28            = 0;
#define CMN_PORT_24_UART2_RX           = 1;
#define CMN_PORT_24_SPI1_SEL           = 2;
#define CMN_PORT_24_GPIO_8             = 3;

#define CMN_PORT_25_GPIO_29            = 0;
#define CMN_PORT_25_UART2_TX           = 1;
#define CMN_PORT_25_SPI1_MISO          = 2;
#define CMN_PORT_25_GPIO_9             = 3;

#define CMN_PORT_26_GPIO_30            = 0;
#define CMN_PORT_26_CAN2_TX            = 1;
#define CMN_PORT_26_SPI1_MOSI          = 2;
#define CMN_PORT_26_GPIO_10            = 3;

#define CMN_PORT_27_GPIO_31            = 0;
#define CMN_PORT_27_CAN2_RX            = 1;
#define CMN_PORT_27_SPI1_SCK           = 2;
#define CMN_PORT_27_GPIO_11            = 3;

#define CMN_PORT_28_GPIO_32            = 0;
#define CMN_PORT_28_I2C1_SCL           = 1;
#define CMN_PORT_28_JTAGMST_TDI        = 2;
#define CMN_PORT_28_GPIO_16            = 3;

#define CMN_PORT_29_GPIO_33            = 0;
#define CMN_PORT_29_I2C1_SDA           = 1;
#define CMN_PORT_29_JTAGMST_TDO        = 2;
#define CMN_PORT_29_GPIO_17            = 3;

#define CMN_PORT_30_GPIO_34            = 0;
#define CMN_PORT_30_JTAGMST_TCK        = 2;
#define CMN_PORT_30_GPIO_18            = 3;

#define CMN_PORT_31_GPIO_35            = 0;
#define CMN_PORT_31_JTAGMST_TMS        = 2;
#define CMN_PORT_31_GPIO_19            = 3;

#define CMN_PORT_32_GPIO_36            = 0;
#define CMN_PORT_32_JTAGMST_TDI        = 2;

#define CMN_PORT_33_GPIO_37            = 0;
#define CMN_PORT_33_JTAGMST_TDO        = 2;

#define CMN_PORT_34_GPIO_38            = 0;
#define CMN_PORT_34_I2C2_SCL           = 1;
#define CMN_PORT_34_JTAGMST_TCK        = 2;

#define CMN_PORT_35_GPIO_39            = 0;
#define CMN_PORT_35_I2C2_SDA           = 1;
#define CMN_PORT_35_JTAGMST_TMS        = 2;

#define EXTENDED_ADDR_1_GPIO_40        = 0;
#define EXTENDED_ADDR_1_I2C1_SCL       = 1;

#define EXT_CEN_2_GPIO_41              = 0;
#define EXT_CEN_2_I2C1_SDA             = 1;

#define SP_PIN0_GPIO_42                = 0;
#define SP_PIN0_I2C2_SCL               = 1;

#define SP_PIN1_GPIO_43                = 0;
#define SP_PIN1_I2C2_SDA               = 1;



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
