#!/bin/bash

zipFilePath="$HOME/supplierZipFiles"

serverUsername="forge"
serverAddresss="18.138.48.190"
targetFolder="*.com/storage"
targetSearch="9c88f6a1-3dac-447f-80d0-84e3af824ac4"


if [ -d "$zipFilePath" ]; then
   rm -r $zipFilePath
fi

mkdir $zipFilePath

findQuery="find $targetFolder -type f -name '*$targetSearch*'"

# Print debug information
echo "Debug: SSH Command: ssh $serverUsername@$serverAddress \"$findQuery\""

results=$(ssh $serverUsername@$serverAddresss "$findQuery")

if [ $? -ne 0 ];then
        echo "error command failed"
        exit 1
fi


totalResult=$(ls  -l "$results" | wc -l)
totalResultArr=("$totalResult")

foundResults=()
for dir in $results; do
    foundResults+=($dir)
done



for eachDir in ${foundResults[@]}; do
    rsync -avz --progress --relative $serverUsername@$serverAddresss:$eachDir $zipFilePath'/'
done
#echo ${#totalResultArr[@]}


#printf '%s' $results
#printf '%s' ${foundResults[@]}
