
/*
    This is an automatically generated file.

    Date: 2019-02-01 00:07
    Author: arnfo

    Usage:
    MUX->CMN_PORT1_0 = CMN_PORT1_0_GPIO_14;

*/

// shared_pins address
#define SHARED_PINS_ADDR 0x00000000

// ----------------------------------------------------------------
// Register types
// ----------------------------------------------------------------
#define CMN_PORT1_0_GPIO_14            ((uint32_t)0)
#define CMN_PORT1_0_CAN1_TX            ((uint32_t)1)
#define CMN_PORT1_0_I2C1_SCL           ((uint32_t)2)
#define CMN_PORT1_0_UART1_RX           ((uint32_t)3)

#define CMN_PORT1_1_GPIO_15            ((uint32_t)0)
#define CMN_PORT1_1_CAN1_RX            ((uint32_t)1)
#define CMN_PORT1_1_I2C1_SDA           ((uint32_t)2)
#define CMN_PORT1_1_UART1_TX           ((uint32_t)3)

#define CMN_PORT1_2_GPIO_12            ((uint32_t)0)
#define CMN_PORT1_2_CAN1_TX            ((uint32_t)1)
#define CMN_PORT1_2_I2C2_SCL           ((uint32_t)2)
#define CMN_PORT1_2_UART2_RX           ((uint32_t)3)

#define CMN_PORT1_3_GPIO_13            ((uint32_t)0)
#define CMN_PORT1_3_CAN1_RX            ((uint32_t)1)
#define CMN_PORT1_3_I2C2_SDA           ((uint32_t)2)
#define CMN_PORT1_3_UART2_TX           ((uint32_t)3)

#define CMN_PORT1_4_GPIO_8             ((uint32_t)0)
#define CMN_PORT1_4_CAN2_TX            ((uint32_t)1)
#define CMN_PORT1_4_I2C2_SCL           ((uint32_t)2)
#define CMN_PORT1_4_UART1_RX           ((uint32_t)3)

#define CMN_PORT1_5_GPIO_9             ((uint32_t)0)
#define CMN_PORT1_5_CAN2_RX            ((uint32_t)1)
#define CMN_PORT1_5_I2C2_SDA           ((uint32_t)2)
#define CMN_PORT1_5_UART1_TX           ((uint32_t)3)

#define CMN_PORT1_6_GPIO_10            ((uint32_t)0)
#define CMN_PORT1_6_CAN2_TX            ((uint32_t)1)
#define CMN_PORT1_6_I2C1_SCL           ((uint32_t)2)
#define CMN_PORT1_6_UART2_RX           ((uint32_t)3)

#define CMN_PORT1_7_GPIO_11            ((uint32_t)0)
#define CMN_PORT1_7_CAN2_RX            ((uint32_t)1)
#define CMN_PORT1_7_I2C1_SDA           ((uint32_t)2)
#define CMN_PORT1_7_UART2_TX           ((uint32_t)3)

#define CMN_PORT_12_GPIO_16            ((uint32_t)0)
#define CMN_PORT_12_I2C2_SCL           ((uint32_t)1)
#define CMN_PORT_12_UART2_RX           ((uint32_t)2)
#define CMN_PORT_12_SPI2_SEL           ((uint32_t)3)

#define CMN_PORT_13_GPIO_17            ((uint32_t)0)
#define CMN_PORT_13_I2C2_SDA           ((uint32_t)1)
#define CMN_PORT_13_UART2_TX           ((uint32_t)2)
#define CMN_PORT_13_SPI2_MISO          ((uint32_t)3)

#define CMN_PORT_14_GPIO_18            ((uint32_t)0)
#define CMN_PORT_14_I2C1_SCL           ((uint32_t)1)
#define CMN_PORT_14_JTAGMST_TDI        ((uint32_t)2)
#define CMN_PORT_14_SPI2_MOSI          ((uint32_t)3)

