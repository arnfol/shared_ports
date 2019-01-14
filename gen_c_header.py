
import gen_shared_pins

# ------------------------------------------------------------------------------------
# script configuration
# ------------------------------------------------------------------------------------
shared_pins_apb_addr = 0x00000000
out_file = gen_shared_pins.module_name + ".h"

# ------------------------------------------------------------------------------------
# templates
# ------------------------------------------------------------------------------------
enum_str = "enum {{ {isigs} }} {psig}_opt;"
struct_str = "unsigned char {psig};"
header_template = """
/*
	This is an automatically generated file.

	Date: {date}
	Author: {author}

	Usage:
	MUX->{example_psig} = {example_psig}_opt.{example_isig};

*/

// shared_pins address
#define SHARED_PINS_ADDR {addr}

// ----------------------------------------------------------------
// Register types
// ----------------------------------------------------------------
{enums}

// ----------------------------------------------------------------
// Registers
// ----------------------------------------------------------------
typedef struct mux_type {{
    {registers}
}} mux_type;

#define MUX ((mux_type*)SHARED_PINS_ADDR)
"""


def main():
	# ------------------------------------------------------------------------------------
    # generate output file 
    # ------------------------------------------------------------------------------------
    print('Generating source file...')
    
    result = header_template.format(
        date=gen_shared_pins.date,
        author=gen_shared_pins.author,
        example_psig=,
        example_isig=,
        addr=shared_pins_apb_addr,
        enums=,
        registers=
        )

    with open(out_file,'w') as out:
        out.write(result)
    print('Done!')



if __name__ == '__main__':
	main()