# Shared ports module generator

## Description

Shared ports module generator is a _Python_ script, which automatically generates _SystemVerilog_ source file from *.csv* configuration table. The module is designed to share external ports of ASIC or FPGA among different internal sources and supposed to be useful for microprocessor systems and SoC.

Practical use of this module is the ease of pinout reconfiguration during the development process, thus making iterative advancement much easier.

The script was written for Python 3.6.6.

## Features

- Configurable through *.csv* table
- Configurable number of connections per one external port
- Configurable internal signals directions (input, output or bidirectional)
- Simple control bus 
- Automatical compression of signals into buses
- Automatical header deletion (configurable number of lines)
- Configurable default input values for internal connections 

## Configuration table

This section describes some limitations applicable to the *.csv* configuration table. 

All the signals in the *.csv* table must be one-bit signals. Signal names should follow general Verilog agreements. Signal name examples:

- signal1
- signal_a
- signal[15]

Internal connection columns should contain either an internal signal name or nothing. For each internal signal column direction column should be provided.  Direction column should containt one of the possible signal direction type:

- **i** - input, default value 0;
- **i1** - input, default value 1;
- **oi/io** - bidirectional, default input value 0;
- **oi1/io1** - bidirectional, default input value 1;
- **o** - output

The default input value is the value, which the module sets on the external connection input when a particular function is not chosen.

## Module behaviour

Control of the pins commutation is provided through the *port_mode* two-dimensional bus. The most significant index stands for external port choice. The ports go in the order they are given in the configuration table (*port_mode[0]* corresponds to the first port in the table). The value of the sub-bus specifies the active internal connection.

The generated module is fully combinational, so the maximum frequency depends on the distance between pins and connected IP cores and also configuration table width.

For each external port module provides 3 signals: *port_name*\_o, *port_name*\_oe and *port_name*_i. These signals are designed to drive peripherial sell with the following behavior:    

```
*port_name*_i = port;
if(*port_name*_oe) port = *port_name*_o;
```

Set of signals for internal connections depends on the direction and could contain just the same signals. Please note that port directions in the *SystemVerilog* module are reverse to the name postfixes ("\_i" is output, while "\_o" and "\_oe" are inputs).