#define CMN_PORT_15_GPIO_19            ((uint32_t)0)
#define CMN_PORT_15_I2C1_SDA           ((uint32_t)1)
#define CMN_PORT_15_JTAGMST_TDO        ((uint32_t)2)
#define CMN_PORT_15_SPI2_SCK           ((uint32_t)3)

#define CMN_PORT_16_GPIO_20            ((uint32_t)0)
#define CMN_PORT_16_SPI2_SEL           ((uint32_t)1)
#define CMN_PORT_16_JTAGMST_TCK        ((uint32_t)2)
#define CMN_PORT_16_SPI1_SEL           ((uint32_t)3)

#define CMN_PORT_17_GPIO_21            ((uint32_t)0)
#define CMN_PORT_17_SPI2_MISO          ((uint32_t)1)
#define CMN_PORT_17_JTAGMST_TMS        ((uint32_t)2)
#define CMN_PORT_17_SPI1_MISO          ((uint32_t)3)

#define CMN_PORT_18_GPIO_22            ((uint32_t)0)
#define CMN_PORT_18_SPI2_MOSI          ((uint32_t)1)
#define CMN_PORT_18_UART1_RX           ((uint32_t)2)
#define CMN_PORT_18_SPI1_MOSI          ((uint32_t)3)

#define CMN_PORT_19_GPIO_23            ((uint32_t)0)
#define CMN_PORT_19_SPI2_SCK           ((uint32_t)1)
#define CMN_PORT_19_UART1_TX           ((uint32_t)2)
#define CMN_PORT_19_SPI1_SCK           ((uint32_t)3)

#define CMN_PORT_20_GPIO_24            ((uint32_t)0)
#define CMN_PORT_20_UART1_RX           ((uint32_t)1)
#define CMN_PORT_20_SPI2_SEL           ((uint32_t)2)
#define CMN_PORT_20_GPIO_4             ((uint32_t)3)

#define CMN_PORT_21_GPIO_25            ((uint32_t)0)
#define CMN_PORT_21_UART1_TX           ((uint32_t)1)
#define CMN_PORT_21_SPI2_MISO          ((uint32_t)2)
#define CMN_PORT_21_GPIO_5             ((uint32_t)3)

#define CMN_PORT_22_GPIO_26            ((uint32_t)0)
#define CMN_PORT_22_CAN1_TX            ((uint32_t)1)
#define CMN_PORT_22_SPI2_MOSI          ((uint32_t)2)
#define CMN_PORT_22_GPIO_6             ((uint32_t)3)

#define CMN_PORT_23_GPIO_27            ((uint32_t)0)
#define CMN_PORT_23_CAN1_RX            ((uint32_t)1)
#define CMN_PORT_23_SPI2_SCK           ((uint32_t)2)
#define CMN_PORT_23_GPIO_7             ((uint32_t)3)

#define CMN_PORT_24_GPIO_28            ((uint32_t)0)
#define CMN_PORT_24_UART2_RX           ((uint32_t)1)
#define CMN_PORT_24_SPI1_SEL           ((uint32_t)2)
#define CMN_PORT_24_GPIO_8             ((uint32_t)3)

#define CMN_PORT_25_GPIO_29            ((uint32_t)0)
#define CMN_PORT_25_UART2_TX           ((uint32_t)1)
#define CMN_PORT_25_SPI1_MISO          ((uint32_t)2)
#define CMN_PORT_25_GPIO_9             ((uint32_t)3)

#define CMN_PORT_26_GPIO_30            ((uint32_t)0)
#define CMN_PORT_26_CAN2_TX            ((uint32_t)1)
#define CMN_PORT_26_SPI1_MOSI          ((uint32_t)2)
#define CMN_PORT_26_GPIO_10            ((uint32_t)3)

#define CMN_PORT_27_GPIO_31            ((uint32_t)0)
#define CMN_PORT_27_CAN2_RX            ((uint32_t)1)
#define CMN_PORT_27_SPI1_SCK           ((uint32_t)2)
#define CMN_PORT_27_GPIO_11            ((uint32_t)3)

