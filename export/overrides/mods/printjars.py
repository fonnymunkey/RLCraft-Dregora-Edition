import os
path = os.getcwd()
files = os.listdir(path)

fp = open("jarlist.txt", 'w')
for f in files:
    splitname = os.path.basename(f).rsplit(".",1)
    if(splitname[len(splitname)-1] == "jar"):
        zip_file_name = splitname[0]
        print(zip_file_name)
        print(zip_file_name, file=fp)
fp.close()
print('Done Writing')
