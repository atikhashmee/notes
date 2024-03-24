#!/bin/bash

zipFilePath="$HOME/supplierZipFiles"

buckets=($(aws s3api list-buckets | jq -r '.Buckets[].Name'))
buckets+=("quit")

if [ -d "$zipFilePath" ]; then
   rm -r $zipFilePath
fi

mkdir $zipFilePath

select opt in "${buckets[@]}"; do
       case $REPLY in
         $REPLY) 
          break
        ;;
       esac
done

userchosenbucketoption=$REPLY
chosenbucket=${buckets[$userchosenbucketoption - 1]}

if [ "$chosenbucket" == "quit" ]; then
    echo "bye"
    exit 0 
fi

read -p "Enter start date for data: " userInputStartDate
read -p "Enter end date for data: " userInputEndDate
read -p "Enter file name to look for:" lookForFilename

queryStartDate=$userInputStartDate
queryEndDate=$userInputEndDate

if [ -z "$lookForFilename" ]; then
    echo "Filename can't not be empty"
    exit 1
fi

function getS3Objects {
        local chosenbucket=$1
        local queryStartDate=$2
        local queryEndDate=$3
	listOfItems=($(aws s3api list-objects --bucket "$chosenbucket" \
	 --query "Contents[?LastModified >= '$queryStartDate' && LastModified < '$queryEndDate']" | jq -r '.[].Key'))


	for item in "${listOfItems[@]}"; do
	    fileName=$(basename "$item")
	    aws s3api get-object \
	     --bucket "$chosenbucket" \
	     --key  "$item" \
	     "$zipFilePath/$fileName"
	done
}

getS3Objects "$chosenbucket" "$queryStartDate" "$queryEndDate"


#fileName="9b9ecf65-03b9-474b-8d47-1bfc89cb548c"
fileName="$lookForFilename"

tempFolder="tempFolder"
#check if the directory already exist if then remove it
if [ -d "$tempFolder" ]; then
    rm -r "$tempFolder"
fi
mkdir "$tempFolder" 

files=$(ls "$zipFilePath")

fileCount=$(ls -l "$zipFilePath" | wc -l)
foundZipNames=()

for file in ${files[@]}; do
   searchOutPut=$(unzip -l "$zipFilePath/$file" | grep "$fileName")
   searchOutPutFileCount=$(unzip -l "$zipFilePath/$file" | grep "$fileName" | wc -l)
   if [ "$searchOutPutFileCount" -gt "0" ]; then
           : '
	   echo "opening ..... $zipFilePath/$file"
           echo "$searchOutPut" 
           '
           foundZipNames+=("$zipFilePath/$file")
   fi
done

for foundFileName in "${foundZipNames[@]}";  do
   tempFolderName=$(basename "$foundFileName" |  cut -d'.' -f1) 
   tempFolderFulpath="$tempFolder/$tempFolderName"
   mkdir "$tempFolderFulpath"
   unzip "$foundFileName" -d "$tempFolderFulpath/"   
done

find "$tempFolder" -iname "*$fileName*" | cpio -o > output.cpio


rm -r "$tempFolder"