#define CMN_PORT_28_GPIO_32            ((uint32_t)0)
#define CMN_PORT_28_I2C1_SCL           ((uint32_t)1)
#define CMN_PORT_28_JTAGMST_TDI        ((uint32_t)2)
#define CMN_PORT_28_GPIO_16            ((uint32_t)3)

#define CMN_PORT_29_GPIO_33            ((uint32_t)0)
#define CMN_PORT_29_I2C1_SDA           ((uint32_t)1)
#define CMN_PORT_29_JTAGMST_TDO        ((uint32_t)2)
#define CMN_PORT_29_GPIO_17            ((uint32_t)3)

#define CMN_PORT_30_GPIO_34            ((uint32_t)0)
#define CMN_PORT_30_JTAGMST_TCK        ((uint32_t)2)
#define CMN_PORT_30_GPIO_18            ((uint32_t)3)

#define CMN_PORT_31_GPIO_35            ((uint32_t)0)
#define CMN_PORT_31_JTAGMST_TMS        ((uint32_t)2)
#define CMN_PORT_31_GPIO_19            ((uint32_t)3)

#define CMN_PORT_32_GPIO_36            ((uint32_t)0)
#define CMN_PORT_32_JTAGMST_TDI        ((uint32_t)2)

#define CMN_PORT_33_GPIO_37            ((uint32_t)0)
#define CMN_PORT_33_JTAGMST_TDO        ((uint32_t)2)

#define CMN_PORT_34_GPIO_38            ((uint32_t)0)
#define CMN_PORT_34_I2C2_SCL           ((uint32_t)1)
#define CMN_PORT_34_JTAGMST_TCK        ((uint32_t)2)

#define CMN_PORT_35_GPIO_39            ((uint32_t)0)
#define CMN_PORT_35_I2C2_SDA           ((uint32_t)1)
#define CMN_PORT_35_JTAGMST_TMS        ((uint32_t)2)

#define EXTENDED_ADDR_1_GPIO_40        ((uint32_t)0)
#define EXTENDED_ADDR_1_I2C1_SCL       ((uint32_t)1)

#define EXT_CEN_2_GPIO_41              ((uint32_t)0)
#define EXT_CEN_2_I2C1_SDA             ((uint32_t)1)

#define SP_PIN0_GPIO_42                ((uint32_t)0)
#define SP_PIN0_I2C2_SCL               ((uint32_t)1)

#define SP_PIN1_GPIO_43                ((uint32_t)0)
#define SP_PIN1_I2C2_SDA               ((uint32_t)1)



// ----------------------------------------------------------------
// Registers
// ----------------------------------------------------------------

typedef struct {

	uint32_t cmn_port1_0;
	uint32_t cmn_port1_1;
	uint32_t cmn_port1_2;
	uint32_t cmn_port1_3;
	uint32_t cmn_port1_4;
	uint32_t cmn_port1_5;
	uint32_t cmn_port1_6;
	uint32_t cmn_port1_7;
	uint32_t cmn_port_12;
	uint32_t cmn_port_13;
	uint32_t cmn_port_14;
	uint32_t cmn_port_15;
	uint32_t cmn_port_16;
	uint32_t cmn_port_17;
	uint32_t cmn_port_18;
	uint32_t cmn_port_19;
	uint32_t cmn_port_20;
	uint32_t cmn_port_21;
	uint32_t cmn_port_22;
	uint32_t cmn_port_23;
	uint32_t cmn_port_24;
	uint32_t cmn_port_25;
	uint32_t cmn_port_26;
	uint32_t cmn_port_27;
	uint32_t cmn_port_28;
	uint32_t cmn_port_29;
	uint32_t cmn_port_30;
	uint32_t cmn_port_31;
	uint32_t cmn_port_32;
	uint32_t cmn_port_33;
	uint32_t cmn_port_34;
	uint32_t cmn_port_35;
	uint32_t extended_addr_1;
	uint32_t ext_cen_2;
	uint32_t sp_pin0;
	uint32_t sp_pin1;
} mux_type;

#define MUX ((mux_type*)SHARED_PINS_ADDR)
