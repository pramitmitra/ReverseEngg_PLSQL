#https://towardsdatascience.com/mastering-dates-and-timestamps-in-pandas-and-python-in-general-5b8c6edcc50c

#https://wiki.python.org/moin/SimplePrograms
# print ('Hello, world!')

#2 lines: Input, assignment
# name = input('What is your name?\n')
# print ('Hi, %s.' % name)

#3 lines: For loop, built-in enumerate function, new style formatting
# friends = ['john', 'pat', 'gary', 'michael']
# for i, name in enumerate(friends):
#     print ("iteration {iteration} is {name}".format(iteration=i, name=name))


#4 lines: Fibonacci, tuple assignment
# parents, babies = (1, 1)
# while babies < 100:
#     print ('This generation has {0} babies'.format(babies))
#     parents, babies = (babies, parents + babies)


#5 lines: Functions
# def greet(name):
#     print ('Hello', name)

# greet('Jack')
# greet('Jill')
# greet('Bob')


#6 lines: Import, regular expressions
# Regular Expression to Validat Stuff
# import re
# for test_string in ['555-1212', 'ILL-EGAL']:
#     if re.match(r'^\d{3}-\d{4}$', test_string):
#         print (test_string, 'is a valid US local phone number')
#     else:
#         print (test_string, 'rejected')


#8  lines: Command line arguments, exception handling
# import sys
# try:
#     total = sum(int(arg) for arg in sys.argv[1:])
#     print ('sum =', total)
# except ValueError:
#     print ('Please supply integer arguments')

#10 lines: Time, conditionals, from..import, for..else
# from time import localtime

# activities = {8: 'Sleeping',
#               9: 'Commuting',
#               17: 'Working',
#               18: 'Commuting',
#               20: 'Eating',
#               22: 'Resting' }

# time_now = localtime()
# hour = time_now.tm_hour

# for activity_time in sorted(activities.keys()):
#     if hour < activity_time:
#         print (activities[activity_time])
#         break
# else:
#     print ('Unknown, AFK or sleeping!')



import pandas as pd
df = pd.DataFrame({'date': ['2018-08-09 11:10:55','2019-03-02 13:15:21']})
print (df)