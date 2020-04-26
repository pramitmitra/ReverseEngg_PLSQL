#!/usr/bin/env python
import itertools
import csv

list_of_results1 = []
elements_of_result1 = []

def search_string_in_file(file_name, string_to_search1, string_to_search2):
    line_number = 0
    
    list_of_results2 = []
    # Open the file in read only mode
    with open(file_name, 'r') as read_obj:
        # Read all lines in the file one by one
        for line in read_obj:
            # For each line, check if line contains the string
            line_number += 1
            if string_to_search1 in line:
                list_of_results1.append((line_number))
            if 'select' in line:
              list_of_results1.append((line_number-2))
              break
 
    # Return list of tuples containing line numbers and lines where string is found
    print (*list_of_results1)
    print (*list_of_results2)
    return list_of_results1

def printList(list):
    with open('/Users/prammitr/Documents/my_projects/input_plSql.sql', "r") as text_file:
      #for line in itertools.islice(text_file, 15, 38):
      for line in itertools.islice(text_file, *list_of_results1):
        #elements_of_result1.append((line.rstrip().lstrip()))
        elements_of_result1.append((line))
        #print (line.rstrip().lstrip())
        

def writeSourceToExcel(list):
  with open('/Users/prammitr/Documents/my_projects/Source.csv','w') as f:
    f.write('\n'.join(list))


search_string_in_file('/Users/prammitr/Documents/my_projects/input_plSql.sql','insert','JSON_TABLE')
printList(list_of_results1)
writeSourceToExcel(elements_of_result1)



  

