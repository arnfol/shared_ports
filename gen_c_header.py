
import gen_shared_pins

# ------------------------------------------------------------------------------------
# script configuration
# ------------------------------------------------------------------------------------
shared_pins_apb_addr = "0x00000000"
out_file = gen_shared_pins.module_name + ".h"

# ------------------------------------------------------------------------------------
# templates
# ------------------------------------------------------------------------------------
define_str = "#define {define:30} = {number};"
struct_str = "unsigned char {psig};"
header_template = """
/*
    This is an automatically generated file.

    Date: {date}
    Author: {author}

    Usage:
    MUX->{example_psig} = {example_psig}_{example_isig};

*/

// shared_pins address
#define SHARED_PINS_ADDR {addr}

// ----------------------------------------------------------------
// Register types
// ----------------------------------------------------------------
{constants}

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
    # read table
    # ------------------------------------------------------------------------------------
    psig_list, isig_list = gen_shared_pins.read_table(gen_shared_pins.inp_file, gen_shared_pins.head_lines)

    constants = ""
    registers = ""

    for p in psig_list:
        isigs = []

        # generate peripherial signal name
        if p['bit'] is None:
            psig = p['name']
        else:
            psig = p['name'] + '_' + p['bit']

        if p is psig_list[0]: 
            example_psig = psig

        # generate list of internal signal names
        for i in p['connections']:
            if i is not None:
                if i['bit'] is None:
                    isigs.append(i['name'])
                else:
                    isigs.append(i['name'] + '_' + i['bit'])
            else:
                isigs.append(None)

        if p is psig_list[0]:
            example_isig = isigs[0]

        # generate strings
        for isig in isigs:
            if isig is not None:
                constants += define_str.format(define='_'.join([psig,isig]).upper(), number=isigs.index(isig)) + '\n'

        constants += '\n'
        registers += '\n' + '\t' + struct_str.format(psig=psig)




    # ------------------------------------------------------------------------------------
    # generate output file 
    # ------------------------------------------------------------------------------------
    print('Generating source file...')        
    psig_buses = gen_shared_pins.create_bus(psig_list)
    isig_buses = gen_shared_pins.create_bus(isig_list)
    print('{} peripherial signals recognised, {} bus(es)'.format(len(psig_list),gen_shared_pins.count_buses(psig_buses)))
    print('{} internal signals recognised, {} bus(es)'.format(len(isig_list),gen_shared_pins.count_buses(isig_buses)))

    
    result = header_template.format(
        date=gen_shared_pins.date,
        author=gen_shared_pins.author,
        example_psig=example_psig.upper(),
        example_isig=example_isig.upper(),
        addr=shared_pins_apb_addr,
        constants=constants,
        registers=registers
        )

    with open(out_file,'w') as out:
        out.write(result)

    print('Done!')



if __name__ == '__main__':
    main()