# Problem Statement:

 : /Users/prammitr/Documents/my_projects/python/logs 
(base) ->/Users/prammitr-mac/opt/anaconda3/bin/python /Users/prammitr/Documents/my_projects/python/PLSQL_RE.py
Traceback (most recent call last):
  File "/Users/prammitr/Documents/my_projects/python/PLSQL_RE.py", line 13, in <module>
    base_path = config['DEFAULT']['BASE_PATH']
  File "/Users/prammitr-mac/opt/anaconda3/lib/python3.7/configparser.py", line 1251, in __getitem__
    raise KeyError(key)
KeyError: 'BASE_PATH'

# Solution:

 : /Users/prammitr/Documents/my_projects/python 
(base) ->find . -name \*.pyc -delete
