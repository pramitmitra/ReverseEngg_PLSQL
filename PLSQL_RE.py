# Driver Pgoram to call Git Download Module and File Parser Module 
#!/usr/bin/env python
import itertools
import os
import csv

range_of_tgt_clms = []
elements_of_tgt = []

range_of_src_clms = []
elements_of_src = []

exec(open("/Users/prammitr/Documents/my_projects/python/DownloadGitCode.py").read())

def search_target(file_name, string_to_search1, string_to_stop):
    line_number = 0
    # Open the file in read only mode
    with open(file_name, 'r') as read_obj:
        # Read all lines in the file one by one
        for line in read_obj:
            # For each line, check if line contains the string
            line_number += 1
            if string_to_search1 in line:
                range_of_tgt_clms.append((line_number+2))
            if string_to_stop in line:
              range_of_tgt_clms.append((line_number-3))
              break
 
    # Return list of tuples containing line numbers and lines where string is found
    print (*range_of_tgt_clms)
    #print (*list_of_results2)
    return range_of_tgt_clms



def printListTarget(list):
    with open('/Users/prammitr/Documents/my_projects/python/input_plSql.sql', "r") as text_file:
      #for line in itertools.islice(text_file, 15, 38):
      for line in itertools.islice(text_file, *range_of_tgt_clms):
        #elements_of_tgt.append((line.rstrip().lstrip()))
        elements_of_tgt.append((line))
        #print (line.rstrip().lstrip())
        

def writeTargetToExcel(list):
  with open('/Users/prammitr/Documents/my_projects/python/Target.csv','w') as f:
    f.write('\n'.join(list))


search_target('/Users/prammitr/Documents/my_projects/python/input_plSql.sql','insert', 'select')
printListTarget(range_of_tgt_clms)
# Sort elements_of_tgt list for matching record
elements_of_tgt.sort(reverse=False)
writeTargetToExcel(elements_of_tgt)




def search_source(file_name, string_to_start, string_to_stop):
    line_number = 0
    # Open the file in read only mode
    with open(file_name, 'r') as read_obj:
        # Read all lines in the file one by one
        for line in read_obj:
            # For each line, check if line contains the string
            line_number += 1
            if string_to_start in line:
                range_of_src_clms.append((line_number+1))
            if string_to_stop in line:
              range_of_src_clms.append((line_number-5))
              break
 
    # Return list of tuples containing line numbers and lines where string is found
    print (*range_of_src_clms)
    return range_of_src_clms 


def printListSource(list):
    with open('/Users/prammitr/Documents/my_projects/python/input_plSql.sql', "r") as text_file:
      for line in itertools.islice(text_file, *range_of_src_clms):
        #elements_of_tgt.append((line.rstrip().lstrip()))
        elements_of_src.append((line))
        #print (line.rstrip().lstrip())
        

def writeSourceToExcel(list):
  with open('/Users/prammitr/Documents/my_projects/python/Source.csv','w') as f:
    f.write('\n'.join(list))   


 
search_source('/Users/prammitr/Documents/my_projects/python/input_plSql.sql','$.data[*]', 'ROWCOUNT')
printListSource(range_of_tgt_clms)
# Sort elements_of_src list for matching record
elements_of_src.sort(reverse=False)
writeSourceToExcel(elements_of_src)

test_dict = dict(zip(elements_of_src, elements_of_tgt))
res = [] 
for key, value in ( 
        itertools.chain.from_iterable( 
            [itertools.product((k, ), v) for k, v in test_dict.items()])): 
                res.append(value) 

#csv_file="/Users/prammitr/Documents/my_projects/output.csv"', 'wb') as output:"

with open('/Users/prammitr/Documents/my_projects/python/dict.csv', 'w', newline="") as csv_file:  
    writer = csv.writer(csv_file)
    for key, value in test_dict.items():
       writer.writerow([key, value])

os.system("awk 'NR%3' /Users/prammitr/Documents/my_projects/python/dict.csv > /Users/prammitr/Documents/my_projects/python/output.csv")
