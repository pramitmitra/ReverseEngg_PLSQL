import os
import subprocess

args = ['git', 'clone', '--depth=1', 'git@github.com:pramitmitra/python.git']
res = subprocess.Popen(args, stdout=subprocess.PIPE)
output, _error = res.communicate()
os.system('cp /Users/prammitr/Documents/my_projects/python/input_plSql.sql /Users/prammitr/Documents/my_projects/')
os.system('rm -rf /Users/prammitr/Documents/my_projects/python/')

if not _error:
    print(output)
else:
    print(_error)
