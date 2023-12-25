filename should be with `.sh` extension

can run with `bash filename.sh` or just `./filename.sh`

but when you run `./filename.sh` it will give you permission error. 
just simply give the permission to execute the file following command

`sudo chmod u+x filename.sh`

now run 

`./filename.sh`

## Variable

variable is unlike other programming language. there is no data type. just assign value to variable and then use it with `$` sign. 
for example: 

```
number=10
echo $number
//10
```
##### Note: notice that there is no space around the variable and value. this is important!

## Condition statement
```
if [ //conditional logic ]; then
elif [ //conditional logic ];
else
fi
```
 

