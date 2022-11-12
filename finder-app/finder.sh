#!/bin/bash


#Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

filesdir=$1
searchstr=$2


# Exits with return value 1 error and print statements if any of the parameters above were not specified


if [ $# -lt 2 ]
then
	echo "Some arguments are missing"

else
	#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

	if [ ! -d $filesdir ]
	then
		echo "This is not a directory in the system"
	fi
fi	

#Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files

echo The number of files are $(find $filesdir -type f | wc -l) and the number of matching lines are $(grep -r $searchstr $filesdir | wc -l)


