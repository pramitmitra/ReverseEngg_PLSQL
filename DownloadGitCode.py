# Suppoting code to download git repo.
import os
import subprocess

args = ['git', 'clone', '--depth=1', 'git@github.com:pramitmitra/ReadingNotes.git']
res = subprocess.Popen(args, stdout=subprocess.PIPE)
output, _error = res.communicate()
os.system('cp /Users/prammitr/Documents/my_projects/python/ReadingNotes/input_plSql.sql /Users/prammitr/Documents/my_projects/python/input')
os.system('rm -rf /Users/prammitr/Documents/my_projects/python/ReadingNotes')

if not _error:
    print(output)
else:
    print(_error)


