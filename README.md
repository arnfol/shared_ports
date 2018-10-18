# Shared ports module generator

## Description

Shared ports module generator is a _Python_ script, which automatically generates _SystemVerilog_ source file from _.csv_ configuration table. The module is designed to share external ports of ASIC or FPGA among different internal sources and supposed to be useful for microprocessor systems and SoC.

Practical use of this module is the ease of pinout reconfiguration during the development process, thus making iterative advancement much easier.

## Features

* Configurable through *.csv* table
* Configurable number of connections per one external port
* Configurable internal signals directions (input, output or bidirectional)
* Simple control bus 
* Automatical compression of signals into buses
* Automatical header deletion (configurable number of lines)
* Configurable default input values for internal connections 

## Configuration table

This section describes some limitations appliable to the *.csv* configuration table. 

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

The default input value is the value, which the module sets on the external connection input when particular function is not chosen.