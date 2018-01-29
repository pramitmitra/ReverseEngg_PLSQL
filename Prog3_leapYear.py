### Calculate a year is leap year or not

year=1992
ly='false'

# Write your logic here
if year % 400 == 0:
    ly = True
elif year % 100 == 0:
    ly = False
elif year % 4 == 0:
    ly = True

print(ly)
