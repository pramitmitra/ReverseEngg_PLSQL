# Suppoting code to download git repo.
import os
import subprocess
import configparser

config = configparser.ConfigParser()
config.read('pyconfig.ini')
GIT_REPO = config['DEFAULT']['GIT_REPO'] 
args = ['git', 'clone', '--depth=1', 'git@github.com:pramitmitra/ReadingNotes.git']
#args = ['git', 'clone', '--depth=1', GIT_REPO]
res = subprocess.Popen(args, stdout=subprocess.PIPE)
output, _error = res.communicate()
os.system('cp /Users/prammitr/Documents/my_projects/python/ReadingNotes/input_plSql.sql /Users/prammitr/Documents/my_projects/python/input')
os.system('rm -rf /Users/prammitr/Documents/my_projects/python/ReadingNotes')

if not _error:
    print(output)
else:
    print(_error)