import string
input_file = open("tree.ged", 'r')
output_file = open("database.pl", 'w')
husb_id = "DEFAULT VALUE"
wife_id = "DEFAULT VALUE"
name = "DEFAULT VALUE"
surname = "DEFAULT VALUE"
sex = "DEFAULT VALUE"
n = 1
table = dict() 
for input_string in input_file:
    if input_string == "\n":
        continue
    elif input_string.find("NAME", 0, len(input_string)) > -1:
        i = input_string.index("/", 0, len(input_string))
        name = input_string[7:i - 1] 

    elif input_string.find("_MARNM", 0, len(input_string)) > -1:
        surname = input_string[9:len(input_string) - 1] 
        name = name.lower()
        surname = surname.lower()
        table[n] = name + "_" + surname
        n = n + 1

    elif input_string.find("SURN", 0, len(input_string)) > -1:
        surname = input_string[7:len(input_string) - 1]
        name = name.lower()
        surname = surname.lower()
        table[n] = name + '_' + surname
        n = n + 1

    elif input_string.find("SEX", 0, len(input_string)) > -1:
        sex = input_string[6:len(input_string) - 1]
        name = name.lower()
        surname = surname.lower()
        sex = sex.lower()
        if sex == 'm':
            sex = 'male'
        else:
            sex = 'female'
        output_file.write("sex({0}_{1}, {2}).\n".format(name, surname, sex))

    elif input_string.find("HUSB", 0, len(input_string)) > -1:
        i = input_string.index("I", 0, len(input_string))
        husb_id = input_string[i+1:len(input_string) - 2]

    elif input_string.find("WIFE", 0, len(input_string)) > -1:
        i = input_string.index("@", 0, len(input_string))
        wife_id = input_string[i+2:len(input_string) - 2] 

    elif input_string.find("CHIL", 0, len(input_string)) > -1:
        i = input_string.index("@", 0, len(input_string))
        child_id = input_string[i+2:len(input_string) - 2] 
        output_file.write("parent({0}, {1}).\n".format(table[int(husb_id)], table[int(child_id)]))
        output_file.write("parent({0}, {1}).\n".format(table[int(wife_id)], table[int(child_id)]))

#print table.viewkeys()
#print table.viewvalues()
#print table.viewitems
#for i in table:
#    print("{0} {1}").format(i, table[i])

input_file.close()
output_file.close()
table.clear()