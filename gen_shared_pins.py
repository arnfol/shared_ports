import csv
import re


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
	input  [{msb}:{lsb}] {name}_o,
	input  [{msb}:{lsb}] {name}_oe,
	output [{msb}:{lsb}] {name}_i,
'''

# psig
peripherial_port_templ = '''\
	output [{msb}:{lsb}] {name}_o,
	output [{msb}:{lsb}] {name}_oe,
	input  [{msb}:{lsb}] {name}_i,
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
		matr_o[{psig_num}] = \{{psig_o_connections}\};
		matr_oe[{psig_num}] = \{{psig_oe_connections}\};
{matr_ie}
'''

# both
matr_ie_templ = '''\
		if(matr_ie[{psig_num}][{isig_num}]) {isig_i} = {psig_i};
'''

# ---------------------------------------------------------------------------------
# functions
# ---------------------------------------------------------------------------------
# inserting suffixs and prefixs ('_o', '_i', etc.) in names with [] braces
def insert_suf(name, suffix, prefix=''):
	return re.sub(r'(\w+)(.*)',prefix+r'\1'+suffix+r'\2',name)


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
			psig = {}
			# parse external port names
			signal = re.findall(r'(\w+)', row[name_col])  # find name and if exist -- bit number

			psig['name'] = signal[0]
			psig['bit'] = None if len(signal) == 1 else signal[1]
			psig['connections'] = []
			psig['num'] = psig_num
			psig_num += 1

			psig['i'] = psig['name'] + '_i'
			psig['o'] = psig['name'] + '_o'
			psig['oe'] = psig['name'] + '_oe'
			if psig['bit'] != None:
				psig['i'] += '[' + psig['bit'] + ']'
				psig['o'] += '[' + psig['bit'] + ']'
				psig['oe'] += '[' + psig['bit'] + ']'


			for i in range(len(func_columns)):
				isig_fullname = re.findall(r'(\w+)', row[func_columns[i]])

				if len(isig_fullname) != 0:
					isig = {
					'name': isig_fullname[0], 
					'bit': None if len(isig_fullname) < 2 else isig_fullname[1], 
					'direction': row[func_dir_columns[i]], 
					'default': 0,
					}

					isig['i'] = isig['name'] + '_i'
					isig['o'] = isig['name'] + '_o'
					isig['oe'] = isig['name'] + '_oe'
					if isig['bit'] != None:
						isig['i'] += '[' + isig['bit'] + ']'
						isig['o'] += '[' + isig['bit'] + ']'
						isig['oe'] += '[' + isig['bit'] + ']'

					# rewrite oe with constant if pin is not bidirectional
					if isig['direction'] != 'oe':
						isig['oe'] = "1'b1" if isig['direction'] == 'o' else "1'b0"

					# check if it is already in a list
					for i in isig_list:
						if i['name'] == isig['name'] and i['bit'] == isig['bit']:
							break
					else:
						isig_list.append(isig)

					psig['connections'].append(isig)
				else:
					psig['connections'].append(None)


			psig_list.append(psig)

		return psig_list, sorted(isig_list,key=lambda k: k['name'])


def main():
	psig_list, isig_list = read_table(inp_file)

	connect_default = ""
	for signal in isig_list:
		connect_default += connect_default_templ.format(**signal)

	print(connect_default)


	connect_matr = ""
	for p in psig_list:

		matr_ie =""
		for i in p['connections']:
			if i is not None:
				matr_ie += matr_ie_templ.format(isig_i=i['i'],isig_num="***",psig_i=p['i'],psig_num=p['num'])

		print(matr_ie)

if __name__ == '__main__':
	main()