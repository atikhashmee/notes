What we know by the word "reference" is a copy of a address that point to something. 
for example 
```
$cat = 5; 
$dog = $cat; 
//now if i increase dog by its value 
$dog++; 
// dog = 5 but $cat is still = 5; 
// now if you want many reference to point to one particular value. then you could do it by reference; 
//we can do instead
$dog = &$cat; 
//now if you increase $dog++; 
then $cat = $dog= 6;  since they are both pointing to same variable. 
```
Array type in PHP

with the previous example and concept in mind we go ahead and see how array behave in php;

```
$hp = array(1,2,3); 
$php = &$hp;
array_push($php,4);
print_r($hp); //array(1,2,3,4)
print_r($php); //array(1,2,3,4)
//similar to previous examples

$myval = array();
function fillarray(array $val)
{   
   for($i=0;$i<10;$i++)
        array_push($val,$i);
}
fillarray($myval); 
print_r($myval);  //array() !!!!!!
```

What happened here? why the array is empty here? 
from the very basic concept we are again being familiar with scope concept, 
every variable created in the function is a local variable and get destroyed when the function execution is done;
so what's happening here is actually. the array value is being passed to the function and filled up but after the function execution complete it destroy the variable as it is

lets another example

 
```
$myval = array(10);
function fillarray(array $val)
{   
   for($i=0;$i<10;$i++)
        array_push($val,$i);
}
fillarray($myval); 
print_r($myval);  //array(10) !!!!!!
```

here why 10? because the array was filled up during the function call. but when the function execution was finished the variable was reset back to its previous value


let's explore another example

```
$myval = array(10);
function fillarray(array $val)
{   
   for($i=0;$i<10;$i++)
        array_push($val,$i);
  return $val;
}
$myval = fillarray($myval); 
print_r($myval);  //Array ( [0] => 10 [1] => 0 [2] => 1 [3] => 2 [4] => 3 [5] => 4 [6] => 5 [7] => 6 [8] => 7 [9] => 8 [10] => 9 )
```

What change did you notice here?  boom ! 
Note :  this has been possible because we return the array. and with return its appending the returned value to its existing value;
so final thought, in php array pass by value. 

but how do we fill up a global array variable by a function by passing the array in it?
let's see another example

```
$myval = array();
function fillarray(array &$val)
{   
   for($i=0;$i<10;$i++)
        array_push($val,$i);
}
 fillarray($myval); 
print_r($myval);  //Array ( [0] => 0 [1] => 1 [2] => 2 [3] => 3 [4] => 4 [5] => 5 [6] => 6 [7] => 7 [8] => 8 [9] => 9 )
```

wow! isn't this fantastic? with only one ampersand(&) sign we could achieve the goal. that's the power of reference type

So final note : whenever you try to fill up any global variable by passing that to a function use the reference type not value. otherwise you won't get your desired value

see a real life example, don't panic if you don't understand this yet. just see 




Object type in PHP
in php every object is a reference type: if you have ever coded in c/c++; then you will better understand how its reference type and pointer
I was afraid of using pointer in c/c++ at the beginning. but then it became super easy for me. 

okay so, from the little OOP concept. we know that whenever we create a class and create a new instance. the object is referenced to a memory address where our class or value are actually placed

and we can always use those property using this reference type object. this is pretty simple and straight forward. I am not going to jump into in details about that here. 
lets see an example

```
class Test{
   private $myvar = 10;
   public function doc()
   {
    echo " I am here";
   }

}

$obj = new Test();  //this is actually working like a pointer. its assigning the address of that memory where the class is stored. 
so we can call any property of that class using right arrow sign. like; obj->myvar;
```



Function type in PHP

have you ever wondered a function can be used as a variable? is it really possible ? 
the answer is YES,, its possible 
and this concept in the programming language has changed the many conventional programming concept or thinking. we will explore couple of example below

- A function  accepting another function as its argument
           
         this is something we know as a callback function. yes you heard the right term. we know this as a callback function. 
         if you have prior javascript programming concept then you would understand better what callback is.
         
```
     function cal($val1,$val2,callable $callback)
     {
           $callback($val1,$val2);   
      }
     //now we can perform any calculation with this little function
      function add($val1,$val2){ return $val1+$val2;}
      function sub($val1,$val2){ return $val1-$val2;}
      function mul($val1,$val2){ return $val1*$val2;}
      function mul($val1,$val2){ return $val1/$val2;}
       
     // okay now we are ready to use this in the real time example
     cal(5,4,add) // 10
     cal(5,4,sub) // 1
     cal(5,4,mul) // 20
     cal(5,4,div) // 1.25

```

-   A function is exactly working like a variable
      
```
           function &paypal()    //we are declaring function as a reference
            {
                $obj = new stdClass;
                $obj->url = "sending url string";
                $obj->path = "definiation";
                return $obj;
            }


            function configfunc(&$func)   //ad here accpeting as reference type variable
            {
                $obj = $func;
                $obj->hint = "hello world";
                echo $obj->hint."</br>";
                echo $obj->url."</br>";
                echo $obj->path."</br>";
            }


           configfunc(paypal());
```

