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

### AMBA APB interface

Control of the pins commutation is provided through the simple APB interface. Address of the register corresponding to a particular port depends on the port string number in the configuration table. For example, the register with address 0x00000000 controls the uppermost port in the .csv table, the next address 0x00000004 - the second port and so on.

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

### Peripheral cells

For each external port module provides 3 signals: *port_name*\_o, *port_name*\_oe and *port_name*_i. These signals are designed to drive peripheral cell with the following behavior:    

```
*port_name*_i = port;
if(*port_name*_oe) port = *port_name*_o;
```

### Internal connections

Set of signals for internal connections depends on the direction and could contain just the same signals. Please note that port directions in the *SystemVerilog* module are reverse to the name postfixes ("\_i" is output, while "\_o" and "\_oe" are inputs).

## Synthesis

Despite the APB registers, the generated module is fully combinational, so the maximum frequency depends on the number of functions per peripheral port and also the distance on the chip between pins and connected IP cores.