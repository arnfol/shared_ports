# Shared ports module generator

## Description

Shared ports module generator is a _Python_ script, which automatically generates _SystemVerilog_ source file from *.csv* configuration table. The module is designed to share external ports of ASIC or FPGA among different internal sources and supposed to be useful for microprocessor systems and SoC.

Practical use of this module is the ease of pinout reconfiguration during the development process, thus making iterative advancement much easier.

The script was written for Python 3.6.6.

## Features

- Configurable through *.csv* table
- Configurable number of connections per one external port
- Configurable internal signals directions (input, output or bidirectional)
- Simple APB control interface 
- Automatic compression of signals into buses
- Automatic header deletion (configurable number of lines)
- Configurable default input values for internal connections 

## Configuration table

This section describes some limitations applicable to the *.csv* configuration table. 

All the signals in the *.csv* table must be one-bit signals. Signal names should follow general Verilog agreements. Signal name examples:

- signal1
- signal_a
- signal[15]

Internal connection columns should contain either an internal signal name or nothing. For each internal signal column direction column should be provided.  Direction column should contain one of the possible signal direction type:

- **i** - input, default value 0;
- **i1** - input, default value 1;
- **oi/io** - bidirectional, default input value 0;
- **oi1/io1** - bidirectional, default input value 1;
- **o** - output

The default input value is the value, which the module sets on the external connection input when a particular function is not chosen.

## Module behaviour

![Module scheme](shared_pins_scheme.png)

### AMBA APB interface

Control of the pins commutation is provided through the simple APB interface. Address of the register corresponding to a particular port depends on the port string number in the configuration table. Each register stores 4 fields with corresponding ports controls. For example, the register with address 0x00000000 consists of control fields for 4 upper signals in the table (least significant byte corresponds to the first signal).

| Signal  | Direction | Width | Description                                                  |
| ------- | --------- | ----- | ------------------------------------------------------------ |
| psel    | in        | 1     | APB slave PSEL signal. Account for slave selection.          |
| penable | in        | 1     | APB slave PENABLE signal.                                    |
| paddr   | in        | 32    | APB slave PADDR bus. Address of the register to access.      |
| pwrite  | in        | 1     | APB slave PWRITE signal. Value 1 corresponds to the write operation, value 0 corresponds to the read operation. |
| pwdata  | in        | 32    | APB slave PWDATA bus. Data for a write operation.            |
| prdata  | out       | 32    | APB slave PRDATA bus. Returned data on a read operation.     |

**Note:** APB interface do not have signal PREADY. This means that salve is always ready for operation and PREADY=1.

**Note:** Each register is aligned to 32-bit word bounds, which means 2 least significant bits of paddr bus are not used and should always be zeros.

### APB registers map

Each register is aligned to 32-bit word bounds, which means 2 least significant bits of paddr bus are not used and should always be zeros.

Register field types:

- **RW** - Read-Write field
- **WO** - Write-Only field
- **RO** - Read-Only field

#### Port select

_Address: x0000 - (Number of External Ports - 1)*4_

|   BITS       | ACCESS | RST VALUE | DESCRIPTION        |
| ------------ | ------ | --------- | ------------------ |
| 31-*24+SIZE* | RO     | 0         | Not used           |
| *24+SIZE*-0  | RW     | 0         | Port select signal |
| 24-*16+SIZE* | RO     | 0         | Not used           |
| *16+SIZE*-16 | RW     | 0         | Port select signal |
| 15-*8+SIZE*  | RO     | 0         | Not used           |
| *8+SIZE*-8   | RW     | 0         | Port select signal |
|  7-*SIZE*    | RO     | 0         | Not used           |
| *SIZE*-0     | RW     | 0         | Port select signal |

**Note:** *SIZE*=clog2(Number of Internal Connections)-1

**Note:** Address of port select registers follow the order of external signals in the table. Thus, register 0x0000 corresponds to the first signal, register 0x0004 to the second, etc.

### Peripheral cells

For each external port module provides 3 signals: *port_name*\_o, *port_name*\_oe and *port_name*_i. These signals are designed to drive peripheral cell with the following behavior:    

```
*port_name*_i = port;
if(*port_name*_oe) port = *port_name*_o;
```

![peripherial cell](shared_pins_peripherial_cell.png)

### Internal connections

Set of signals for internal connections depends on the direction and could contain just the same signals. Please note that port directions in the *SystemVerilog* module are reverse to the name postfixes ("\_i" is output, while "\_o" and "\_oe" are inputs).


## C header file
Another provided script, _gen_c_header.py_, can generate simple c header file for ease of module integration into processor system. All the script settings are passed through the main script. Only address of the module in the processor system should be either configured in the script (variable _shared_pins_apb_addr_) or changed in the generated header file.

## Synthesis

Despite the APB registers, the generated module is fully combinational, so the maximum frequency depends on the number of functions per peripheral port and also the distance on the chip between pins and connected IP cores.
