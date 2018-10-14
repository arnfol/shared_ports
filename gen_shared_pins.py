import csv
import re
import itertools

module_name = 'shared_pins'
inp_file = 'pins_mux_table.csv'
out_file = module_name + '.sv'

# Number of header lines
head_lines = 0

# Column numbers
name_col = 0
func_columns = [1, 3, 5, 7]
func_dir_columns = [2, 4, 6, 8]

# isig
internal_port_templ = '''\
	input        [{msb}:{lsb}] {name}_o,
	input        [{msb}:{lsb}] {name}_oe,
	output logic [{msb}:{lsb}] {name}_i,
'''

# psig
peripherial_bus_templ = '''\
	output logic [{msb}:{lsb}] {name}_o,
	output logic [{msb}:{lsb}] {name}_oe,
	input        [{msb}:{lsb}] {name}_i,
'''

peripherial_port_templ = '''\
	output logic {name}_o,
	output logic {name}_oe,
	input        {name}_i,
'''

mux_control_templ = '''
	assign {o} = matr_o[{num}][port_mode[{num}]]; 
	assign {oe} = matr_oe[{num}][port_mode[{num}]]; 
	always_comb begin 
		matr_ie[{num}] = '0;
		matr_ie[{num}][port_mode[{num}]] = 1;
	end
'''

# isig
connect_default_templ = '''\
		{i} = {default};
'''

# psig
connect_matr_templ = '''\
		matr_o[{num}] = {{{o_connections}}};
		matr_oe[{num}] = {{{oe_connections}}};
{matr_ie}
'''

# both
matr_ie_templ = '''\
		if(matr_ie[{psig_num}][{isig_num}]) {isig_i} = {psig_i};
'''

# ---------------------------------------------------------------------------------
# read csv table
# ---------------------------------------------------------------------------------
def read_table(file, headlines=0):
	with open(file, newline='') as f:
		table = csv.reader(f, delimiter=';', skipinitialspace=True)

		# skip header
		for i in range(headlines):
			next(table, None)

		isig_list = []
		psig_list = []
		psig_num = 0

		# handle each row in table
		for row in table:
			# parse external port names
			signal = re.findall(r'(\w+)', row[name_col])  # find name and if exist -- bit number

			psig = {
			'name' : signal[0],
			'bit' : None if len(signal) == 1 else signal[1],
			'connections' : [],
			'num' : psig_num
			}
			psig_num += 1

			psig['i'] = '{name}_i[{bit}]'.format(**psig) if psig['bit'] != None else psig['name']+'_i'
			psig['o'] = '{name}_o[{bit}]'.format(**psig) if psig['bit'] != None else psig['name']+'_o'
			psig['oe'] = '{name}_oe[{bit}]'.format(**psig) if psig['bit'] != None else psig['name']+'_oe'

			for i in range(len(func_columns)):
				isig_fullname = re.findall(r'(\w+)', row[func_columns[i]])

				if len(isig_fullname) != 0:
					isig = {
					'name': isig_fullname[0], 
					'bit': None if len(isig_fullname) < 2 else isig_fullname[1], 
					'direction': row[func_dir_columns[i]], 
					'default': 0,
					}

					isig['i'] = '{name}_i[{bit}]'.format(**isig) if isig['bit'] != None else isig['name']+'_i'
					isig['o'] = '{name}_o[{bit}]'.format(**isig) if isig['bit'] != None else isig['name']+'_o'
					isig['oe'] = '{name}_oe[{bit}]'.format(**isig) if isig['bit'] != None else isig['name']+'_oe'

					# rewrite oe with constant if pin is not bidirectional
					if isig['direction'] != 'io' and isig['direction'] != 'oi':
						if isig['direction'] == 'i' : 
							isig['o'] = "1'b0"
							isig['oe'] = "1'b0"
						else:
							isig['i'] = None
							isig['oe'] = "1'b1"

					# check if it is already in a list
					for i in isig_list:
						if i['name'] != isig['name'] or i['bit'] != isig['bit']:
							isig_list.append(isig)

					psig['connections'].append(isig)
				else:
					psig['connections'].append(None)


			psig_list.append(psig)

		return psig_list, sorted(isig_list,key=lambda k: k['name'])


def main():
	# ------------------------------------------------------------------------------------
	# read configuration table
	# ------------------------------------------------------------------------------------
	psig_list, isig_list = read_table(inp_file)

	# ------------------------------------------------------------------------------------
	# generate parts of output file
	# ------------------------------------------------------------------------------------
	mux_control = ""
	for signal in psig_list:
		mux_control += mux_control_templ.format(**signal)

	connect_default = ""
	for signal in isig_list:
		connect_default += connect_default_templ.format(**signal)

	connect_matr = ""
	# to do: make it one-line
	def conn(item, field):
		if item is None:
			return "1'b0"
		else:
			return item[field]

	for p in psig_list:
		matr_ie =""
		for i in p['connections']:
			if i is not None and i['i'] is not None:
				matr_ie += matr_ie_templ.format(isig_i=i['i'],isig_num=p['connections'].index(i),psig_i=p['i'],psig_num=p['num'])

		print(' '.join([i['oe'] for i in p['connections'] if i is not None]))
		p['oe_connections'] = ', '.join([conn(x,'oe') for x in p['connections']])
		p['o_connections'] = ', '.join([conn(x,'o') for x in p['connections']])
		connect_matr += connect_matr_templ.format(matr_ie=matr_ie,**p)

	# print(connect_matr)

	def ranges(i):
	    for a, b in itertools.groupby(enumerate(i), lambda x: x[0]-x[1]):
	        b = list(b)
	        yield b[0][1], b[-1][1]


	peripherial_signals = ""
	psig_buses = {}

	# make dict with all bits in a buses
	for p in psig_list:
		if p['bit'] == None:
			psig_buses[p['name']] = None
		elif p['name'] in psig_buses:
			psig_buses[p['name']].append(int(p['bit']))
		else:
			psig_buses[p['name']] = [int(p['bit'])]

	# compress bits numbers into bits ranges
	for b in psig_buses:
		if psig_buses[b] != None:
			psig_buses[b] = list(ranges(psig_buses[b]))

	for bus in psig_buses:
		if psig_buses[bus] is None:
			peripherial_signals += peripherial_port_templ.format(name=bus)
		else:
			for subrange in psig_buses[bus]:
				peripherial_signals += peripherial_bus_templ.format(name=bus,msb=subrange[1],lsb=subrange[0])

	print(peripherial_signals)
	# peripherial_port_templ = '''\
	# 	output [{msb}:{lsb}] {name}_o,
	# 	output [{msb}:{lsb}] {name}_oe,
	# 	input  [{msb}:{lsb}] {name}_i,
	# '''


	internal_signals = ""

	# ------------------------------------------------------------------------------------
	# generate output file 
	# ------------------------------------------------------------------------------------
	with open('shared_pins.txt','r') as template:
		result = template.read().format(
			module_name=module_name,
			internal_signals=internal_signals,
			peripherial_signals=peripherial_signals, 
			psignal_max=len(psig_list)-1,
			isignal_clog2_max=(len(func_columns)-1).bit_length()-1, 
			mux_control=mux_control,
			connect_default=connect_default,
			connect_matr=connect_matr)
		with open(out_file,'w') as out:
			out.write(result)

if __name__ == '__main__':
	main()