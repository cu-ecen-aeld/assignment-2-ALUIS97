#!/bin/bash


writefile=$1                            
writestr=$2




if [ $# -lt 2 ]                         
then                                    
        echo "Some arguments are missing"
	exit 1
fi

#Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

touch $writefile >/dev/null 2>&1

if [ $? -eq 0 ]
then
	echo exists
	#the file (path) exists what is it ? directory or file?
	if [ -d $writefile ]
	then
		echo the path has no been created due to it is just a directory
		exit 1
	else
		echo $writestr > $writefile
	fi
fi

touch $writefile >/dev/null 2>&1
if [ $? -eq 1 ]
then
	echo doesnt exists
	if [[ "$writefile" =~ /$ ]]
	then
		echo the path has no been created due to it is just a directory
		exit 1
	else
		mkdir -p  $(dirname $writefile)
		echo directory created
		echo $writestr > $writefile
	fi

fi


